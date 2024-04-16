import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/screens/day9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Day9HomeScreen(),
    );
  }
}
