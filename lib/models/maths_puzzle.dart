import 'package:flutter/foundation.dart';

import '../constants/predefined_puzzles.dart';
import '../utils/random.dart';
import '../utils/string.dart';

@immutable
class MathsPuzzle {
  const MathsPuzzle({
    required this.equation,
    required this.solution,
  });

  /// A string representing the puzzle equation.
  /// Any characters replaced by a "?" are interpreted as numeric input fields.
  /// Any characters replaced by a "#" are interpreted as operation input fields.
  final String equation;

  /// The required digit/operator in each respective
  /// input field for the puzzle to be correct.
  final List<String> solution;

  /// A 'default' null puzzle
  static const empty = MathsPuzzle(
    equation: '0 # 0 = 0',
    solution: ['/'],
  );

  static MathsPuzzle random() {
    // TODO: Generate random MathsPuzzle

    return mathsPuzzles[RandomUtils.randomInRange(0, mathsPuzzles.length)];
  }

  @override
  String toString() => equation.replaceInOrder({'?', '#'}, solution);

  bool expectsOperationAt(int index) {
    return equation.contains('#') && (equation.indexOf('#') == index);
  }
}
