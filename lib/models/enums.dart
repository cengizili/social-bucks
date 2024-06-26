import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iban/iban.dart';
import 'package:social_bucks/core/app_export.dart';
import 'package:social_bucks/core/utils/validation_functions.dart';
import 'package:social_bucks/services/session.dart';
import 'package:url_launcher/url_launcher.dart';

enum Status {
  approved, rejected, processing, started
}

enum TaskPlatform {
  play, maps, instagram, other
}

enum TaskType {
  review, like, follow, other
}

enum PaymentOption {
  paypal, iban, other
}

extension StatusX on Status {
  MaterialColor get color {
    switch (this) {
      case Status.approved:
      return Colors.green;
      case Status.rejected:
      return Colors.red;
      case Status.processing:
      return Colors.orange;
      case Status.started:
      return Colors.grey;
    }
  }
}

extension TaskPlatformX on TaskPlatform {
  String get displayName {
    switch (this) {
      case TaskPlatform.play:
      return "Google Play Store";
      case TaskPlatform.maps:
      return "Google Maps";
      case TaskPlatform.instagram:
      return "Instagram";
      case TaskPlatform.other:
      return "Other";
    }
  }

  String get asset {
    return "assets/images/${this.name}.png";
  }

}

extension TaskTypeX on TaskType {
  String get displayName {
    switch (this) {
      case TaskType.review:
      return "Make a 5-star review";
      case TaskType.follow:
      return "Follow the account";
      case TaskType.like:
      return "Like the post";
      case TaskType.other:
      return "Other";
    }
  }
}

extension PaymentOptionX on PaymentOption {
  String get asset {
    return "assets/images/${this.name}.png";
  }
  String get displayName {
    switch (this) {
      case PaymentOption.paypal:
      return "PayPal";
      case PaymentOption.iban:
      return "IBAN";
      case PaymentOption.other:
      return "other";
    }
  }
  String get hintText {
    switch (this) {
      case PaymentOption.paypal:
      return "example@gmail.com";
      case PaymentOption.iban:
      return "DE89 3704 0044 0532 0130 00";
      case PaymentOption.other:
      return "";
    }
  }
  PaymentOption? fromValue (String? value) {
    if (isValidEmail(value))
    return PaymentOption.paypal;
    if (isValid(value ?? ""))
    return PaymentOption.iban;
  }
  bool isValidValue(String? value) {
    switch (this) {
      case PaymentOption.paypal:
      return isValidEmail(value);
      case PaymentOption.iban:
      return isValidIban(value);
      case PaymentOption.other:
      return false;
    }
  }
  void setOption (String? value) {
    if (this.name == PaymentOption.paypal.name) {
      if (isValidValue(value))
      Session.instance.me.paypal = value;
    }
    if (this.name == PaymentOption.iban.name) {
      if (isValidValue(value))
      Session.instance.me.iban = value;
    }
  }
}

enum Filters {
  contains,
  equals,
  greaterThan,
  lessThan,
  greaterThanOrEquals,
  lessThanOrEquals,
  other
}

enum LogicalOperator { and, or }

extension Mixed<T> on Iterable<T> {
  // The `mixed` method evaluates the iterable based on a predicate and a list of logical operators.
  bool mixed(bool Function(T) predicate, List<LogicalOperator> operators) {
    // Convert the iterable to a list of bools where each element is the result of applying the predicate.
    var results = this.map(predicate).toList();

    if (results.isEmpty) {
      return true;
    }

    // Initialize the result with the first element.
    bool result = results.first;

    // Iterate through the results and apply the logical operators.
    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == LogicalOperator.and) {
        result = result && results[i + 1];
      } else if (operators[i] == LogicalOperator.or) {
        result = result || results[i + 1];
      }
    }

    return result;
  }
}


