// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_servisci_app/product/enums/platform_enum.dart';
import 'package:flutter_servisci_app/product/models/number_model.dart';
import 'package:flutter_servisci_app/product/utility/firebase/firebase_collections.dart';
import 'package:flutter_servisci_app/product/utility/version_manager.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  Future<void> checkApplicationVersion(String clientVersion) async {
    final databaseValue = await getVersionNumberFromDatabase();
    if (databaseValue == null || databaseValue.isEmpty) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    final checkIsNeedForceUpdate = VersionManager(deviceValue: clientVersion, databaseValue: databaseValue);

    if (checkIsNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }
    state = state.copyWith(isRedirectHome: true);
  }

  Future<String?> getVersionNumberFromDatabase() async {
    if (kIsWeb) return null;

    final response = await FirebaseCollections.version.referance
        .withConverter<NumberModel>(
          fromFirestore: (snapshot, options) => NumberModel().fromFirabase(snapshot),
          toFirestore: (snapshot, options) {
            return snapshot.toJson();
          },
        )
        .doc(PlatformEnum.versionName)
        .get();

    return response.data()?.number;
  }
}

class SplashState extends Equatable {
  const SplashState({this.isRequiredForceUpdate, this.isRedirectHome});

  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  @override
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
