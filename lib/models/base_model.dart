import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/core/utils/extensions.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/payment_request.dart';
import 'package:social_bucks/models/submission_model.dart';
import 'package:social_bucks/models/task_model.dart';
import 'package:social_bucks/models/user_model.dart';
import 'package:social_bucks/services/database_service.dart';
import 'package:social_bucks/services/firebase_service.dart';

class BaseModel<T>{
  String id;
  DateTime dateCreated;
  late Nodes node;
  DatabaseReference get writeRef => FirebaseService.instance.dualReferences[node]!.writeRef.child(id);
  BaseModel({required this.id, required this.dateCreated});
  Future<void> updateDB() async => await writeRef.update(toJson());
  Map<String, dynamic> toJson() {
    return {};
  }
  BaseModel.fromSnapshot(DataSnapshot snapshot) :
    id = snapshot.json['id'],
    dateCreated = (snapshot.json['dateCreated'] as String).asDateHour(),
    node = Nodes.values.firstWhere((e) => snapshot.ref.key?.contains(e.name.toKebabCase) == true || snapshot.ref.parent?.key?.contains(e.name.toKebabCase) == true);
  static T fromType<T>(DataSnapshot snapshot) {
    String type = T.toString();
    switch (type) {
      case 'TaskModel':
        return TaskModel.fromSnapshot(snapshot) as T;
      case 'SubmissionModel':
        return SubmissionModel.fromSnapshot(snapshot) as T;
      case 'PaymentRequestModel':
        return PaymentRequestModel.fromSnapshot(snapshot) as T;
       case 'UserModel':
        return UserModel.fromSnapshot(snapshot) as T;
      default:
        throw Exception('Type $T is not supported by fromType.');
    }
  }

  bool applyFilters(String input) {
     final filterPattern = RegExp(r'(\w+)\.(\w+)\((\w+)\)');
    final match = filterPattern.firstMatch(input);

    if (match == null) {
      return true;
    }

    final isNot = input[0] == "!";
    var operand1 = match.group(1); // This captures 'a' in "a.contains(b)"
    var filterName = match.group(2); // This captures 'contains' in "a.contains(b)"
    var operand2 = match.group(3); // This captures 'b' in "a.contains(b)"

    Filters? filter = Filters.values.firstWhere(
      (f) => f.toString().split('.').last == filterName,
      orElse: () => Filters.other
    );

    if (filter == Filters.other) {
      return true; // Default to true if no such filter is found
    }

    final json = toJson();
    // Convert operands to appropriate types
    dynamic a = num.tryParse(json[operand1].toString()) ?? json[operand1]?.replaceAll("'", "");
    dynamic b = num.tryParse(operand2.toString()) ?? operand2?.replaceAll("'", "");

    // Applying the filter
    switch (filter) {
      case Filters.contains:
        if (a is String && b is String) {
          return isNot ? !a.contains(b) : a.contains(b);
        }
        break;
      case Filters.equals:
        return isNot ? !a==b : a==b;
      case Filters.greaterThan:
        if (a is num && b is num) {
          return isNot ? !(a > b) : (a > b);
        }
        break;
      case Filters.lessThan:
        if (a is num && b is num) {
          return isNot ? !(a < b) : (a < b);
        }
        break;
      case Filters.greaterThanOrEquals:
        if (a is num && b is num) {
          return isNot ? !(a >= b) : (a >= b);
        }
        break;
      case Filters.lessThanOrEquals:
        if (a is num && b is num) {
          return isNot ? !(a <= b) : (a <= b);
        }
        break;
      case Filters.other:
      return true;
    }
    return true; // Default to true if data types do not match the expected types
  }
}