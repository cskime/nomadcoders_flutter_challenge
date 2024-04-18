import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day11/components/count_label.dart';
import 'package:nomadcoders_flutter_challenge/day11/components/minute_button.dart';
import 'package:nomadcoders_flutter_challenge/day11/components/play_button.dart';
import 'package:nomadcoders_flutter_challenge/day11/components/timer_card.dart';
import 'package:nomadcoders_flutter_challenge/day11/components/timer_colon.dart';
import 'package:nomadcoders_flutter_challenge/day11/constants/colors.dart';

class Day11HomeScreen extends StatefulWidget {
  const Day11HomeScreen({super.key});

  @override
  State<Day11HomeScreen> createState() => _Day11HomeScreenState();
}

class _Day11HomeScreenState extends State<Day11HomeScreen> {
  final double _inset = 32;
  final availableMinutes = <int>[5, 10, 15, 20, 25, 30, 35, 40];
  static const int initialMinute = 5;
  int selectedMinute = initialMinute;
  Duration current = const Duration(minutes: initialMinute);
  int round = 4;
  int currentRound = 0;
  int goal = 12;
  int currentGoal = 0;

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _inset),
              child: _titleView,
            ),
            const SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _inset),
              child: _timerView(context),
            ),
            const SizedBox(height: 40),
            SizedBox(height: 40, child: _minutesListView),
            const SizedBox(height: 60),
            Center(
              child: PlayButton(
                isPlaying: timer != null,
                size: 80,
                onPressed: onPlayButtonPressed,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountLabel(count: '$currentRound/$round', title: 'ROUND'),
                const SizedBox(width: 120),
                CountLabel(count: '$currentGoal/$goal', title: 'GOAL'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget get _titleView {
    return Text(
      "pomotimer".toUpperCase(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _timerView(BuildContext context) {
    double spacing = 32;
    double width =
        (MediaQuery.of(context).size.width - spacing - _inset * 2) / 2;
    final timeString = current.toString().split('.')[0].split(':');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TimerCard(width: width, numberString: timeString[1]),
        const TimerColon(),
        TimerCard(width: width, numberString: timeString[2]),
      ],
    );
  }

  Widget get _minutesListView {
    return Stack(
      children: [
        ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 180),
          itemCount: availableMinutes.length,
          itemBuilder: (context, index) {
            int minute = availableMinutes[index];
            return MinuteButton(
              minute: minute,
              isSelected: minute == selectedMinute,
              onPressed: (minute) {
                setState(() {
                  selectedMinute = minute;
                  current = Duration(minutes: minute);
                });
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 24);
          },
        ),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  PRIMARY_COLOR,
                  PRIMARY_COLOR.withOpacity(0),
                  PRIMARY_COLOR
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void onPlayButtonPressed() {
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
}
