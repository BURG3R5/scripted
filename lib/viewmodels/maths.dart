import 'dart:async';
import 'dart:developer' show log;

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../constants/enums/feedback_type.dart';
import '../constants/enums/game.dart';
import '../constants/predefined_puzzles.dart';
import '../constants/strings.dart';
import '../core/locator.dart';
import '../core/router.dart';
import '../models/cheat_input.dart';
import '../models/maths_puzzle.dart';
import '../services/local_storage.dart';
import '../utils/list.dart';
import 'base.dart';

class MathsGameViewModel extends BaseViewModel {
  // Constants:
  static const flashingDuration = Duration(milliseconds: 700);

  static const utilityCheat = <CheatInput>[
    CheatInput.help,
    CheatInput.help,
    CheatInput.score(51),
    CheatInput.score(51),
    CheatInput.score(51),
  ];
  static const bonusCheat = <CheatInput>[
    CheatInput.help,
    CheatInput.help,
    CheatInput.help,
    CheatInput.help,
    CheatInput.score(19),
    CheatInput.score(19),
    CheatInput.help,
    CheatInput.help,
    CheatInput.score(33),
    CheatInput.help,
    CheatInput.help,
    CheatInput.help,
    CheatInput.score(33),
    CheatInput.score(33),
  ];
  static const utilityCheatDebug = <CheatInput>[
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
  var _puzzle = MathsPuzzle.empty;
  var _feedbackType = FeedbackType.positive;
  String? _feedbackText;
  var _showHelp = false;
  final _cheatInput = <CheatInput>[];
  var _currentInput = <String>[];
  bool _flashingInputFlag = true;

  // Getters:
  int get score => _score;

  MathsPuzzle get puzzle => _puzzle;

  FeedbackType get feedbackType => _feedbackType;

  String? get feedbackText => _feedbackText;

  bool get showHelp => _showHelp;

  bool get showUtilityCheat => !_localStorage.hasUnlockedGame3;

  List<String> get currentInput => _currentInput;

  bool get flashingInputFlag => _flashingInputFlag;

  // Setters:
  set score(int newScore) {
    _score = newScore;
    _localStorage.setGameScore(
      game: Game.maths,
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
    _score = _localStorage.score[Game.maths.index];
    _puzzleIndex = 0;
    _levelIndex = _localStorage.level[Game.maths.index];
    updatePuzzle();

    Timer.periodic(
      flashingDuration,
      (_) {
        _flashingInputFlag = !_flashingInputFlag;
        notifyListeners();
      },
    );
  }

  void updatePuzzle() {
    if (_levelIndex == 0) {
      if (_puzzleIndex < mathsPuzzles.length) {
        _puzzle = mathsPuzzles[_puzzleIndex];
      } else {
        _puzzle = MathsPuzzle.random();
      }

      if (_puzzleIndex == mathsPuzzles.length + 5) {
        _localStorage.setGameLevel(
          game: Game.maths,
          newLevel: 1,
        );
        log('Reached level 1');
        log('Reached end of content');
        Get.offAndToNamed(AppRoutes.credits, arguments: isTheEnd);
        return;
      }
    } else {
      _puzzle = MathsPuzzle.random();
    }

    _currentInput = List.filled(_puzzle.solution.length, '?');

    log('Equation: $_puzzle');
    notifyListeners();
  }

  Future<void> onInput(int inputFieldIndex, String input) async {
    if (_showHelp) {
      showHelp = false;
      // INFO: This doesn't add a cheat input!
      return;
    }

    _currentInput[inputFieldIndex] = input;
    log('Entered $input in field $inputFieldIndex');
    notifyListeners();

    if (!_currentInput.contains('?')) {
      if (listEquals(_currentInput, _puzzle.solution)) {
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
  }

  void onHelpTap() {
    showHelp = !_showHelp;
    addCheatInput(CheatInput.help);
  }

  void addCheatInput(CheatInput input) {
    log('Pressed: $input');
    _cheatInput.add(input);

    if (_cheatInput.endsWith(utilityCheat) ||
        (kDebugMode && _cheatInput.endsWith(utilityCheatDebug))) {
      log('Cheat activated: UTILITY (UNLOCK GAME 3 and EXIT)');
      _cheatInput.add(const CheatInput.score(-1));
      if (!_localStorage.hasUnlockedGame3) {
        _localStorage.hasUnlockedGame3 = true;
        _localStorage.setGameLevel(
          game: Game.maths,
          newLevel: 1,
        );
        log('Reached level 1');
      }

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
