import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_servisci_app/firebase_options.dart';
import 'package:package_info_plus/package_info_plus.dart';

@immutable
class AppStart {
  const AppStart._();
  static String forceUpdateNumber = '';
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // await DeviceUtility.deviceInit();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      // ... other providers
    ]);
    final packageInfo = await PackageInfo.fromPlatform();
    forceUpdateNumber = packageInfo.version;
  }
}
