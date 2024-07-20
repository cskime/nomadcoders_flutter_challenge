import 'dart:math';

import 'package:flutter/material.dart';

class TimerProgressPainter extends CustomPainter {
  TimerProgressPainter({
    super.repaint,
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const width = 24.0;

    final trackPaint = Paint()
      ..color = const Color(0xFFEEEEEE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    canvas.drawCircle(center, radius, trackPaint);

    final rect = Rect.fromCircle(center: center, radius: radius);
    final progressPaint = Paint()
      ..color = const Color(0xFFFE6367)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      rect,
      -0.5 * pi,
      (progress * 2) * pi,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant TimerProgressPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
