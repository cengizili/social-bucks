import 'package:auto_localization/auto_localization.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:social_bucks/services/firebase_service.dart';
import 'dart:math';

import 'package:social_bucks/services/session.dart';



class NotificationService {
  static final _notification = FlutterLocalNotificationsPlugin();

  static void init() {
    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );
  }

  static pushNotification(
    RemoteMessage message,
    {String? payload, String? lang}
  ) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channed id',
      'channel name',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );


    await _notification.show(
        Random().nextInt(1000000),
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: payload);
      }
    
    static Future<void> notificationHandler() async {
      FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      init();
      NotificationSettings settings = await firebaseMessaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
      await FirebaseService.instance.subscribeToTopic();
      FirebaseMessaging.onMessage.listen((event) async {
          await pushNotification(event);
      });
    }
  }
