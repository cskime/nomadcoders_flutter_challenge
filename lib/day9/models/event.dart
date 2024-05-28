import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day9/models/time.dart';

class Event {
  final Color backgroundColor;
  final Time startTime;
  final Time endTime;
  final String title;
  final List<String> participants;

  Event({
    required this.backgroundColor,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.participants,
  });
}

final events = [
  Event(
    backgroundColor: const Color(0xFFFEF754),
    startTime: const Time(hour: 11, minute: 30),
    endTime: const Time(hour: 12, minute: 20),
    title: 'design meeting'.toUpperCase(),
    participants: ['alex', 'helena', 'nana'].toUppercase(),
  ),
  Event(
    backgroundColor: const Color(0xFF9C6BCE),
    startTime: const Time(hour: 12, minute: 35),
    endTime: const Time(hour: 14, minute: 10),
    title: 'daily project'.toUpperCase(),
    participants:
        ['me', 'richard', 'ciry', 'joey', 'ross', 'chandler'].toUppercase(),
  ),
  Event(
    backgroundColor: const Color(0xFFBBEE4B),
    startTime: const Time(hour: 15, minute: 00),
    endTime: const Time(hour: 16, minute: 30),
    title: 'weekly planning'.toUpperCase(),
    participants: ['den', 'nana', 'mark'].toUppercase(),
  ),
  Event(
    backgroundColor: const Color(0xFFFEF754),
    startTime: const Time(hour: 11, minute: 30),
    endTime: const Time(hour: 12, minute: 20),
    title: 'design meeting'.toUpperCase(),
    participants: ['alex', 'helena', 'nana'].toUppercase(),
  ),
  Event(
    backgroundColor: const Color(0xFF9C6BCE),
    startTime: const Time(hour: 12, minute: 35),
    endTime: const Time(hour: 14, minute: 10),
    title: 'daily project'.toUpperCase(),
    participants:
        ['me', 'richard', 'ciry', 'joey', 'ross', 'chandler'].toUppercase(),
  ),
  Event(
    backgroundColor: const Color(0xFFBBEE4B),
    startTime: const Time(hour: 15, minute: 00),
    endTime: const Time(hour: 16, minute: 30),
    title: 'weekly planning'.toUpperCase(),
    participants: ['den', 'nana', 'mark'].toUppercase(),
  ),
];

extension on List<String> {
  List<String> toUppercase() {
    return map((e) => e.toUpperCase()).toList();
  }
}
