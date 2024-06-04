import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/initial/initial_screen.dart';

void main() {
  runApp(const TwitterOnboardingApp());
}

class TwitterOnboardingApp extends StatelessWidget {
  const TwitterOnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          )),
      home: const InitialScreen(),
    );
  }
}
