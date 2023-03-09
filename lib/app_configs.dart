import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../app.dart';
import '../injection_container.dart';
import 'core/constants/palette.dart';
import 'core/use_cases/use_case.dart';
import 'domain/use_cases/hive_use_cases/close_hive_local_database.dart';
import 'domain/use_cases/hive_use_cases/init_hive_local_database.dart';

abstract class AppConfigs {
  const AppConfigs._();

  static Future<void> config() async {
    runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();

      if (kDebugMode) {
        Fimber.plantTree(DebugTree());
      }

      await _init();

      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: AppPalette.transparentColor));

      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

      runApp(const MyApp());
    }, (error, stackTrace) {
      Fimber.e('Error in main thread appeared. 😥',
          ex: error, stacktrace: stackTrace);
    });
  }

  static Future<void> _init() async {
    await setupLocator();

    getIt<CloseHiveLocalDatabase>()(NoParams());

    await getIt<InitHiveLocalDatabase>()(NoParams());
  }
}
