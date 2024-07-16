import 'dart:ui' show Offset;

import 'package:flutter/foundation.dart';

import '../utils/random.dart';

@immutable
class DirectionsPuzzle {
  const DirectionsPuzzle({
    required this.instructions,
    required this.solution,
    required this.partitions,
  });

  /// Instructions to be displayed onscreen for the user
  final List<DirectionsGameInstruction> instructions;

  /// The intended partition to be tapped
  final (int, int) solution;

  /// Number of vertical and horizontal divisions of the invisible grid
  final (int, int) partitions;

  /// A 'default' null puzzle
  static const empty = DirectionsPuzzle(
    instructions: [],
    solution: (0, 0),
    partitions: (1, 1),
  );

  static DirectionsPuzzle random() {
    final partitions =
        (RandomUtils.randomInRange(1, 3), RandomUtils.randomInRange(1, 3));

    final solution = (
      RandomUtils.randomInRange(0, partitions.$1),
      RandomUtils.randomInRange(0, partitions.$2),
    );

    final offset = Offset(
      RandomUtils.randomInRange(-1, 2) / 2,
      RandomUtils.randomInRange(-1, 2) / 2,
    );

    String text;
    if (partitions == (1, 1)) {
      text = 'tap';
    } else if (partitions.$1 == 1) {
      text = 'tap ${solution.$2 == 0 ? 'left' : 'right'}';
    } else if (partitions.$2 == 1) {
      text = 'tap ${solution.$1 == 0 ? 'up' : 'down'}';
    } else {
      text = 'tap ${solution.$1 == 0 ? 'up' : 'down'}~'
          '${solution.$2 == 0 ? 'left' : 'right'}';
    }

    return DirectionsPuzzle(
      instructions: [DirectionsGameInstruction(text: text, offset: offset)],
      solution: solution,
      partitions: partitions,
    );
  }
}

@immutable
class DirectionsGameInstruction {
  const DirectionsGameInstruction({
    required this.text,
    this.offset = const Offset(0, 0),
  });

  /// Instruction to be displayed
  final String text;

  /// Fractional offset to position the instruction
  final Offset offset;

  static const empty = DirectionsGameInstruction(text: '');

  @override
  String toString() => text;
}
