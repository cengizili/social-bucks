import 'dart:async';
import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:social_bucks/core/utils/extensions.dart';
import 'package:social_bucks/core/utils/validation_functions.dart';
import 'package:social_bucks/models/base_model.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/payment_request.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/models/user_model.dart';
import 'package:social_bucks/services/database_service.dart';
import 'package:social_bucks/services/session.dart';

import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

DatabaseReference _db = FirebaseDatabase(databaseURL: "https://katchiu-fa0ab.firebaseio.com/").ref();


class FirebaseService {
  static FirebaseService? _instance;
  static FirebaseService get instance => _instance ?? FirebaseService()..dualReferences={
    Nodes.tasks: DualReference.controller<TaskModel>(Nodes.tasks),
    Nodes.users: DualReference.controller<UserModel>(Nodes.users),
    Nodes.submissions: DualReference.controller<SubmissionModel>(Nodes.submissions),
    Nodes.payment_requests: DualReference.controller<PaymentRequestModel>(Nodes.payment_requests),
  };
  Map<Nodes, DualReference> dualReferences = {};

  static Future<void> createSubmission(TaskModel taskModel) async {
    final pushRef = FirebaseService.instance.dualReferences[Nodes.submissions]!.writeRef.push();
    final submission = SubmissionModel(
      id: pushRef.key!,
      taskId: taskModel.id,
      uid: FirebaseAuth.instance.currentUser!.uid,
      fakeStatus: Status.started,
      status: Status.started,
      dateCreated: DateTime.now().toUtc(),
    );
    await pushRef.dualSet<SubmissionModel>(submission.toJson());
  }

  Future<void> createAccount (UserCredential credential) async {
    if (Session.instance.users.value.isNotEmpty)
    return ;
    final ref = FirebaseService.instance.dualReferences[Nodes.users]!.writeRef.push();
    final user = UserModel(
      id: ref.key!,
      balance: 0.0,
      groupNumber: Random().nextInt(10),
      uid: credential.user!.uid,
      dateCreated: DateTime.now().toUtc(),
      username: credential.user!.displayName!,
      country: Session.instance.country,
      analyticsId: await FirebaseAnalytics.instance.appInstanceId,
      fcmToken: await FirebaseMessaging.instance.getToken(),
      lang: Session.instance.language,
      email: credential.user!.email!)..node = Nodes.users;
    await ref.dualSet<UserModel>(user.toJson());
  }

  Future<void> subscribeToTopic () async {
    await FirebaseMessaging.instance.subscribeToTopic(Session.instance.country!);
    await _db.child("topics").child(Session.instance.country!).runTransaction((Object? value) {
    var _value;
    if (value == null) {
      _value = 0;
    }
    else {
      _value = (value as int) + 1;
    }
    return Transaction.success(_value);
  });
  }
}