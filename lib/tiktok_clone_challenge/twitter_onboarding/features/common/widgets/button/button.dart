import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.title,
    required this.type,
    required this.size,
    this.enabled = true,
    this.future,
    this.onPressed,
  });

  final String title;
  final ButtonType type;
  final ButtonSize size;
  final bool enabled;
  final Future<void> Function()? future;
  final void Function()? onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  var _loading = false;

  void _onTap() {
    if (widget.onPressed == null) {
      return;
    }

    if (widget.future == null) {
      widget.onPressed!();
      return;
    }

    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Opacity(
        opacity: widget.enabled ? 1 : 0.3,
        child: _widgetForType(widget.size),
      ),
    );
  }

  Widget _widgetForType(ButtonSize size) {
    final widget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height,
      decoration: BoxDecoration(
        color: this.widget.type.backgroundColor,
        borderRadius: BorderRadius.circular(size.height / 2),
      ),
      child: Center(
        child: FutureBuilder(
          future: this.widget.future?.call(),
          builder: (context, snapshot) {
            final titleText = Text(
              this.widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.fontSize,
                fontWeight: size.fontWeight,
              ),
            );

            if (this.widget.future == null || !_loading) {
              return titleText;
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CupertinoActivityIndicator(
                color: Colors.white,
              );
            }

            _loading = false;
            this.widget.onPressed!();
            return titleText;
          },
        ),
      ),
    );

    return switch (size) {
      ButtonSize.large => widget,
      ButtonSize.small => FittedBox(child: widget)
    };
  }
}
