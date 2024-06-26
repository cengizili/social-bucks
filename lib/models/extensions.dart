import 'package:get/get.dart';
import 'package:social_bucks/models/base_model.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/services/session.dart';

extension SubmissionListX on Collector<SubmissionModel> {
  Collector<SubmissionModel> get approvals {
    return this.where((p0) => p0.fakeStatus == Status.approved);
  }
  Collector<SubmissionModel> get rejecteds {
    return this.where((p0) => p0.fakeStatus == Status.rejected);
  }
  Collector<SubmissionModel> get processings {
    return this.where((p0) => p0.fakeStatus == Status.processing);
  }
  Collector<SubmissionModel> get play {
    return this.where((p0) => p0.task.platform == TaskPlatform.play);
  }
  Collector<SubmissionModel> get maps {
    return this.where((p0) => p0.task.platform == TaskPlatform.maps);
  }
  Collector<SubmissionModel> get instagram {
    return this.where((p0) => p0.task.platform == TaskPlatform.instagram);
  }
}

extension TaskModelListX on Collector<TaskModel> {
  Collector<TaskModel> get recommendations {
    return this.where((p0) => p0.isRecommended == true);
  }

  Collector<TaskModel> get actives {
    return this.where((p0) => p0.isActive == true);
  }

  Collector<TaskModel> get play {
    return this.where((p0) => p0.platform == TaskPlatform.play);
  }
  Collector<TaskModel> get maps {
    return this.where((p0) => p0.platform == TaskPlatform.maps);
  }
  Collector<TaskModel> get instagram {
    return this.where((p0) => p0.platform == TaskPlatform.instagram);
  }
}

extension CollectorX<T extends BaseModel> on Collector<T> {
  Collector<T> get dateSorted => sorted((a, b) => a.dateCreated.compareTo(b.dateCreated));
}

typedef Queries = List<String>;

extension QueriesX on Queries {
  bool apply <T extends BaseModel> (T model){
    final conditions = this.indexed.where((e) => e.$1 % 2 == 1).map((e) => e.$2).map((e) => e.toLowerCase() == "and" ? LogicalOperator.and : LogicalOperator.or).toList();
    final queries = this.indexed.where((e) => e.$1 % 2 == 0).map((e) => e.$2).toList();
    return queries.mixed((q) => model.applyFilters(q), conditions);
  }
}
