import 'package:flutter/foundation.dart';

import '../constants/predefined_puzzles.dart';
import '../utils/random.dart';
import '../utils/string.dart';

final extraPuzzles = <MathsPuzzle>[
  const MathsPuzzle(equation: '22 / 23 = 1??', solution: ['0', '0']),
  const MathsPuzzle(equation: '1 / 0 = ?', solution: ['1']),
  const MathsPuzzle(equation: '3 / ? = 10', solution: ['2']),
  const MathsPuzzle(equation: '?4 / 1? = 42', solution: ['2', '3']),
  const MathsPuzzle(equation: r'13 \ 4 = ?', solution: ['4']),
  const MathsPuzzle(equation: r'31 \ ? = 24', solution: ['2']),
  const MathsPuzzle(equation: r'421 \ 124 = ???', solution: ['2', '4', '2']),
  const MathsPuzzle(equation: r'1000 \ 101 = ???', solution: ['3', '4', '4']),
  const MathsPuzzle(equation: r'?0? \ ?0 = 223', solution: ['3', '3', '3']),
  const MathsPuzzle(equation: '3 // 2 = 1?', solution: ['1']),
  const MathsPuzzle(equation: '4 // 3 = ?2', solution: ['2']),
  const MathsPuzzle(equation: '21 // 3 = ???', solution: ['1', '1', '3']),
  const MathsPuzzle(equation: '142 // ? = ??4', solution: ['2', '3', '3']),
  const MathsPuzzle(equation: '23 // 44 = 2??2', solution: ['2', '2']),
  const MathsPuzzle(equation: r'1001 \\ 2 = ???', solution: ['2', '2', '3']),
  const MathsPuzzle(equation: r'303 \\ 11 = ??', solution: ['2', '3']),
  const MathsPuzzle(equation: r'134 \\ 2 = ??', solution: ['4', '2']),
  const MathsPuzzle(equation: '43 # 24 = 2242', solution: ['//']),
  const MathsPuzzle(equation: '2 # 10 = 112', solution: ['///']),
];

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

    if (extraPuzzles.length <= mathsPuzzles.length) {
      extraPuzzles.addAll(mathsPuzzles);
    }

    return extraPuzzles[RandomUtils.randomInRange(0, extraPuzzles.length)];
  }

  @override
  String toString() => equation.replaceInOrder({'?', '#'}, solution);

  bool expectsOperationAt(int index) {
    return equation[index] == '#';
  }
}
