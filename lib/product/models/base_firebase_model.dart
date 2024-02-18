import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_servisci_app/product/utility/custom_exception.dart';

abstract class IdModel {
  String? get id;
}

abstract class BaseFirebaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);

  T fromFirabase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomException('data is nuul');
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
