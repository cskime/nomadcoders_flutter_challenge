import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextLinkSpan extends TextSpan {
  TextLinkSpan({
    super.text,
    super.style,
    required this.onTap,
  }) : super(
          recognizer: TapGestureRecognizer()..onTap = onTap,
        );

  final void Function() onTap;
}
