/// Scripted is an art-piece in the form of a video game about words.
/// Copyright (C) 2024 Aditya Rajput

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation (version 3 ONLY).
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.
//
// Contact: support@adityarajput.co
library;

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
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

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
        statusBarColor: black,
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
