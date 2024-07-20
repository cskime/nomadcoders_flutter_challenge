import 'package:flutter/material.dart';

class TimerTextPainter extends CustomPainter {
  TimerTextPainter({
    super.repaint,
    required this.text,
    required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();

    final textSize = painter.size;

    painter.paint(
      canvas,
      Offset(
        size.width / 2 - textSize.width / 2,
        size.height / 2 - textSize.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant TimerTextPainter oldDelegate) {
    return text != oldDelegate.text;
  }
}
