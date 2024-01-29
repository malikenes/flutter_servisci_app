import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_servisci_app/feature/login/login_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final loginProvider =
      StateNotifierProvider<LoginProvider, int>((ref) {
    return LoginProvider();
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(ref.watch(loginProvider).toString()),
    );
  }
}
