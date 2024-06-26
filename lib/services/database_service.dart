import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:social_bucks/core/utils/extensions.dart';
import 'dart:async';

import 'package:social_bucks/models/base_model.dart';
import 'package:social_bucks/models/collector.dart';
import 'package:social_bucks/services/firebase_service.dart';
import 'package:social_bucks/services/session.dart';

DatabaseReference _db = FirebaseDatabase(databaseURL: "https://katchiu-fa0ab.firebaseio.com/").ref();
DatabaseReference _mineDb = _db.child("user-data").child(FirebaseAuth.instance.currentUser!.uid);

enum Nodes {
  tasks(isCommon: true),
  submissions(isCommon: false),
  payment_requests(isCommon: false),
  users(isCommon: false);
  final bool isCommon;

  const Nodes({required this.isCommon});
}

extension SnapX on DataSnapshot {
  Map<String, dynamic> get json => (this.value as Map<Object?, Object?>).cast<String, dynamic>();
}

extension DatabaseReferenceXX on DatabaseReference {
  Nodes get node => Nodes.values.firstWhere((e) => this.parent!.path.contains(e.name));

  Future<void> dualSet<T extends BaseModel>(Map<String, dynamic> data) async {
    Completer<void> completer = Completer<void>();
    final controller = Get.find<DualReference<T>>(tag: node.name);
    
    StreamSubscription<DataSnapshot?> addSubscription = controller.snapshot.listen(
      (snapshot) {
        if (DeepCollectionEquality().equals(snapshot?.value, data.whereNotNull())) {
          if (!completer.isCompleted)
          completer.complete();
        }
      },
      onError: (error) => completer.completeError(error)
    );

    try {
      await this.set(data);
      await completer.future; // Wait until the listener triggers completion.
    } catch (error) {
      completer.completeError(error);
    } finally {
      await addSubscription.cancel();
    }
  }
}


class DualReference<T extends BaseModel> extends GetxController {
  DatabaseReference get readRef => node.isCommon ? _db.child(node.name.toKebabCase) : _mineDb.child(node.name.toKebabCase);
  DatabaseReference get writeRef => _db.child(node.name.toKebabCase);
  Nodes node;
  List<StreamSubscription> subscriptions = [];
  Rx<DataSnapshot?> snapshot = Rx<DataSnapshot?>(null);

  DualReference({required this.node,});

  static DualReference<R> controller <R extends BaseModel> (Nodes node){
    Get.lazyPut<DualReference<R>>(() => DualReference<R>(node: node), tag: node.name);
    return Get.find<DualReference<R>>(tag: node.name);
  }

  Rx<Collector> get collector {
    String type = T.toString();
    switch (type) {
      case 'TaskModel':
        return Session.instance.tasks;
      case 'SubmissionModel':
        return Session.instance.submissions;
      case 'PaymentRequestModel':
        return Session.instance.paymentRequests;
       case 'UserModel':
        return Session.instance.users;
      default:
        throw Exception('Type $T is not supported by fromType.');
    }
  }

  // Initialize listeners for child events
  void listen() {
    subscriptions = [
      readRef.onChildAdded.listen((DatabaseEvent event) {
        collector.value[event.snapshot.key!] = BaseModel.fromType<T>(event.snapshot);
        collector.refresh();
        snapshot.value = event.snapshot;
      }),
      readRef.onChildChanged.listen((DatabaseEvent event) {
        collector.value[event.snapshot.key!] = BaseModel.fromType<T>(event.snapshot);
        collector.refresh();
        snapshot.value = event.snapshot;
      }),
      readRef.onChildRemoved.listen((DatabaseEvent event) {
        collector.value.removeWhere((key, value) => key == event.snapshot.key!);
        collector.refresh();
        snapshot.value = event.snapshot;
      })
    ];
  }

  void dispose() {
    subscriptions.forEach((e) {e.cancel();});
  }
}
