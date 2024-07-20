import 'package:flutter/material.dart';

enum ControlButtonStyle {
  primary,
  secondary;

  Color get backgroundColor => switch (this) {
        ControlButtonStyle.primary => const Color(0xFFFE6367),
        ControlButtonStyle.secondary => const Color(0xFFF5F5F5),
      };

  Color get foregroundColor => switch (this) {
        ControlButtonStyle.primary => Colors.white,
        ControlButtonStyle.secondary => const Color(0xFFBDBDBD),
      };

  double get buttonSize => switch (this) {
        ControlButtonStyle.primary => 80,
        ControlButtonStyle.secondary => 48,
      };

  double get iconSize => switch (this) {
        ControlButtonStyle.primary => 40,
        ControlButtonStyle.secondary => 20,
      };
}
