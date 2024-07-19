import 'dart:ui';

import '../models/directions_puzzle.dart';
import '../models/maths_puzzle.dart';

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
  // region faces
  MathsPuzzle(equation: '0 / 0 = ?', solution: ['0']),
  MathsPuzzle(equation: '0 / 1 = ?', solution: ['1']),
  MathsPuzzle(equation: '1 / 1 = ?', solution: ['2']),
  MathsPuzzle(equation: '2 / 1 = ?', solution: ['3']),
  MathsPuzzle(equation: '2 / 2 = ?', solution: ['4']),
  MathsPuzzle(equation: '1 / 0 = ?', solution: ['1']),
  MathsPuzzle(equation: '3 / 1 = ?', solution: ['4']),
  // endregion
  // TODO: Add more puzzles
];
