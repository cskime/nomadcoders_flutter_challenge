import 'package:flutter/material.dart';

class CountLabel extends StatelessWidget {
  const CountLabel({
    super.key,
    required this.count,
    required this.title,
  });

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
