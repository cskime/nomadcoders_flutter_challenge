import 'package:flutter/material.dart';

enum ButtonType {
  large,
  small;

  double get height => switch (this) {
        ButtonType.large => 56,
        ButtonType.small => 40,
      };

  double get fontSize => switch (this) {
        ButtonType.large => 18,
        ButtonType.small => 16,
      };

  FontWeight get fontWeight => switch (this) {
        ButtonType.large => FontWeight.w800,
        ButtonType.small => FontWeight.w700,
      };
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    required this.type,
    this.enabled = true,
    this.onPressed,
  });

  final String title;
  final ButtonType type;
  final bool enabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Opacity(
        opacity: enabled ? 1 : 0.3,
        child: _widgetForType(type),
      ),
    );
  }

  Widget _widgetForType(ButtonType type) {
    final widget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: type.height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(type.height / 2),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: type.fontSize,
            fontWeight: type.fontWeight,
          ),
        ),
      ),
    );

    return switch (type) {
      ButtonType.large => widget,
      ButtonType.small => FittedBox(child: widget)
    };
  }
}
