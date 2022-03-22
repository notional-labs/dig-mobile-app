import 'dart:async';
import 'package:dig_mobile_app/app.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:logger/logger.dart';
import 'package:dig_core/dig_core.dart' as core;
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    initDI(core.DevENV(core.BaseEnv()));

    /// TODO: Uncomment after setup Firebase
    // await initFirebase();

    runApp(const MyApp());
  }, (error, stackTrace) {
    Logger().e('error while running app', error, stackTrace);
  });
}
