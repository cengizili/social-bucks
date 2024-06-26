import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/screens/home/bottom_appbar_controller.dart';

class Nav {
  static void toNamed (String route, {int? id, dynamic arguments}) {
    try {
      if (Nav.currentRoute != route)
          Get.toNamed(route, id: id, arguments: arguments);
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (Nav.currentRoute != route)
          Get.toNamed(route, id: id, arguments: arguments);
        });
    }
  }

  static void offAndToNamed (String route, {int? id, dynamic arguments}) {
    try {
      if (Nav.currentRoute != route)
          Get.offAndToNamed(route, id: id, arguments: arguments);
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (Nav.currentRoute != route)
          Get.offAndToNamed(route, id: id, arguments: arguments);
        });
    }
  }

  static void offAllNamed (String route, {int? id, dynamic arguments}) {
    try {
      if (Nav.currentRoute != route)
          Get.offAllNamed(route, id: id, arguments: arguments);
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (Nav.currentRoute != route)
          Get.offAllNamed(route, id: id, arguments: arguments);
        });
    }
  }

  static void offNamed (String route, {int? id, dynamic arguments}) {
    try {
      if (Nav.currentRoute != route)
          Get.offNamed(route, id: id, arguments: arguments);
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (Nav.currentRoute != route)
          Get.offNamed(route, id: id, arguments: arguments);
        });
    }
  }

  static void back () {
    try {
      Get.back();
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Get.back();
        });
    }
  }

  static String get currentRoute {
    if (Get.currentRoute == "/home")
    return Get.put(BottomAppBarController()).currentRoute;
    else
    return Get.currentRoute;
  }
}