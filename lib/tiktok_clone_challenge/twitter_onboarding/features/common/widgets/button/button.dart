import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    required this.type,
    required this.size,
    this.enabled = true,
    this.onPressed,
  });

  final String title;
  final ButtonType type;
  final ButtonSize size;
  final bool enabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Opacity(
        opacity: enabled ? 1 : 0.3,
        child: _widgetForType(size),
      ),
    );
  }

  Widget _widgetForType(ButtonSize size) {
    final widget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height,
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(size.height / 2),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.fontSize,
            fontWeight: size.fontWeight,
          ),
        ),
      ),
    );

    return switch (size) {
      ButtonSize.large => widget,
      ButtonSize.small => FittedBox(child: widget)
    };
  }
}
