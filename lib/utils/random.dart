import 'dart:math' show Random;

import '../core/locator.dart';

class RandomUtils {
  static final _random = locator<Random>();

  /// Generates a random integer uniformly distributed in the range
  /// from [min], inclusive, to [max], exclusive.
  static int randomInRange(int min, int max) =>
      min + _random.nextInt(max - min);
}
