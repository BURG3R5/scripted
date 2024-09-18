import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../core/locator.dart';
import '../../viewmodels/base.dart';
import '../theme.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    required this.builder,
    this.onModelReady,
    this.onModelRefresh,
    this.onModelDestroy,
    super.key,
  });

  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelRefresh;
  final Function(T)? onModelDestroy;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  Future<bool>? future;

  @override
  void initState() {
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  void didUpdateWidget(BaseView<T> oldWidget) {
    widget.onModelRefresh?.call(model);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.onModelDestroy?.call(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.isPortrait) {
      return Scaffold(
        backgroundColor: black,
        body: Center(
          child: Text(
            'Scripted works best in landscape orientation\n'
            'Please switch to landscape and reload the game',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: primary),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
