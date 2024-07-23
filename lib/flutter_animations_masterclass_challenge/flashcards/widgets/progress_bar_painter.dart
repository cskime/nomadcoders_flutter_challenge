import 'package:flutter/material.dart';

class ProgressBarPainter extends CustomPainter {
  ProgressBarPainter({
    super.repaint,
    required this.progress,
  });

  final double progress;

  Paint _paint({required Color color}) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    const padding = 32.0;
    final width = size.width - padding * 2;
    final start = Offset(padding, size.height / 2);

    // draw track
    canvas.drawLine(
      start,
      Offset(size.width - padding, start.dy),
      _paint(color: Colors.black12),
    );

    // draw progress
    canvas.drawLine(
      start,
      Offset(start.dx + width * progress, size.height / 2),
      _paint(color: Colors.white),
    );
  }

  @override
  bool shouldRepaint(covariant ProgressBarPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
