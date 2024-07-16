import 'dart:ui';

import '../models/directions_puzzle.dart';
import '../models/maths_puzzle.dart';
import 'enums/operation.dart';

const directionsPuzzles = <DirectionsPuzzle>[
  // region basic
  DirectionsPuzzle(
    instructions: [DirectionsGameInstruction(text: 'tap')],
    solution: (0, 0),
    partitions: (1, 1),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap left',
        offset: Offset(-0.5, 0),
      ),
    ],
    solution: (0, 0),
    partitions: (1, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap right',
        offset: Offset(0.5, 0),
      ),
    ],
    solution: (0, 1),
    partitions: (1, 2),
  ),
  // endregion
  // region relocate
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap',
        offset: Offset(-0.5, 0),
      ),
    ],
    solution: (0, 0),
    partitions: (1, 1),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap left',
        offset: Offset(0.5, 0),
      ),
    ],
    solution: (0, 0),
    partitions: (1, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap right',
        offset: Offset(0.5, 0),
      ),
    ],
    solution: (0, 1),
    partitions: (1, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap right',
        offset: Offset(-0.5, 0),
      ),
    ],
    solution: (0, 1),
    partitions: (1, 2),
  ),
  // endregion
  // region vertical
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap up',
        offset: Offset(0, -0.5),
      ),
    ],
    solution: (0, 0),
    partitions: (2, 1),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap down',
        offset: Offset(0, 0.5),
      ),
    ],
    solution: (1, 0),
    partitions: (2, 1),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap left',
        offset: Offset(-0.5, 0),
      ),
    ],
    solution: (0, 0),
    partitions: (1, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap down',
        offset: Offset(0, 0.5),
      ),
    ],
    solution: (1, 0),
    partitions: (2, 1),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap',
        offset: Offset(0.5, 0),
      ),
    ],
    solution: (0, 0),
    partitions: (1, 1),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(text: 'tap up'),
    ],
    solution: (0, 0),
    partitions: (2, 1),
  ),
  // endregion
  // region quadrants
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap down~left',
        offset: Offset(-0.5, 0.5),
      ),
    ],
    solution: (1, 0),
    partitions: (2, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap down~right',
        offset: Offset(0.5, 0.5),
      ),
    ],
    solution: (1, 1),
    partitions: (2, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap up~right',
        offset: Offset(0.5, -0.5),
      ),
    ],
    solution: (0, 1),
    partitions: (2, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap up~left',
        offset: Offset(-0.5, -0.5),
      ),
    ],
    solution: (0, 0),
    partitions: (2, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap up~right',
        offset: Offset(-0.5, 0.5),
      ),
    ],
    solution: (0, 1),
    partitions: (2, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap down',
        offset: Offset(0, -0.5),
      ),
    ],
    solution: (1, 0),
    partitions: (2, 1),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(
        text: 'tap right',
        offset: Offset(0.5, -0.5),
      ),
    ],
    solution: (0, 1),
    partitions: (1, 2),
  ),
  DirectionsPuzzle(
    instructions: [
      DirectionsGameInstruction(text: 'tap down~left'),
    ],
    solution: (1, 0),
    partitions: (2, 2),
  ),
  // endregion
];

const mathsPuzzles = <MathsPuzzle>[
  MathsPuzzle(
    operand1: '1',
    operation: Operation.add,
    operand2: '1',
    result: '?',
    solution: ['2'],
  ),
  MathsPuzzle(
    operand1: '2',
    operation: Operation.add,
    operand2: '1',
    result: '?',
    solution: ['3'],
  ),
  MathsPuzzle(
    operand1: '2',
    operation: Operation.add,
    operand2: '2',
    result: '?',
    solution: ['4'],
  ),
  MathsPuzzle(
    operand1: '1',
    operation: Operation.add,
    operand2: '0',
    result: '?',
    solution: ['1'],
  ),
  MathsPuzzle(
    operand1: '4',
    operation: Operation.add,
    operand2: '?',
    result: '10',
    solution: ['1'],
  ),
  MathsPuzzle(
    operand1: '?',
    operation: Operation.add,
    operand2: '3',
    result: '10',
    solution: ['1'],
  ),
  // TODO: Add more puzzles
];
