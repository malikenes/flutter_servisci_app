// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_servisci_app/product/models/base_firebase_model.dart';
import 'package:flutter_servisci_app/product/utility/custom_exception.dart';

class Tag extends Equatable implements IdModel, BaseFirebaseModel<Tag> {
  const Tag({
    this.name,
    this.active,
    this.id,
  });
  final String? name;
  final bool? active;
  @override
  final String? id;

  @override
  List<Object?> get props => [name, active, id];

  Tag copyWith({
    String? name,
    bool? active,
    String? id,
  }) {
    return Tag(
      name: name ?? this.name,
      active: active ?? this.active,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'active': active,
      'id': id,
    };
  }

  @override
  Tag fromFirabase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomException('data is nuul');
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }

  @override
  Tag fromJson(Map<String, dynamic> json) {
    return Tag(
      name: json['name'] as String?,
      active: json['active'] as bool?,
      id: json['id'] as String?,
    );
  }
}
