import 'package:flutter/material.dart';

class VerificationCodeDigit extends StatelessWidget {
  const VerificationCodeDigit({
    super.key,
    required this.number,
    required this.active,
  });

  final int number;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: number >= 0 ? 1 : 0,
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 2,
              child: ColoredBox(
                color: active ? Colors.black : Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
