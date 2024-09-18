import 'dart:developer' show log;

import 'package:get/get.dart';

import '../constants/strings.dart';
import '../core/router.dart';

void triggerEndOfContent() {
  log('Reached end of content');
  Get.offAndToNamed(AppRoutes.credits, arguments: isTheEnd);
}
