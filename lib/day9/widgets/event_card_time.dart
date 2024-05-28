import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day9/models/time.dart';

class EventCardTime extends StatelessWidget {
  const EventCardTime({
    super.key,
    required this.start,
    required this.end,
  });

  final Time start;
  final Time end;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TimeColumn(time: start),
        const SizedBox(height: 6),
        const SizedBox(
          width: 1,
          height: 24,
          child: ColoredBox(color: Colors.black),
        ),
        const SizedBox(height: 6),
        _TimeColumn(time: end),
      ],
    );
  }
}

class _TimeColumn extends StatelessWidget {
  const _TimeColumn({
    required this.time,
  });

  final Time time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time.hour.toString().padLeft(2, '0'),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
        Text(
          time.minute.toString().padLeft(2, '0'),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ],
    );
  }
}
