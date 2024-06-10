import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/main_naviagtion_screen.dart';

void main() {
  runApp(const ThreadApp());
}

class ThreadApp extends StatelessWidget {
  const ThreadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        textTheme: TextTheme(
          titleMedium: const TextStyle(fontSize: 18),
          bodyMedium: const TextStyle(fontSize: 18),
          labelMedium: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const MainNaviagtionScreen(),
    );
  }
}
