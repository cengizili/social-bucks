import 'dart:async';

import 'package:iban/iban.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

bool isValidEmail(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }
  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

bool isText(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }
  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z]+$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

bool isValidPassword(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }
  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

bool isValidIban (String? value) {
  return isValid(value ?? "");
}

Future<void> waitUntil(
    bool Function() condition, {
    Duration checkInterval = const Duration(seconds: 1),
    Duration? timeout,
}) async {
    final DateTime startTime = DateTime.now();

    while (!condition()) {
        if (DateTime.now().difference(startTime) > (timeout ?? Duration(minutes: 10))) {
            throw TimeoutException("Timeout waiting for condition to be met");
        }
        await Future.delayed(checkInterval);
    }
}

bool isValidInstagramUsername(String username) {
  // Check if the username is within the correct length bounds
  if (username.length < 1 || username.length > 30) {
    return false;
  }

  // Regular expression to match valid characters and patterns
  RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9](?!.*?[._]{2})[a-zA-Z0-9._]*[a-zA-Z0-9]$');

  // Check the username against the regular expression
  if (!usernameRegex.hasMatch(username)) {
    return false;
  }

  // Check for consecutive periods or underscores
  if (username.contains('..') || username.contains('__')) {
    return false;
  }

  return true;
}

Future<void> launchMyUrl({String? directUrl}) async {

    final _canLaunch = await canLaunchUrl(Uri.parse(directUrl ?? ""));
    
    if (kIsWeb) {
      if (_canLaunch) {
        await launchUrl(Uri.parse(directUrl ?? ""));
      } else {
        throw "Could not launch $directUrl";
      }
      return;
    }
    if (Platform.isAndroid) {
        final intent2 = AndroidIntent(action: "action_view", data: directUrl);
        return intent2.launch();
      }
     else {
      if (_canLaunch) {
        await launchUrl(Uri.parse(directUrl ?? ""));
      } else {
        throw "Could not launch $directUrl";
     }
    }
  }

bool isValidGoogleMapsUrl(String url) {
  // Regular expression to match the required starting URL and the 'authuser' parameter
  RegExp urlPattern = RegExp(
    r'^https:\/\/www\.google\.com\/maps(?:\/|\?).+authuser=\d+'
  );

  // Test the URL against the pattern
  return urlPattern.hasMatch(url);
}

bool isValidLocalGuideUrl(String url) {

  if (url.startsWith("https://www.google.com/maps/contrib")) {
   return true;
  } else {
    return false;
  }
}