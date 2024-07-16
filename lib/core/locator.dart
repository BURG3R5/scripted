import 'dart:math';

import 'package:get_it/get_it.dart';

import '../services/local_storage.dart';
import '../viewmodels/directions.dart';
import '../viewmodels/maths.dart';
import '../viewmodels/menu.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(localStorageService);

  final random = Random();
  locator.registerSingleton<Random>(random);

  locator.registerFactory(() => DirectionsGameViewModel());
  locator.registerFactory(() => MathsGameViewModel());
  locator.registerFactory(() => MenuViewModel());
}
