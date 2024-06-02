import 'package:flutter/material.dart';

class TimerColon extends StatelessWidget {
  const TimerColon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _TimerDot(),
        SizedBox(height: 16),
        _TimerDot(),
      ],
    );
  }
}

class _TimerDot extends StatelessWidget {
  const _TimerDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.hardEdge,
    );
  }
}
