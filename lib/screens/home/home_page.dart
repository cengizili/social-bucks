import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/screens/home/bottom_app_bar.dart';
import 'package:social_bucks/screens/settings_page.dart';
import 'package:social_bucks/services/session.dart';
import 'package:social_bucks/widgets/custom_pop_up.dart';
import 'bottom_appbar_controller.dart';
import 'package:social_bucks/screens/payment_requests/payments_page.dart';
import 'package:social_bucks/screens/profile_page.dart';
import 'package:social_bucks/screens/submissions/submissions_page.dart';
import 'package:social_bucks/screens/tasks/tasks_page.dart';
import 'package:social_bucks/services/navigation_service.dart';
import 'package:social_bucks/core/app_export.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  

  Widget getCurrentPage(String routeName) {
    switch (routeName) {
      case AppRoutes.tasks:
        return TasksPage();
      case AppRoutes.submissions:
        return SubmissionsPage();
      case AppRoutes.paymentRequests:
        return SettingsPage();
      case AppRoutes.profile:
        return ProfilePage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomAppBarController());

    if (Session.instance.me.gender == null)
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.dialog(GenderPopUp(), barrierDismissible: false); 
    },);

    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: AppRoutes.tasks,
        onGenerateRoute: (settings) {
          return GetPageRoute(
            page: () => getCurrentPage(settings.name!),
            settings: settings,
          );
        },
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}