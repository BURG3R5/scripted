import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/strings.dart';
import '../ui/theme.dart';
import '../ui/views/credits.dart';
import '../ui/views/games/directions.dart';
import '../ui/views/games/maths.dart';
import '../ui/views/menu.dart';

class AppRoutes {
  static const String menu = '/',
      directionsGame = '/directions',
      mathsGame = '/maths',
      credits = '/credits';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.menu:
        return GetPageRoute(
          page: Menu.new,
          routeName: AppRoutes.menu,
          settings: settings,
        );
      case AppRoutes.directionsGame:
        return GetPageRoute(
          page: () => DirectionsGame(
            popsToMenu: (settings.arguments == cameFromMenu),
          ),
          routeName: AppRoutes.directionsGame,
          settings: settings,
        );
      case AppRoutes.mathsGame:
        return GetPageRoute(
          page: MathsGame.new,
          routeName: AppRoutes.mathsGame,
          settings: settings,
        );
      case AppRoutes.credits:
        return GetPageRoute(
          page: Credits.new,
          routeName: AppRoutes.credits,
          settings: settings,
        );
      // Default
      default:
        return GetPageRoute(
          page: () => Scaffold(
            backgroundColor: background,
            body: Center(
              child: Text('no route defined for ${settings.name}'),
            ),
          ),
          routeName: '/undefined',
        );
    }
  }
}
