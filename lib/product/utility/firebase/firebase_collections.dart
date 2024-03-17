import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  version,
  recommended,
  tag,
  news;

  CollectionReference get referance => FirebaseFirestore.instance.collection(name);
}
