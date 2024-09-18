import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glowy_borders/glowy_borders.dart';

import '../theme.dart';
import 'glow_text.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 30,
      child: GestureDetector(
        onTap: Get.back,
        child: AnimatedGradientBorder(
          borderRadius: BorderRadius.circular(15),
          borderSize: 1,
          glowSize: 3,
          gradientColors: const <Color>[quaternary],
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
              text: 'b',
              glowColor: quaternary,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: quaternary, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
