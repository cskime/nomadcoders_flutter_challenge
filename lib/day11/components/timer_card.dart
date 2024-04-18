import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day11/constants/colors.dart';

class TimerCard extends StatelessWidget {
  final double _offset = 4;
  final double width;
  final String numberString;

  const TimerCard({
    super.key,
    required this.width,
    required this.numberString,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 1 / 1.3,
        child: Stack(
          children: [
            _cardBackground(
              left: _offset * 2,
              right: _offset * 2,
              opacity: 0.5,
            ),
            _cardBackground(
              top: _offset,
              left: _offset,
              right: _offset,
              opacity: 0.5,
            ),
            _cardBackground(
              top: _offset * 2,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    numberString,
                    style: const TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 100,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardBackground({
    double top = 0,
    double left = 0,
    double right = 0,
    double opacity = 1,
    Widget? child,
  }) {
    return Positioned.fill(
      top: top,
      left: left,
      right: right,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.white.withOpacity(opacity),
        ),
        clipBehavior: Clip.hardEdge,
        child: child,
      ),
    );
  }
}
