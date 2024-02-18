import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_servisci_app/product/models/base_firebase_model.dart';
import 'package:flutter_servisci_app/product/utility/custom_exception.dart';

class News extends Equatable implements IdModel, BaseFirebaseModel<News> {
  const News({
    this.category,
    this.categoryId,
    this.image,
    this.title,
    this.id,
  });

  final String? category;
  final String? categoryId;
  final String? image;
  final String? title;
  @override
  final String? id;

  @override
  List<Object?> get props => [category, categoryId, image, title, id];

  News copyWith({
    String? category,
    String? categoryId,
    String? image,
    String? title,
    String? id,
  }) {
    return News(
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      image: image ?? this.image,
      title: title ?? this.title,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'image': image,
      'title': title,
      'id': id,
    };
  }

  @override
  News fromJson(Map<String, dynamic> json) {
    return News(
      category: json['category'] as String?,
      categoryId: json['categoryId'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      id: json['id'] as String?,
    );
  }

  @override
  News fromFirabase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomException('data is nuul');
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
