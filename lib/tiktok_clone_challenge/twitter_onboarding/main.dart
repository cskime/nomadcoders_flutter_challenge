import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/interests/interest_screen.dart';

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
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w900,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w900,
          ),
          bodyLarge: TextStyle(
            color: Palette.text,
          ),
          bodyMedium: TextStyle(
            color: Palette.text,
          ),
        ),
      ),
      home: const DefaultTextStyle(
        style: TextStyle(color: Palette.text),
        child: InterestScreen(),
      ),
    );
  }
}
