
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/models/base_model.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/extensions.dart';
import 'package:social_bucks/models/payment_request.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/services/database_service.dart';
import 'package:social_bucks/services/firebase_service.dart';
import 'package:social_bucks/services/hive_service.dart';
import 'package:social_bucks/services/session.dart';

class UserModel extends BaseModel<UserModel> {
  String? fcmToken;
  double balance;
  int groupNumber;
  String? country;
  String email;
  String? gender;
  DateTime get lastSeen => DateTime.now().toUtc();
  String username;
  String? instagramUsername;
  String? lang;
  String? analyticsId;
  String? paypal;
  String? contribUrl;
  String? iban;
  PaymentOption primaryPaymentMethod;
  String uid;

  List<PaymentOption?> get paymentOptions => [paypal, email].map((e) => PaymentOption.other.fromValue(e)).nonNulls.toList();
  Collector<SubmissionModel> get submissions => Session.instance.submissions.value.where((p0) => p0.uid == id,);
  Collector<PaymentRequestModel> get paymentRequests => Session.instance.paymentRequests.value.where((p0) => p0.uid == id,);

  UserModel({
    required super.id,
    required super.dateCreated, 
    required this.username, 
    required this.email,
    required this.uid,
    required this.balance,
    required this.groupNumber,
    this.primaryPaymentMethod = PaymentOption.other,
    this.paypal,
    this.iban,
    this.contribUrl,
    this.analyticsId,
    this.fcmToken,
    this.country,
    this.gender,
    this.lang,
    this.instagramUsername
  });

  UserModel.fromSnapshot(DataSnapshot snapshot) : 
    fcmToken = snapshot.json['fcmToken'],
    country = snapshot.json['country'],
    email = snapshot.json['email'],
    gender = snapshot.json['gender'],
    username = snapshot.json['username'],
    paypal = snapshot.json['paypal'],
    balance = (snapshot.json['balance'] as num).toDouble().toPrecision(1),
    iban = snapshot.json['iban'],
    lang = snapshot.json['lang'],
    uid = snapshot.json['uid'],
    analyticsId = snapshot.json['analyticsId'],
    contribUrl = snapshot.json['contribUrl'],
    groupNumber = snapshot.json['groupNumber'],
    instagramUsername = snapshot.json['instagramUsername'],
    primaryPaymentMethod = PaymentOption.values[snapshot.json['primaryPaymentMethod'] as int? ?? 2],
    super.fromSnapshot(snapshot);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fcmToken': fcmToken,
      'balance': balance.toPrecision(1),
      'country': country,
      'dateCreated': dateCreated.asDateHour(),
      'email': email,
      'gender': gender,
      'lastSeen': lastSeen.asDateHour(),
      'username': username,
      'lang': lang,
      'paypal': paypal,
      'iban': iban,
      'uid': uid,
      'analyticsId': analyticsId,
      'groupNumber': groupNumber,
      'contribUrl': contribUrl,
      'instagramUsername': instagramUsername,
      'primaryPaymentMethod': PaymentOption.values.indexOf(primaryPaymentMethod)
    };
  }
}
