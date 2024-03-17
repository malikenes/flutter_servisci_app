// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: cascade_invocations

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_servisci_app/product/models/news.dart';
import 'package:flutter_servisci_app/product/models/recommended.dart';
import 'package:flutter_servisci_app/product/models/tag.dart';
import 'package:flutter_servisci_app/product/utility/firebase/firebase_collections.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  Future<void> fetchNews() async {
    final newsCollectionReference = FirebaseCollections.news.referance;

    final response = await newsCollectionReference.withConverter(
      fromFirestore: (snapshot, options) {
        return const News().fromFirabase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(news: values);
    }
  }

  Future<void> fetchTag() async {
    final tagsCollectionReference = FirebaseCollections.tag.referance;
    final response = await tagsCollectionReference.withConverter(
      fromFirestore: (snapshot, options) {
        return const Tag().fromFirabase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(tags: values);
    }
  }

  Future<void> fetchRecommended() async {
    final recomCollectionReference = FirebaseCollections.recommended.referance;
    final response = await recomCollectionReference.withConverter(
      fromFirestore: (snapshot, options) {
        return const Recommended().fromFirabase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      state = state.copyWith(recommendeds: values);
    }
  }

  Future<void> fetchAndLoad() async {
    state = state.copyWith(isLoading: true);
    await fetchTag();
    await fetchNews();
    await fetchRecommended();
    state = state.copyWith(isLoading: false);
  }
}

class HomeState extends Equatable {
  const HomeState({
    this.isLoading,
    this.news,
    this.tags,
    this.recommendeds,
  });
  final List<News>? news;
  final List<Tag>? tags;
  final List<Recommended>? recommendeds;
  final bool? isLoading;
  @override
  // TODO: implement props
  List<Object?> get props => [news, tags, recommendeds, isLoading];

  HomeState copyWith({
    List<News>? news,
    List<Tag>? tags,
    List<Recommended>? recommendeds,
    bool? isLoading,
  }) {
    return HomeState(
      news: news ?? this.news,
      tags: tags ?? this.tags,
      recommendeds: recommendeds ?? this.recommendeds,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
