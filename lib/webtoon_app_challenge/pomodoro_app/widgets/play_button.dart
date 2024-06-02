import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required this.isPlaying,
    required this.onPressed,
    required this.size,
  });

  final bool isPlaying;
  final GestureTapCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: size * 0.7,
          ),
        ),
      ),
    );
  }
}
