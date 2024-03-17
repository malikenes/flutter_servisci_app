import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_servisci_app/feature/home/home_view.dart';
import 'package:flutter_servisci_app/feature/splash/splash_provider.dart';
import 'package:flutter_servisci_app/product/constants/color_constants.dart';
import 'package:flutter_servisci_app/product/constants/string_constants.dart';
import 'package:flutter_servisci_app/product/enums/image_constants.dart';
import 'package:flutter_servisci_app/product/initialize/app_start.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  final splashProvider = StateNotifierProvider<SplashProvider, SplashState>((ref) {
    return SplashProvider();
  });

  @override
  void initState() {
    super.initState();
    ref.read(splashProvider.notifier).checkApplicationVersion(AppStart.forceUpdateNumber);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashProvider, (previous, next) {
      if (next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isRedirectHome != null) {
        if (next.isRedirectHome! == true) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
        } else {
          //false
        }
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconConstants.appIcon.toPng),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  WavyAnimatedText(
                    StringConstants.appName,
                    // ignore: lines_longer_than_80_chars
                    textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
