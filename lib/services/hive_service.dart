import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


extension BoxX on Box {
  Future<bool> putIfAbsent (String key, dynamic value) async {
    if (this.get(key, defaultValue: null) == null) {
      await this.put(key, value);
      return true;
    }
    return false;
  }
}

class HiveService extends GetxController {
  static HiveService? _instance;
  
  static HiveService get instance {
    if (_instance == null) {
      _instance = Get.put(HiveService());
    }
    return _instance!;
  }

  late Box<dynamic> userInfoBox;

  Future init() async {
    userInfoBox = await Hive.openBox("userInfoBox");
  }

}

