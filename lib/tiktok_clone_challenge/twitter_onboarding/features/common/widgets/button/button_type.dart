import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';

enum ButtonType {
  primary,
  secondary;

  Color get backgroundColor => switch (this) {
       ButtonType.primary => Palette.primary,
       ButtonType.secondary => Colors.black,
      };
}
