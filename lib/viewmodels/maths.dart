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

  static const bonusCheat = <CheatInput>[
    CheatInput.help,
    CheatInput.help,
    CheatInput.help,
    CheatInput.help,
    CheatInput.score(111),
    CheatInput.score(111),
    CheatInput.help,
    CheatInput.help,
    CheatInput.score(19),
    CheatInput.score(19),
    CheatInput.score(19),
  ];
  static const bonusCheatDebug = <CheatInput>[
    CheatInput.score(2),
  ];
  static const unlockCheat = <CheatInput>[
    CheatInput.help,
    CheatInput.help,
    CheatInput.score(51),
    CheatInput.score(51),
    CheatInput.score(51),
    // TODO: Make the unlock cheat difficult to understand
  ];
  static const unlockCheatDebug = <CheatInput>[
    CheatInput.score(1),
  ];

  // Services:
  final _localStorage = locator<LocalStorageService>();

  // Data:
  late int _score;
  late int _puzzleIndex;
  var _puzzle = MathsPuzzle.empty;
  var _feedbackType = FeedbackType.positive;
  String? _feedbackText;
  var _showHelp = false;
  var _currentInput = <String>[];
  final _cheatInput = <CheatInput>[];
  bool _flashingInputFlag = true;

  // Getters:
  int get score => _score;

  int get puzzleIndex => _puzzleIndex;

  MathsPuzzle get puzzle => _puzzle;

  FeedbackType get feedbackType => _feedbackType;

  String? get feedbackText => _feedbackText;

  bool get showHelp => _showHelp;

  List<String> get currentInput => _currentInput;

  bool get showUnlockCheat => !_localStorage.hasUnlockedGame3;

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
    if (_puzzleIndex < mathsPuzzles.length) {
      _puzzle = mathsPuzzles[_puzzleIndex];
    } else if (_puzzleIndex == mathsPuzzles.length && kDebugMode) {
      _puzzle = const MathsPuzzle(
        equation: 'END OF PRE # DEFINED PUZZLES',
        solution: ['/'],
      );
        log('Reached end of content');
        Get.offAndToNamed(AppRoutes.credits, arguments: isTheEnd);
        return;
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
        // INFO: Does not reset `puzzleIndex`.
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

    if (_cheatInput.endsWith(bonusCheat) ||
        (kDebugMode && _cheatInput.endsWith(bonusCheatDebug))) {
      log('Cheat activated: BONUS');
      _cheatInput.add(const CheatInput.score(-1));
      score += 500;
    } else if (_cheatInput.endsWith(unlockCheat) ||
        (kDebugMode && _cheatInput.endsWith(unlockCheatDebug))) {
      log('Cheat activated: UNLOCK');
      _cheatInput.add(const CheatInput.score(-1));
      // TODO: Unlock next game/app.
    }
  }
}
