
import 'dart:async';
import 'dart:io';

import 'package:auto_localization/auto_localization.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:social_bucks/core/app_export.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/core/utils/validation_functions.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/extensions.dart';
import 'package:social_bucks/models/payment_request.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/models/user_model.dart';
import 'package:social_bucks/services/auth_service.dart';
import 'package:social_bucks/services/browser_service.dart';
import 'package:social_bucks/services/config_service.dart';
import 'package:social_bucks/services/event_service.dart';
import 'package:social_bucks/services/firebase_service.dart';
import 'package:social_bucks/services/hive_service.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/services/notification_service.dart';
import 'package:social_bucks/widgets/update_pop_up.dart';

class Session extends GetxController{
  static Session? _instance;
  static Session get instance => _instance ?? Get.put(Session());
  String? locale;
  String? get language => locale?.split("-").firstOrNull;
  String? get country => locale?.split("-").lastOrNull;
  Map<String, List<StreamSubscription?>> streams = {};
  late PackageInfo packageInfo;

  Rx<Collector<TaskModel>> tasks = Rx<Collector<TaskModel>>({});
  Rx<Collector<SubmissionModel>> submissions = Rx<Collector<SubmissionModel>>({});
  Rx<Collector<PaymentRequestModel>> paymentRequests = Rx<Collector<PaymentRequestModel>>({});
  Rx<Collector<UserModel>> users = Rx<Collector<UserModel>>({});

  Collector<TaskModel> get allowedTasks {
    return tasks.value.where((p0) => p0.isActive && p0.userFilters.apply(me) && p0.submissions.where((p0) => p0.fakeStatus != Status.started).isEmpty);
  }

  UserModel get me => users.value.where((p0) => p0.uid == FirebaseAuth.instance.currentUser?.uid).values.first;

  bool get isNewUser => HiveService.instance.userInfoBox.get("isNewUser", defaultValue: true);

  bool get forceUpdate {
    if (Platform.isAndroid) {
      final current = double.parse(packageInfo.version.replaceAll(".", ""));
      final config = double.parse(ConfigKeys.play_app_version.getString.replaceAll(".", ""));
      return current < config;
    }
    return false;
  }

  Future<void> init () async {
    packageInfo = await PackageInfo.fromPlatform();
    await ConfigService.instance.initialize();
    await initLanguage();
    await HiveService.instance.init();
    initAuthentication();
    await BrowserService.instance.init();
  }

  Future<void> ensureUser () async {
    await waitUntil(() => users.value.where((p0) => p0.uid == FirebaseAuth.instance.currentUser?.uid).values.firstOrNull != null)
          .then((value) async {
            await me.writeRef.update(me.toJson());
            Nav.toNamed(AppRoutes.home);
            if (forceUpdate)
            Get.dialog(UpdatePopUp(), barrierDismissible: false);
          });
  }

  void initAuthentication () {
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) async {
      if (user == null) {
        if (isNewUser)
        Nav.toNamed(AppRoutes.onboarding);
        else
        Nav.toNamed(AppRoutes.login);
        FirebaseService.instance.dualReferences.values.forEach((element) {
            element.dispose();
          });
      } else {
          FirebaseService.instance.dualReferences.values.forEach((element) {
            element.listen();
          });
          await ensureUser();
          if (me.gender != null)
          EventService.logUserOpenedApp();
        }
    });
  }

  Future<void> initLanguage() async {
    if (Platform.isAndroid){
      locale = await Devicelocale.currentLocale;
    }
    else {
      locale = await Devicelocale.defaultLocale;
    }
    await AutoLocalization.init(
      appLanguage: 'en',
      userLanguage: language
      );
  }

  Future<void> reset () async {
    await initLanguage();
    await HiveService.instance.init();
    await FirebaseAuth.instance.signOut();
    await HiveService.instance.userInfoBox.clear();
  }

  Future<void> login () async {
      await AuthService.instance.signInWithGoogle().then((credential) async {
        if (isNewUser){
          FirebaseService.instance.createAccount(credential);
        }
        await HiveService.instance.userInfoBox.put("isNewUser", false);
        await NotificationService.notificationHandler();
        await FirebaseAnalytics.instance.setUserId(id: FirebaseAuth.instance.currentUser?.uid);
        });
  }
}