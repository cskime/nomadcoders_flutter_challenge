import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day11/screens/day11_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Day11HomeScreen(),
    );
  }
}
