import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CameraControl extends StatefulWidget {
  const CameraControl({
    super.key,
    required this.onFlashPressed,
    required this.onCapturePressed,
    required this.onRotatePressed,
    required this.flashOn,
  });

  final void Function() onFlashPressed;
  final void Function() onCapturePressed;
  final void Function() onRotatePressed;
  final bool flashOn;

  @override
  State<CameraControl> createState() => _CameraControlState();
}

class _CameraControlState extends State<CameraControl> {
  Color _captureButtonColor = Colors.white;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _captureButtonColor = Colors.grey;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _captureButtonColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: widget.onFlashPressed,
              icon: Icon(
                widget.flashOn
                    ? Icons.flash_on_rounded
                    : Icons.flash_off_rounded,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.onCapturePressed,
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _captureButtonColor,
                  width: 3,
                ),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.hardEdge,
                child: ColoredBox(color: _captureButtonColor),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: widget.onRotatePressed,
              icon: const Icon(
                FontAwesomeIcons.rotate,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
