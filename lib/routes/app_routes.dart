
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/screens/home/home_page.dart';
import 'package:social_bucks/screens/task_details/task_details_do.dart';
import 'package:social_bucks/screens/task_details/task_details_start.dart';
import 'package:social_bucks/screens/task_details/task_details_submit.dart';
import 'package:social_bucks/screens/tasks/tasks_page.dart';
import 'package:social_bucks/screens/login_page.dart';
import 'package:social_bucks/screens/onboarding_page.dart';
import 'package:social_bucks/screens/payment_requests/payments_page.dart';
import 'package:social_bucks/screens/profile_page.dart';
import 'package:social_bucks/screens/settings_page.dart';
import 'package:social_bucks/screens/splash_page.dart';
import 'package:social_bucks/screens/submissions/submissions_page.dart';
import 'package:social_bucks/screens/web_view_page.dart';
import '../core/app_export.dart';


// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String splash = '/';

  static const String onboarding = '/onboarding';

  static const String login = '/login';

  static const String settings = '/settings';

  static const String paymentRequests = '/payment_requests';

  static const String submissions = '/submissions';

  static const String home = '/home';

   static const String tasks = '/tasks';

  static const String profile = '/profile';
  
  static const String taskDetailsStart = '/task_details_start';
  static const String taskDetailsDo = '/task_details_do';
  static const String taskDetailsSubmit = '/task_details_submit';

  static const String webView = '/web_view';

  static const Transition _transition = Transition.cupertino;
  static const Duration _duration = Duration(milliseconds: 600);

  static List<GetPage> routes = [
    GetPage(name: splash, page:() => SplashPage(), transitionDuration: _duration, transition: _transition),
    GetPage(name: onboarding, page:() => OnboardingPage(), transitionDuration: _duration, transition: _transition),
    GetPage(name: login, page:() => LoginPage(), transitionDuration: _duration, transition: _transition),
    GetPage(name: settings, page:() => SettingsPage(), transitionDuration: _duration, transition: _transition),
    GetPage(name: taskDetailsStart, page:() => TaskDetailsStart(), transitionDuration: _duration, transition: _transition),
    GetPage(name: taskDetailsDo, page:() => TaskDetailsDo(), transitionDuration: _duration, transition: _transition),
    GetPage(name: taskDetailsSubmit, page:() => TaskDetailsSubmit(), transitionDuration: _duration, transition: _transition),
    GetPage(name: paymentRequests, page:() => PaymentsPage(),transitionDuration: _duration, transition: _transition),
    GetPage(name: submissions, page:() => SubmissionsPage(), transitionDuration: _duration, transition: _transition),
    GetPage(name: home, page:() => HomePage(), transitionDuration: _duration, transition: _transition),
    GetPage(name: webView, page:() => CustomWebView(), transitionDuration: _duration, transition: _transition),
    GetPage(name: tasks, page:() => TasksPage(), transitionDuration: _duration, transition: _transition),
    GetPage(name: profile, page:() => ProfilePage(), transitionDuration: _duration, transition: _transition),
  ];
}
