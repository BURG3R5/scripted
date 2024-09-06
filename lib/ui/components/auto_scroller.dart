import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AutoScroller extends StatefulWidget {
  final Duration duration;

  late final ScrollController scrollController;

  final VoidCallback? postScrollCallback;

  final Duration? startDelay;

  final List<Widget> children;

  AutoScroller({
    super.key,
    required this.duration,
    this.postScrollCallback,
    this.startDelay,
    required this.children,
  }) : scrollController = ScrollController();

  @override
  State<AutoScroller> createState() => _AutoScrollerState();
}

class _AutoScrollerState extends State<AutoScroller> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(widget.startDelay ?? Duration.zero);

      await widget.scrollController.animateTo(
        widget.scrollController.position.maxScrollExtent,
        duration: widget.duration,
        curve: Curves.linear,
      );

      widget.postScrollCallback?.call();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          dragDevices: {PointerDeviceKind.unknown},
          physics: const NeverScrollableScrollPhysics(),
        ),
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(children: widget.children),
        ),
      ),
    );
  }
}
