import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/pomodoro_app/widgets/count_label.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/pomodoro_app/widgets/minute/minutes_option_view.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/pomodoro_app/widgets/play_button.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/pomodoro_app/widgets/timer/timer_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final availableMinutes = <int>[5, 10, 15, 20, 25, 30, 35, 40];
  static const int initialMinute = 5;
  int selectedMinute = initialMinute;
  Duration current = const Duration(minutes: initialMinute);
  int round = 4;
  int currentRound = 0;
  int goal = 12;
  int currentGoal = 0;

  Timer? timer;

  void _onPlayButtonPressed() {
    setState(() {
      if (timer != null) {
        timer?.cancel();
        timer = null;
        return;
      }

      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          setState(() {
            if (current == Duration.zero) {
              current = Duration(minutes: selectedMinute);

              if (currentRound != round) {
                currentRound += 1;
                return;
              }

              if (currentGoal != goal) {
                currentRound = 0;
                currentGoal += 1;
                return;
              }

              timer.cancel();
              this.timer = null;
              currentRound = 0;
              currentGoal = 0;
              return;
            }

            current -= const Duration(seconds: 1);
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'pomotimer'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TimerView(duration: current),
            ),
            const SizedBox(height: 56),
            MinutesOptionView(
              height: 40,
              onMinuteSelected: (minute) => setState(() {
                current = Duration(minutes: minute);
              }),
            ),
            Expanded(
              child: Center(
                child: PlayButton(
                  isPlaying: timer != null,
                  size: 80,
                  onPressed: _onPlayButtonPressed,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CountLabel(
                    count: '$currentRound/$round',
                    title: 'ROUND',
                  ),
                  CountLabel(
                    count: '$currentGoal/$goal',
                    title: 'GOAL',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
