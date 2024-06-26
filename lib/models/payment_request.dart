import 'package:firebase_database/firebase_database.dart';
import 'package:social_bucks/core/utils/date_time_utils.dart';
import 'package:social_bucks/models/base_model.dart';
import 'package:social_bucks/models/enums.dart';
import 'package:social_bucks/models/user_model.dart';
import 'package:social_bucks/services/database_service.dart';
import 'package:social_bucks/services/firebase_service.dart';
import 'package:social_bucks/services/session.dart';

class PaymentRequestModel extends BaseModel<PaymentRequestModel> {
  double amount;
  Status status;
  String uid;
  PaymentOption paymentOption;
  UserModel get user => Session.instance.users.value[uid]!;

  PaymentRequestModel({
    required this.amount,
    required this.status,
    required this.uid,
    required this.paymentOption,
    required super.id,
    required super.dateCreated,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'status': status.name,
      'dateCreated': dateCreated.asDateHour(),
      'uid': uid,
      'paymentOption': paymentOption.name
    };
  }

  PaymentRequestModel.fromSnapshot(DataSnapshot snapshot) :
    amount = snapshot.json['amount'],
    status = Status.values.firstWhere((e) => e.name == snapshot.json["status"]),
    uid = snapshot.json['uid'],
    paymentOption = PaymentOption.values.firstWhere((element) => element.name == snapshot.json['paymentOption']),
    super.fromSnapshot(snapshot);
  
}