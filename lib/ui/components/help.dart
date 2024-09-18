import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';

import '../../models/cheat_input.dart';
import '../theme.dart';
import 'cheat_code.dart';
import 'glow_text.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    this.containerPadding,
    this.containerWidth,
    this.containerHeight,
    required this.onPressed,
    required this.showExpanded,
    required this.cheatCodes,
    super.key,
  });

  final EdgeInsets? containerPadding;

  final double? containerWidth;

  final double? containerHeight;

  final Function() onPressed;

  final bool showExpanded;

  final List<(IconData, CheatCode)> cheatCodes;

  @override
  Widget build(BuildContext context) {
    final helpContent = AnimatedGradientBorder(
      borderRadius: BorderRadius.circular(15),
      borderSize: 1,
      glowSize: 3,
      gradientColors: const <Color>[secondary],
      animationProgress: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: black,
        ),
        width: containerWidth,
        padding: containerPadding,
        height: containerHeight,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Row>.generate(
            cheatCodes.length,
            (index) => buildCheatCodeWidget(
              cheatCodes[index].$1,
              cheatCodes[index].$2,
            ),
          ),
        ),
      ),
    );

    return Positioned(
      top: 20,
      left: 30,
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedCrossFade(
          crossFadeState: showExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 0),
          alignment: Alignment.topLeft,
          firstChild: const HelpButton(),
          secondChild: helpContent,
        ),
      ),
    );
  }
}

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBorder(
      borderRadius: BorderRadius.circular(15),
      borderSize: 1,
      glowSize: 3,
      gradientColors: const <Color>[secondary],
      animationProgress: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: black,
        ),
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: GlowText(
          text: 'h',
          glowColor: secondary,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: secondary, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
