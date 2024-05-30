import 'package:flutter/material.dart';

class MinutesListFadeEffect extends StatelessWidget {
  const MinutesListFadeEffect({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, primaryColor.withOpacity(0), primaryColor],
          ),
        ),
      ),
    );
  }
}
