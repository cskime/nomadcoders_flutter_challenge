import 'feature/search/views/search_screen.dart';
import 'theme/light_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AppleMusicSearchApp(),
    ),
  );
}

class AppleMusicSearchApp extends StatelessWidget {
  const AppleMusicSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AppleMusicSearchApp",
      theme: lightThemeData,
      home: const SearchScreen(),
    );
  }
}
