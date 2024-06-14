import 'package:flutter/material.dart';

class ActivityTab extends StatelessWidget {
  const ActivityTab({
    super.key,
    required this.title,
    required this.selected,
  });

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 36,
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.white,
        border: Border.all(
          color: selected ? Colors.black : Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
