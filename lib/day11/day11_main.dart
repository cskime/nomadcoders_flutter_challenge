import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day11/day11_home_screen.dart';

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
      home: const Day11HomeScreen(),
    );
  }
}
