import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/auto_scroller.dart';
import '../theme.dart';

class Credits extends StatelessWidget {
  const Credits({this.isTheEnd = false, super.key});

  final bool isTheEnd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
        child: AutoScroller(
          duration: Duration(seconds: isTheEnd ? 80 : 50),
          postScrollCallback: Get.back,
          startDelay: const Duration(seconds: 1),
          children: <RichText>[
            _buildDevelopersNote(context),
            if (isTheEnd) _buildEndOfContentNote(context),
            _buildCredits(context),
            _buildThanks(context),
          ],
        ),
      ),
    );
  }

  RichText _buildDevelopersNote(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: const <TextSpan>[
          TextSpan(
            text: '\n\n\n\n\n\n\nSCRIPTED',
            style: TextStyle(color: primary),
          ),
          TextSpan(text: ' is an artpiece in the form of a video game.'),
          TextSpan(
            text: '\n\n\n\n\n\n\n\nIt\'s inspired by the contextual learning '
                'and knowledge-based unlocks of games like ',
          ),
          TextSpan(
            text: 'Chants of Sennaar',
            style: TextStyle(color: chantsOfSennaarColor),
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: 'Outer Wilds',
            style: TextStyle(color: outerWildsColor),
          ),
          TextSpan(
            text: ', and the "You\'ll need a notebook" design '
                'philosophy of games like ',
          ),
          TextSpan(
            text: 'Lorelei and the Laser Eyes',
            style: TextStyle(color: loreleiAndTheLaserEyesColor),
          ),
          TextSpan(
            text: ' and ',
          ),
          TextSpan(
            text: 'Taiji',
            style: TextStyle(color: taijiColor),
          ),
          TextSpan(
            text: ". It's an ode to games that do not hold "
                'your hands, whose worlds keep spinning with '
                'or without you. Games that are not meant for '
                'players.',
          ),
        ],
        style: Theme.of(context).textTheme.titleLarge,
      ),
      textAlign: TextAlign.justify,
    );
  }

  RichText _buildEndOfContentNote(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: const <InlineSpan>[
          TextSpan(
            text: '\n\n\n\nYou have reached the end of the currently released '
                'content. There is more stuff to come, but it will happen in '
                'random bursts. You can Star the GitHub repository to receive '
                'updates about releases, or just check the app marketplace in a '
                'couple of months.',
          ),
        ],
        style: Theme.of(context).textTheme.titleLarge,
      ),
      textAlign: TextAlign.justify,
    );
  }

  RichText _buildCredits(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          const TextSpan(text: '\n\n\n\n\n\n\n\n\n\n'),
          TextSpan(
            text: 'Credits',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const TextSpan(text: '\n\n\nGame Design and Development\n'),
          const TextSpan(
            text: 'Aditya Rajput (BURG3R5) @GitHub\n\n',
            style: TextStyle(color: githubColor),
          ),
          const TextSpan(text: "'Mandrill' font\n"),
          const TextSpan(
            text: 'Elementalist @FontStruct\n\n',
            style: TextStyle(color: fontStructColor),
          ),
          const TextSpan(text: "'Griddish' script & font\n"),
          const TextSpan(
            text: 'guspolly @Reddit\n'
                'pomdepin @Reddit\n'
                'soppletak @Reddit\n\n',
            style: TextStyle(color: redditColor),
          ),
          const TextSpan(text: "'Musa' numerals & 'Dushan' font\n"),
          const TextSpan(
            text: 'musa.bet\n\n',
            style: TextStyle(color: musaColor),
          ),
          const TextSpan(text: "'Awesome icons'\n"),
          const TextSpan(
            text: 'fontawesome.com\n\n',
            style: TextStyle(color: fontAwesomeColor),
          ),
          const TextSpan(text: "'Ominous Background' audio\n"),
          const TextSpan(
            text: 'Zat_Dude @Freesound\n\n',
            style: TextStyle(color: freeSoundColor),
          ),
          const TextSpan(text: 'Flutter & Dart packages\n'),
          const TextSpan(text: 'awesome_icons - '),
          const TextSpan(
            text: 'appcheap.io\n',
            style: TextStyle(color: flutterColor),
          ),
          const TextSpan(text: 'get - '),
          const TextSpan(
            text: 'getx.site\n',
            style: TextStyle(color: flutterColor),
          ),
          const TextSpan(text: 'get_it - '),
          const TextSpan(
            text: 'fluttercommunity.dev\n',
            style: TextStyle(color: flutterColor),
          ),
          const TextSpan(text: 'glowy_borders - '),
          const TextSpan(
            text: 'inferialize.com\n',
            style: TextStyle(color: flutterColor),
          ),
          const TextSpan(text: 'provider - '),
          const TextSpan(
            text: 'dash-overflow.net\n',
            style: TextStyle(color: flutterColor),
          ),
          const TextSpan(text: 'shared_preferences - '),
          const TextSpan(
            text: 'flutter.dev\n',
            style: TextStyle(color: flutterColor),
          ),
          const TextSpan(text: 'tap_debouncer - '),
          const TextSpan(
            text: 'blean.vip',
            style: TextStyle(color: flutterColor),
          ),
        ],
        style: Theme.of(context).textTheme.titleLarge,
      ),
      textAlign: TextAlign.center,
    );
  }

  RichText _buildThanks(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          const TextSpan(text: '\n\n\n\n\n\n\n\n'),
          TextSpan(
            text: 'Thanks for playing!',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const TextSpan(text: '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'),
        ],
        style: Theme.of(context).textTheme.titleLarge,
      ),
      textAlign: TextAlign.center,
    );
  }
}
