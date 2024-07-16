import 'package:double_tap_exit/double_tap_exit.dart';
import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

import '../../../models/cheat_input.dart';
import '../../../models/directions_puzzle.dart';
import '../../../viewmodels/directions.dart';
import '../../components/conditionally_wrap.dart';
import '../../components/feedback.dart';
import '../../components/glow_text.dart';
import '../../components/help.dart';
import '../../components/score.dart';
import '../../theme.dart';
import '../base.dart';

class DirectionsGame extends StatelessWidget {
  const DirectionsGame({this.popsToMenu = false, super.key});

  final bool popsToMenu;

  @override
  Widget build(BuildContext context) {
    return BaseView<DirectionsGameViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return ConditionallyWrap(
          condition: !popsToMenu && model.showExitCheat,
          parentBuilder: (child) => DoubleTap(
            message: 'YOU ARE LOCKED INTO THE DIRECTIONS GAME\n'
                'PRESS BACK TWICE TO EXIT THE APP ENTIRELY',
            child: child,
          ),
          child: Scaffold(
            body: Center(
              child: Stack(
                children: <Widget>[
                  for (final instruction in model.puzzle.instructions)
                    _buildInstruction(
                      context,
                      instruction,
                      showTappingSymbol:
                          model.score == 0 && instruction.text == 'tap',
                    ),
                  _buildButtons(model),
                  ScoreWidget(
                    score: model.score,
                    onPressed: () =>
                        model.addCheatInput(CheatInput.score(model.score)),
                  ),
                  HelpWidget(
                    containerWidth: 190,
                    containerHeight: model.showExitCheat ? 190 : null,
                    containerPadding: model.showExitCheat
                        ? null
                        : const EdgeInsets.symmetric(vertical: 10),
                    onPressed: model.onHelpTap,
                    showExpanded: model.showHelp,
                    cheatCodes: [
                      if (model.showExitCheat)
                        (Icons.exit_to_app, DirectionsGameViewModel.exitCheat),
                      (Icons.card_giftcard, DirectionsGameViewModel.bonusCheat),
                    ],
                  ),
                  if (model.feedbackText != null)
                    ...buildFeedbackWidgets(
                      context,
                      feedbackType: model.feedbackType,
                      feedbackText: model.feedbackText!,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Align _buildInstruction(
    BuildContext context,
    DirectionsGameInstruction instruction, {
    required bool showTappingSymbol,
  }) {
    return Align(
      alignment: Alignment(instruction.offset.dx, instruction.offset.dy),
      child: ConditionallyWrap(
        condition: showTappingSymbol,
        parentBuilder: (child) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.touch_app,
              color: Colors.transparent,
              size: 80,
            ),
            child,
            const Icon(
              Icons.touch_app,
              color: primary,
              size: 80,
            ),
          ],
        ),
        child: GlowText(
          text: instruction.text,
          glowColor: primary,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Column _buildButtons(DirectionsGameViewModel model) {
    var (rows, columns) = model.puzzle.partitions;

    return Column(
      children: List.generate(
        rows,
        (rowIndex) => Expanded(
          child: Row(
            children: List.generate(
              columns,
              (columnIndex) => Expanded(
                child: TapDebouncer(
                  onTap: () async =>
                      await model.onInput((rowIndex, columnIndex)),
                  builder: (_, onTap) => InkWell(onTap: onTap),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
