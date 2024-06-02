import 'package:flutter/material.dart';

class ChartSectionDivider extends StatelessWidget {
  const ChartSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.shade300,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 8,
      ),
    );
  }
}
