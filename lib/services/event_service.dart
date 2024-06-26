import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/core/utils/extensions.dart';
import 'package:social_bucks/models/extensions.dart';
import 'package:social_bucks/services/session.dart';


class EventService {
  static logUserCreated(){
    FirebaseAnalytics.instance.logEvent(name: "user_created", parameters: {
      "country": Session.instance.me.country,
      "gender": Session.instance.me.gender,
    });
  }
  static logUserOpenedApp(){
    FirebaseAnalytics.instance.logEvent(name: "user_opened_app", parameters: {
      "country": Session.instance.me.country,
      "gender": Session.instance.me.gender,
      "numberOfSubmissions": Session.instance.submissions.value.length,
      "retentionDays": Session.instance.me.dateCreated.untilNow.inDays,
      "balanceRounded": Session.instance.me.balance.nearestLowerMultipleOfTen().toInt()
    });
  }
}