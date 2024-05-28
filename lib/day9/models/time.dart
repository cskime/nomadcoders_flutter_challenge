import 'package:flutter/material.dart';

@immutable
class Time {
  final int hour;
  final int minute;

  const Time({
    required this.hour,
    required this.minute,
  });
}
