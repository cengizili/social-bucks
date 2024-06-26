import 'package:firebase_database/firebase_database.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/models/base_model.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/models/user_model.dart';
import 'package:social_bucks/services/database_service.dart';
import 'package:social_bucks/services/firebase_service.dart';
import 'package:social_bucks/services/session.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:social_bucks/models/base_model.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/models/user_model.dart';
import 'package:social_bucks/services/firebase_service.dart';
import 'package:social_bucks/services/session.dart';

class SubmissionModel extends BaseModel<SubmissionModel> {
  Status fakeStatus;
  Status? status;
  TaskModel get task => Session.instance.tasks.value[taskId]!;
  UserModel get user => Session.instance.users.value.values.firstWhere((e) => e.uid == uid);
  String taskId;
  String uid;
  String? reviewContent;
  DateTime? lastUpdateDate;

  SubmissionModel({
    required super.id,
    required this.taskId,
    required this.uid,
    required this.fakeStatus,
    required super.dateCreated,
    this.status,
    this.reviewContent,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskId': taskId,
      'uid': uid,
      'url': task.url,
      'fakeStatus': fakeStatus.name,
      'reviewContent': reviewContent,
      'status': status?.name,
      'username': user.username,
      'fcmToken': user.fcmToken,
      'analyticsId': user.analyticsId,
      'language': user.lang,
      'country': user.country,
      'dateCreated': dateCreated.asDateHour(),
      'lastUpdateDate': lastUpdateDate?.asDateHour()
    };
  }

  SubmissionModel.fromSnapshot(DataSnapshot snapshot) :
    taskId = snapshot.json['taskId'],
    uid = snapshot.json['uid'],
    status = Status.values.firstWhere((e) => e.name == snapshot.json["status"]),
    fakeStatus = Status.values.firstWhere((e) => e.name == snapshot.json["fakeStatus"]),
    reviewContent = snapshot.json['reviewContent'],
    lastUpdateDate = (snapshot.json['lastUpdateDate'] as String?)?.asDateHour(),
    super.fromSnapshot(snapshot);
  
}
