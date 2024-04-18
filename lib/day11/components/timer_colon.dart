import 'package:flutter/material.dart';

class TimerColon extends StatelessWidget {
  const TimerColon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      child: Column(
        children: [
          _timerDot,
          const SizedBox(height: 16),
          _timerDot,
        ],
      ),
    );
  }

  Widget get _timerDot {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      clipBehavior: Clip.hardEdge,
    );
  }
}
