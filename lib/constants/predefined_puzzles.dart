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
  // region add
  MathsPuzzle(equation: '0 / 0 = ?', solution: ['0']),
  MathsPuzzle(equation: '0 / 1 = ?', solution: ['1']),
  MathsPuzzle(equation: '1 / 1 = ?', solution: ['2']),
  MathsPuzzle(equation: '2 / 1 = ?', solution: ['3']),
  MathsPuzzle(equation: '2 / 2 = ?', solution: ['4']),
  MathsPuzzle(equation: '1 / 0 = ?', solution: ['1']),
  // endregion
  // region carry
  MathsPuzzle(equation: '? / 4 = 10', solution: ['1']),
  MathsPuzzle(equation: '3 / ? = 10', solution: ['2']),
  MathsPuzzle(equation: '44 / 23 = 1?2', solution: ['2']),
  MathsPuzzle(equation: '1? / ?4 = ?01', solution: ['2', '3', '1']),
  MathsPuzzle(equation: '?4 / 1? = 42', solution: ['2', '3']),
  MathsPuzzle(equation: '22 / 23 = 1??', solution: ['0', '0']),
  // endregion
  // region subtract
  MathsPuzzle(equation: r'2 \ 1 = ?', solution: ['1']),
  MathsPuzzle(equation: r'3 \ 1 = ?', solution: ['2']),
  MathsPuzzle(equation: r'10 \ 2 = ?', solution: ['3']),
  MathsPuzzle(equation: r'4 \ 0 = ?', solution: ['4']),
  MathsPuzzle(equation: r'101 \ 100 = ?', solution: ['1']),
  MathsPuzzle(equation: r'34 \ 12 = ??', solution: ['2', '2']),
  // endregion
  // region borrow
  MathsPuzzle(equation: r'13 \ 4 = ?', solution: ['4']),
  MathsPuzzle(equation: r'31 \ ? = 24', solution: ['2']),
  MathsPuzzle(equation: r'421 \ 124 = ???', solution: ['2', '4', '2']),
  MathsPuzzle(equation: r'1? \ 2 = ?4', solution: ['1', '0']),
  MathsPuzzle(equation: r'1000 \ 101 = ???', solution: ['3', '4', '4']),
  MathsPuzzle(equation: r'?0? \ ?0 = 223', solution: ['3', '3', '3']),
  // endregion
  // TODO: Add more puzzles
];
