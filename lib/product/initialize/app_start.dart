import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_servisci_app/firebase_options.dart';
import 'package:kartal/kartal.dart';

@immutable
class AppStart {
  const AppStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await DeviceUtility.deviceInit();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
