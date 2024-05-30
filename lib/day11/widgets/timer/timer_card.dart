import 'package:flutter/material.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.35,
      child: Stack(
        children: [
          const _CardBackground(depth: 2),
          const _CardBackground(depth: 1),
          _CardBackground(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 150,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  const _CardBackground({
    this.depth = 0,
    this.child,
  });

  final int depth;
  final Widget? child;
  static const double unit = 6;

  double get _top => unit * (2 - depth);
  double get _horizontal => unit * depth;
  double get _opacity => depth == 0 ? 1 : 0.6;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: _top,
      left: _horizontal,
      right: _horizontal,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white.withOpacity(_opacity),
        ),
        clipBehavior: Clip.hardEdge,
        child: child,
      ),
    );
  }
}
