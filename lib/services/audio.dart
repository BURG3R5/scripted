import 'package:audioplayers/audioplayers.dart';

import '../constants/app_assets.dart';

class AudioService {
  static late final AudioPlayer ambiencePlayer;

  static Future<void> initialize() async {
    ambiencePlayer = AudioPlayer();
    await ambiencePlayer.setSourceAsset(AppAssets.ambientSound);
    await ambiencePlayer.setReleaseMode(ReleaseMode.loop);
    ambiencePlayer.resume();

    // TODO: Variation? Gap-less? Blending of finish into start?
    // TODO: Audio feedback on unlocks? solves? taps?
  }
}
