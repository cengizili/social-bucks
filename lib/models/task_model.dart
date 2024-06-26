import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/models/base_model.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/extensions.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/models/user_model.dart';
import 'package:social_bucks/services/database_service.dart';
import 'package:social_bucks/services/firebase_service.dart';
import 'package:social_bucks/services/session.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskModel extends BaseModel<TaskModel> {
  double credits;
  String client;
  String url;
  bool isActive;
  bool isRecommended;
  String? description;
  int current;
  int quota;
  Queries userFilters;

  TaskModel({
    required super.id,
    required this.credits,
    required this.client,
    required this.isActive,
    required this.url,
    required this.current,
    required this.quota,
    required super.dateCreated,
    this.isRecommended = false,
    this.userFilters = const [],
    this.description,
  });

  Collector<SubmissionModel> get submissions => Session.instance.submissions.value.where((p0) => p0.taskId == id);
  Collector<UserModel> get users => submissions.transformEntries((p0) => p0.user.id, (p0) => p0.user);

   Future<void> launch() async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'credits': credits,
      'client': client,
      'isActive': isActive,
      'url': url,
      'description': description,
      'isRecommended': isRecommended,
      'dateCreated': dateCreated.asDateHour(),
      'userFilters': userFilters
    };
  }

  TaskModel.fromSnapshot(DataSnapshot snapshot) :
    credits = (snapshot.json['credits'] as num).toDouble().toPrecision(2),
    client = snapshot.json['client'],
    isActive = snapshot.json['isActive'],
    url = snapshot.json['url'],
    current = snapshot.json['current'],
    quota = snapshot.json['quota'],
    description = snapshot.json['description'],
    isRecommended = snapshot.json['isRecommended'],
    userFilters = (snapshot.json['userFilters'] as List?)?.cast<String>() ?? [],
    super.fromSnapshot(snapshot);
  

  TaskPlatform get platform {
    if (url.contains("play.google.com")) return TaskPlatform.play;
    if (url.contains("www.google.com/maps")) return TaskPlatform.maps;
    if (url.contains("instagram")) return TaskPlatform.instagram;
    return TaskPlatform.other;
  }

  TaskType get taskType {
    switch (platform) {
      case TaskPlatform.play:
      case TaskPlatform.maps:
        return TaskType.review;
      case TaskPlatform.instagram:
        return url.contains(client) ? TaskType.follow : TaskType.like;
      default:
        return TaskType.other;
    }
  }
}
