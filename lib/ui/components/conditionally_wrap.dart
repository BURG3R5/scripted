import 'package:flutter/material.dart';

class ConditionallyWrap extends StatelessWidget {
  const ConditionallyWrap({
    super.key,
    required this.condition,
    required this.child,
    required this.parentBuilder,
  });

  final Widget child;

  final bool condition;

  final Widget Function(Widget child) parentBuilder;

  @override
  Widget build(BuildContext context) {
    return condition ? parentBuilder(child) : child;
  }
}
