import 'package:flutter/material.dart';

import '../../constants/enums/feedback_type.dart';
import '../theme.dart';
import 'glow_text.dart';

List<Widget> buildFeedbackWidgets(
  BuildContext context, {
  required FeedbackType feedbackType,
  required String feedbackText,
}) {
  final color =
      feedbackType == FeedbackType.positive ? Colors.green : Colors.red;
  final icon =
      feedbackType == FeedbackType.positive ? Icons.check : Icons.clear;

  return <Widget>[
    Container(
      alignment: Alignment.center,
      color: black.withOpacity(0.5),
      child: Icon(
        icon,
        color: Color.lerp(white, color, 0.5),
        size: 200,
      ),
    ),
    Center(
      child: GlowText(
        text: feedbackText,
        glowColor: black,
        style: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(color: color, fontWeight: FontWeight.bold),
      ),
    ),
  ];
}
