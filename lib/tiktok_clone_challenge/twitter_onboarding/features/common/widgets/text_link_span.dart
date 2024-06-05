import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';

class TextLinkSpan extends TextSpan {
  TextLinkSpan({
    super.text,
    required this.onTap,
  }) : super(
          style: const TextStyle(
            color: Palette.primary,
            fontWeight: FontWeight.w500,
          ),
          recognizer: TapGestureRecognizer()..onTap = onTap,
        );

  final void Function() onTap;
}
