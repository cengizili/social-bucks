

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

extension DateTimeExtension on DateTime {
  // Method to format DateTime as date and hour string
  String asDateHour({
    String pattern = 'yyyy-MM-dd HH:mm',
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  // Method to format DateTime as date string
  String asDate({
    String pattern = 'yyyy-MM-dd',
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  Duration get untilNow {
    final now = DateTime.now().toUtc();
    return now.difference(this) - Duration(hours: 3);
  }

  // Static method to parse a string into DateTime with hour
}

extension StringDateX on String {
   DateTime asDateHour( {
    String pattern = 'yyyy-MM-dd HH:mm',
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).parse(this);
  }

  // Static method to parse a string into DateTime (date only)
 DateTime asDate( {
    String pattern = 'yyyy-MM-dd',
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).parse(this);
  }

}

extension DurationExtension on Duration {
  String get standard {
    if (this.inSeconds <= 60)
    return "${this.inSeconds} seconds";
    if (this.inSeconds >= 60 && this.inMinutes <= 60)
    return "${this.inMinutes} minutes";
    if (this.inMinutes >= 60 && this.inHours <= 24)
    return "${this.inHours} hours";
    if (this.inHours >= 24)
    return "${this.inDays} days";
    return "${this.inHours} hours";
  }
}