import 'package:flutter/foundation.dart';

import '../constants/enums/operation.dart';
import '../constants/predefined_puzzles.dart';
import '../utils/random.dart';
import '../utils/string.dart';

@immutable
class MathsPuzzle {
  const MathsPuzzle({
    required this.operand1,
    required this.operation,
    required this.operand2,
    required this.result,
    required this.solution,
  });

  /// A numeric string representing a component of the
  /// equation in the puzzle. Any digits replaced by a
  /// "?" is interpreted as an input field.
  final String operand1, operand2, result;

  /// The operation that combines [operand1] and
  /// [operand2] into [result]. If [Operation.unknown], interpreted
  /// as an input field.
  final Operation operation;

  /// The required digit/operator in each respective
  /// input field for the puzzle to be correct.
  final List<String> solution;

  /// A 'default' null puzzle
  static const empty = MathsPuzzle(
    operand1: '0',
    operation: Operation.unknown,
    operand2: '0',
    result: '0',
    solution: ['/'],
  );

  static MathsPuzzle random() {
    // TODO: Generate random MathsPuzzle

    return mathsPuzzles[RandomUtils.randomInRange(0, mathsPuzzles.length)];
  }

  String toStringWithoutSolution() =>
      '$operand1 $operation $operand2 = $result';

  @override
  String toString() => toStringWithoutSolution().replaceInOrder('?', solution);

  bool expectsOperationAt(int index) {
    int indexOfOperationSymbol = '$operand1 # $operand2 = $result'.indexOf('#');
    return indexOfOperationSymbol == index;
  }
}
