import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFA4357),
            Color(0xFFEF632F),
          ],
        ),
      ),
    );
  }
}
