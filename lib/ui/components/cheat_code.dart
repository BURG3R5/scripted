import 'package:flutter/material.dart';

import '../../models/cheat_input.dart';
import '../theme.dart';
import 'help.dart';
import 'score.dart';

Row buildCheatCodeWidget(
  IconData icon,
  CheatCode cheatCode,
) {
  final groupedCheatCode = <(int, CheatInput)>[];
  var currentGroup = cheatCode[0];
  var currentGroupCount = 0;
  for (var cheatCodeInput in cheatCode) {
    if (cheatCodeInput == currentGroup) {
      currentGroupCount++;
    } else {
      groupedCheatCode.add((currentGroupCount, currentGroup));
      currentGroup = cheatCodeInput;
      currentGroupCount = 1;
    }
  }
  groupedCheatCode.add((currentGroupCount, currentGroup));

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Icon(
        icon,
        color: secondary,
        size: 30,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          groupedCheatCode.length,
          (index) => Row(
            children: List.filled(
              groupedCheatCode[index].$1,
              (groupedCheatCode[index].$2.score == null)
                  ? const SizedBox(
                      width: 25,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: HelpButton(),
                      ),
                    )
                  : SizedBox(
                      width: 40,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: ScoreWidget(
                          score: groupedCheatCode[index].$2.score!,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    ],
  );
}
