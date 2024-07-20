import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/custom_paint_pomotimer/widgets/timer/timer_progress_painter.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/custom_paint_pomotimer/widgets/timer/timer_text_painter.dart';

class TimerView extends StatelessWidget {
  const TimerView({
    super.key,
    required this.time,
    required this.progress,
  });

  final Duration time;
  final double progress;

  String get _timeString {
    final timeString = time.toString().split(".").first;
    return timeString.substring(timeString.indexOf(":") + 1);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final timerSize = screenSize.width * 0.7;
    return CustomPaint(
      painter: TimerProgressPainter(progress: progress),
      size: Size(timerSize, timerSize),
      foregroundPainter: TimerTextPainter(
        text: _timeString,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 48,
            fontWeight: FontWeight.bold,
            fontFeatures: [
              FontFeature.tabularFigures(),
            ]),
      ),
    );
  }
}
