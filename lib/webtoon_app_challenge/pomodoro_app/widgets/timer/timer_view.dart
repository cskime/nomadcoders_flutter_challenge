import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/pomodoro_app/widgets/timer/timer_card.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/pomodoro_app/widgets/timer/timer_colon.dart';

class TimerView extends StatelessWidget {
  const TimerView({
    super.key,
    required this.duration,
  });

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final timeString = duration.toString().split('.')[0].split(':');
    return FractionallySizedBox(
      widthFactor: 1,
      child: Row(
        children: [
          Expanded(
            child: TimerCard(
              text: timeString[1],
            ),
          ),
          const SizedBox(width: 16),
          const TimerColon(),
          const SizedBox(width: 16),
          Expanded(
            child: TimerCard(
              text: timeString[2],
            ),
          ),
        ],
      ),
    );
  }
}
