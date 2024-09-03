import 'dart:developer' show log;

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../constants/enums/feedback_type.dart';
import '../constants/enums/game.dart';
import '../constants/predefined_puzzles.dart';
import '../core/locator.dart';
import '../models/cheat_input.dart';
import '../models/directions_puzzle.dart';
import '../services/local_storage.dart';
import '../utils/list.dart';
import 'base.dart';

class DirectionsGameViewModel extends BaseViewModel {
  // Constants:
  static const exitCheat = <CheatInput>[
    CheatInput.score(21),
    CheatInput.score(21),
    CheatInput.score(21),
    CheatInput.help,
    CheatInput.help,
  ];
  static const bonusCheat = <CheatInput>[
    CheatInput.help,
    CheatInput.help,
    CheatInput.help,
    CheatInput.help,
    CheatInput.score(28),
    CheatInput.score(28),
    CheatInput.help,
    CheatInput.help,
    CheatInput.help,
    CheatInput.score(12),
    CheatInput.score(12),
    CheatInput.score(12),
  ];
  static const exitCheatDebug = <CheatInput>[
    CheatInput.score(1),
  ];
  static const bonusCheatDebug = <CheatInput>[
    CheatInput.score(2),
  ];

  // Services:
  final _localStorage = locator<LocalStorageService>();

  // Data:
  late int _score;
  late int _puzzleIndex;
  late int _levelIndex;
  var _puzzle = DirectionsPuzzle.empty;
  var _feedbackType = FeedbackType.positive;
  String? _feedbackText;
  var _showHelp = false;
  final _cheatInput = <CheatInput>[];

  // Getters:
  int get score => _score;

  DirectionsPuzzle get puzzle => _puzzle;

  FeedbackType get feedbackType => _feedbackType;

  String? get feedbackText => _feedbackText;

  bool get showHelp => _showHelp;

  bool get showExitCheat => !_localStorage.hasUnlockedMenu;

  // Setters:
  set score(int newScore) {
    _score = newScore;
    _localStorage.setGameScore(
      game: Game.directions,
      newScore: newScore,
    );
    notifyListeners();
  }

  set showHelp(bool shouldShowHelp) {
    _showHelp = shouldShowHelp;
    notifyListeners();
  }

  // Methods:
  void initialize() {
    _score = _localStorage.score[Game.directions.index];
    _puzzleIndex = 0;
    _levelIndex = _localStorage.level[Game.maths.index];
    updatePuzzle();
  }

  void updatePuzzle() {
    if (_levelIndex == 0) {
      if (_puzzleIndex < directionsPuzzles.length) {
        _puzzle = directionsPuzzles[_puzzleIndex];
      } else {
        _puzzle = DirectionsPuzzle.random();
      }

      if (_puzzleIndex == directionsPuzzles.length + 5) {
        _localStorage.setGameLevel(
          game: Game.maths,
          newLevel: 1,
        );
        log('Reached level 1');
      }
    } else {
      _puzzle = DirectionsPuzzle.random();
    }

    log('Instructions: ${_puzzle.instructions}');
    notifyListeners();
  }

  Future<void> onInput((int, int) tapLocation) async {
    if (_showHelp) {
      showHelp = false;
      // INFO: This doesn't add a cheat input!
      return;
    }

    log('Pressed $tapLocation');

    if (tapLocation == _puzzle.solution) {
      _feedbackType = FeedbackType.positive;
      _feedbackText = 'yes';
      _puzzleIndex++;
      score++;
    } else {
      _feedbackType = FeedbackType.negative;
      _feedbackText = 'no';
      score = 0;
    }

    await Future.delayed(const Duration(milliseconds: 400));
    updatePuzzle();

    await Future.delayed(const Duration(milliseconds: 400));
    _feedbackText = null;
    notifyListeners();
  }

  void onHelpTap() {
    showHelp = !_showHelp;
    addCheatInput(CheatInput.help);
  }

  void addCheatInput(CheatInput input) {
    log('Pressed: $input');
    _cheatInput.add(input);

    if (_cheatInput.endsWith(exitCheat) ||
        (kDebugMode && _cheatInput.endsWith(exitCheatDebug))) {
      log('Cheat activated: EXIT');
      _cheatInput.add(const CheatInput.score(-1));
      _localStorage.hasUnlockedMenu = true;

      notifyListeners();
      Future.delayed(const Duration(milliseconds: 100), Get.back);
    } else if (_cheatInput.endsWith(bonusCheat) ||
        (kDebugMode && _cheatInput.endsWith(bonusCheatDebug))) {
      log('Cheat activated: BONUS');
      _cheatInput.add(const CheatInput.score(-1));
      score += 500;
    }
  }
}
