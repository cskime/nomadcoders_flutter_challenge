import 'package:flutter/material.dart';

class TitledDivider extends StatelessWidget {
  const TitledDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('or'),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
      ],
    );
  }
}
