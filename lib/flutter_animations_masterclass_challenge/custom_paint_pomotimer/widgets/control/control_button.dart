import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/custom_paint_pomotimer/widgets/control/control_button_style.dart';

class ControlButton extends StatefulWidget {
  const ControlButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.style,
  });

  final void Function() onPressed;
  final IconData iconData;
  final ControlButtonStyle style;

  @override
  State<ControlButton> createState() => _ControlButtonState();
}

class _ControlButtonState extends State<ControlButton> {
  var _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.9;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: Container(
          decoration: BoxDecoration(
            color: widget.style.backgroundColor,
            shape: BoxShape.circle,
          ),
          width: widget.style.buttonSize,
          height: widget.style.buttonSize,
          child: Center(
            child: Icon(
              widget.iconData,
              color: widget.style.foregroundColor,
              size: widget.style.iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
