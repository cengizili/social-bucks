import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/core/utils/image_constant.dart';
import 'package:social_bucks/routes/app_routes.dart';
import 'package:social_bucks/screens/payment_requests/payments_page.dart';
import 'package:social_bucks/screens/profile_page.dart';
import 'package:social_bucks/screens/settings_page.dart';
import 'package:social_bucks/screens/submissions/submissions_page.dart';
import 'package:social_bucks/screens/tasks/tasks_page.dart';
import 'package:social_bucks/services/navigation_service.dart';

class BottomAppBarController extends GetxController {
  var selectedIndex = 0.obs;

  String get currentRoute => bottomMenuList[selectedIndex.value].route;

  final List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "Home",
      type: BottomBarEnum.Tasks,
      route: AppRoutes.tasks, // Define your GetX route here
    ),
    BottomMenuModel(
      icon: ImageConstant.imgThumbsUp,
      activeIcon: ImageConstant.imgThumbsUp,
      title: "Submissions",
      type: BottomBarEnum.Submissions,
      route: AppRoutes.submissions, // Define your GetX route here
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum.Profile,
      route: AppRoutes.profile, // Define your GetX route here
    ),
    BottomMenuModel(
      icon: ImageConstant.imgComponent3Primary,
      activeIcon: ImageConstant.imgComponent3Primary,
      title: "Settings",
      type: BottomBarEnum.Settings,
      route: AppRoutes.paymentRequests, // Define your GetX route here
    ),
  ];

  void changeIndex(int index) {
    Nav.toNamed(bottomMenuList[index].route, id: 1);
    selectedIndex.value = index;
  }
}

enum BottomBarEnum { Tasks, Submissions, Profile, Settings }

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    required this.route,
  });

  String icon;
  String activeIcon;
  String? title;
  BottomBarEnum type;
  String route; //
}
