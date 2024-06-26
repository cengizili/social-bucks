import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:social_bucks/firebase_options.dart';
import 'package:social_bucks/services/session.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      ThemeHelper().changeTheme('primary');
      // await Session.instance.reset();
      await Session.instance.init();
      runApp(MyApp());

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      runApp(MyApp());
    }, (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
    });
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: theme,
          title: 'Social Bucks',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
