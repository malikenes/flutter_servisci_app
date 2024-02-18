import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_servisci_app/feature/auth/authentication_view.dart';
import 'package:flutter_servisci_app/feature/home/home_view.dart';
import 'package:flutter_servisci_app/feature/splash/splash_view.dart';
import 'package:flutter_servisci_app/product/constants/string_constants.dart';
import 'package:flutter_servisci_app/product/initialize/app_start.dart';

Future<void> main() async {
  await AppStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: StringConstants.appName,
      home: AuthenticationView(),
    );
  }
}
