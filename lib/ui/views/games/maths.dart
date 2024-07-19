import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

import '../../../constants/enums/operation.dart';
import '../../../models/cheat_input.dart';
import '../../../viewmodels/maths.dart';
import '../../components/feedback.dart';
import '../../components/glow_text.dart';
import '../../components/help.dart';
import '../../components/score.dart';
import '../../theme.dart';
import '../base.dart';

class MathsGame extends StatelessWidget {
  const MathsGame({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MathsGameViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                _buildEquation(context, model),
                _buildBackground(model),
                ScoreWidget(
                  score: model.score,
                  onPressed: () =>
                      model.addCheatInput(CheatInput.score(model.score)),
                ),
                HelpWidget(
                  containerWidth: 190,
                  containerHeight: 190,
                  onPressed: model.onHelpTap,
                  showExpanded: model.showHelp,
                  cheatCodes: [
                    if (model.showUnlockCheat)
                      (FontAwesomeIcons.unlock, MathsGameViewModel.unlockCheat),
                    (Icons.card_giftcard, MathsGameViewModel.bonusCheat),
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
        );
      },
    );
  }

  Expanded _buildBackground(MathsGameViewModel model) {
    if (!model.showHelp) {
      return Expanded(
        child: Container(),
      );
    }

    return Expanded(
      child: TapDebouncer(
        onTap: () async {
          model.showHelp = false;
        },
        builder: (_, onTap) => InkWell(onTap: onTap),
      ),
    );
  }

  Widget _buildEquation(BuildContext context, MathsGameViewModel model) {
    var equation = model.puzzle.equation;
    var inputFieldIndex = -1;

    GlowText buildCharacter(String character) {
      return GlowText(
        text: character,
        glowColor: primary,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: primary,
              letterSpacing: character.isNumericOnly ? 12 : 5,
            ),
      );
    }

    PieMenu buildInput(int index) {
      final inputOptions = (model.puzzle.expectsOperationAt(index))
          ? [
              Operation.add,
              Operation.subtract,
              Operation.multiply,
              Operation.divide,
              Operation.raiseTo,
            ]
          : [0, 1, 2, 3, 4];

      inputFieldIndex++;

      return PieMenu(
        actions: List.generate(
          inputOptions.length,
          (optionIndex) {
            final inputCharacter = inputOptions[optionIndex].toString();
            final thisInputFieldIndex = inputFieldIndex;

            return PieAction(
              child: SizedBox(
                height: 25,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: buildCharacter(inputCharacter),
                ),
              ),
              tooltip: Container(),
              onSelect: () =>
                  model.onInput(thisInputFieldIndex, inputCharacter),
            );
          },
        ),
        child: AnimatedOpacity(
          opacity: model.flashingInputFlag ? 1 : 0.3,
          duration: MathsGameViewModel.flashingDuration,
          child: buildCharacter(model.currentInput[inputFieldIndex]),
        ),
      );
    }

    return PieCanvas(
      theme: PieTheme(
        customAngleDiff: 360 / 5,
        buttonTheme: const PieButtonTheme(
          backgroundColor: background,
          iconColor: null,
        ),
        buttonThemeHovered: PieButtonTheme(
          backgroundColor: Color.lerp(background, primary, 0.33),
          iconColor: null,
        ),
        delayDuration: Duration.zero,
        menuAlignment: Alignment.center,
        overlayColor: Colors.white.withOpacity(0.3),
        pointerColor: Colors.transparent,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            equation.length,
            (index) => (!'?#'.contains(equation[index]))
                ? buildCharacter(equation[index])
                : buildInput(index),
          ),
        ),
      ),
    );
  }
}
