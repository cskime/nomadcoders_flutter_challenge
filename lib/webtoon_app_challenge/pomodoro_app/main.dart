import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/pomodoro_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFE64D3D),
      ),
      home: const HomeScreen(),
    );
  }
}
