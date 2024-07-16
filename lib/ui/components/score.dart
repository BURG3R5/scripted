import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';

import '../theme.dart';
import 'glow_text.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    required this.score,
    this.onPressed,
    super.key,
  });

  final int score;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final scoreWidget = AnimatedGradientBorder(
      borderRadius: BorderRadius.circular(30),
      borderSize: 1,
      glowSize: 3,
      gradientColors: const <Color>[tertiary],
      animationProgress: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: background,
        ),
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: GlowText(
          text: score.toRadixString(5).padLeft(3, '0'),
          glowColor: tertiary,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: tertiary, letterSpacing: 10),
          textAlign: TextAlign.right,
        ),
      ),
    );

    if (onPressed == null) return scoreWidget;

    return Positioned(
      top: 20,
      right: 30,
      child: GestureDetector(
        onTap: onPressed,
        child: scoreWidget,
      ),
    );
  }
}
