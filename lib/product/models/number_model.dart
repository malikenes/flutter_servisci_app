import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_servisci_app/product/models/base_firebase_model.dart';
import 'package:flutter_servisci_app/product/utility/custom_exception.dart';

class NumberModel extends Equatable implements IdModel, BaseFirebaseModel<NumberModel> {
  NumberModel({
    this.number,
  });
  final String? number;
  @override
  String? id = ' ';

  NumberModel copyWith({
    String? number,
  }) {
    return NumberModel(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  @override
  NumberModel fromFirabase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomException('data is nuul');
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }

  @override
  NumberModel fromJson(Map<String, dynamic> json) {
    return NumberModel(
      number: json['number'] as String?,
    );
  }

  @override
  List<Object?> get props => [number];
}
