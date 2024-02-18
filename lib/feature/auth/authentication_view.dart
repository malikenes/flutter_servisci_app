import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_servisci_app/feature/auth/authentication_provider.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  // ignore: lines_longer_than_80_chars
  final authenticationProvider = StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: firebase.FirebaseUIActions(
          actions: [
            firebase.AuthStateChangeAction<firebase.SignedIn>((context, state) {
              if (!state.user!.emailVerified) {
                print('${state.user}');
              }
            }),
          ],
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: firebase.LoginView(
                action: firebase.AuthAction.signIn,
                providers: [firebase.EmailAuthProvider()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
