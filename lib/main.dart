import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/locator.dart';
import 'core/router.dart';
import 'services/audio.dart';
import 'services/local_storage.dart';
import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Set orientation.
  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft]);
  }

  // Fullscreen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  // Set up singleton provider.
  await setupLocator();

  // Play ambient music
  await AudioService.initialize();

  // Initial Route
  final initialRoute = locator<LocalStorageService>().hasUnlockedMenu
      ? AppRoutes.menu
      : AppRoutes.directionsGame;

  runApp(Scripted(initialRoute: initialRoute));
}

class Scripted extends StatelessWidget {
  const Scripted({
    super.key,
    required this.initialRoute,
  });

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    //Set notification bar color.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: background,
      ),
    );

    return GetMaterialApp(
      title: 'Scripted',
      initialRoute: initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
