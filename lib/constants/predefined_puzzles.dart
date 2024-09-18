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
  // region addition, digits and base-5
  MathsPuzzle(equation: '0 / 0 = ?', solution: ['0']),
  MathsPuzzle(equation: '0 / 1 = ?', solution: ['1']),
  MathsPuzzle(equation: '1 / 1 = ?', solution: ['2']),
  MathsPuzzle(equation: '2 / 1 = ?', solution: ['3']),
  MathsPuzzle(equation: '2 / 2 = ?', solution: ['4']),
  MathsPuzzle(equation: '? / 4 = 10', solution: ['1']),
  MathsPuzzle(equation: '44 / 23 = 1?2', solution: ['2']),
  MathsPuzzle(equation: '1? / ?4 = ?01', solution: ['2', '3', '1']),
  // endregion
  // region subtraction
  MathsPuzzle(equation: r'101 \ 101 = ?', solution: ['0']),
  MathsPuzzle(equation: r'2 \ 1 = ?', solution: ['1']),
  MathsPuzzle(equation: r'3 \ 1 = ?', solution: ['2']),
  MathsPuzzle(equation: r'10 \ 2 = ?', solution: ['3']),
  MathsPuzzle(equation: r'4 \ 0 = ?', solution: ['4']),
  MathsPuzzle(equation: r'34 \ 12 = ??', solution: ['2', '2']),
  MathsPuzzle(equation: r'1? \ 2 = ?4', solution: ['1', '0']),
  // endregion
  // region multiplication
  MathsPuzzle(equation: '423 // 0 = ?', solution: ['0']),
  MathsPuzzle(equation: '1 // 1 = ?', solution: ['1']),
  MathsPuzzle(equation: '2 // 1 = ?', solution: ['2']),
  MathsPuzzle(equation: '? // 12 = 41', solution: ['3']),
  MathsPuzzle(equation: '2 // ? = 13', solution: ['4']),
  MathsPuzzle(equation: '21 // 14 = ???', solution: ['3', '4', '4']),
  MathsPuzzle(equation: '? // 4 = 3?', solution: ['4', '1']),
  // endregion
  // region division
  MathsPuzzle(equation: r'? \\ 312 = 0', solution: ['0']),
  MathsPuzzle(equation: r'13 \\ 13 = ?', solution: ['1']),
  MathsPuzzle(equation: r'40 \\ 2 = ?0', solution: ['2']),
  MathsPuzzle(equation: r'121 \\ ? = 22', solution: ['3']),
  MathsPuzzle(equation: r'?13 \\ 14 = 22', solution: ['4']),
  MathsPuzzle(equation: r'?? \\ 2 = 102 \\ 3', solution: ['3', '3']),
  // endregion
  // region signs and exponentiation
  MathsPuzzle(equation: '1 # 1 = 2', solution: ['/']),
  MathsPuzzle(equation: '2 # 2 = 0', solution: [r'\']),
  MathsPuzzle(equation: '3 # 3 = 14', solution: ['//']),
  MathsPuzzle(equation: '4 # 4 = 1', solution: [r'\\']),
  MathsPuzzle(equation: '1 # 312 = 1', solution: ['///']),
  MathsPuzzle(equation: '2 # 3 = 13', solution: ['///']),
  MathsPuzzle(equation: '13 # 32 = 100', solution: ['/']),
  MathsPuzzle(equation: '101 # 14 = 24', solution: [r'\\']),
  MathsPuzzle(equation: '4 # 14 = 11 # 2', solution: ['//', '///']),
  MathsPuzzle(equation: '34 # 2? = 12', solution: [r'\', '2']),
  // endregion
];
