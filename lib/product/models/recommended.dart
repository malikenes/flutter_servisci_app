// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_servisci_app/product/models/base_firebase_model.dart';
import 'package:flutter_servisci_app/product/utility/custom_exception.dart';

class Recommended extends Equatable implements BaseFirebaseModel, IdModel {
  const Recommended({
    this.image,
    this.title,
    this.description,
    this.id,
  });
  final String? image;
  final String? title;
  final String? description;
  @override
  final String? id;

  @override
  List<Object?> get props => [image, title, description, id];

  Recommended copyWith({
    String? image,
    String? title,
    String? description,
    String? id,
  }) {
    return Recommended(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'id': id,
    };
  }

  @override
  Recommended fromFirabase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomException('data is nuul');
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }

  @override
  Recommended fromJson(Map<String, dynamic> json) {
    return Recommended(
      image: json['image'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );
  }
}
