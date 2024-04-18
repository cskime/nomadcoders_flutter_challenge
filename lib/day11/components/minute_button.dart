import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MinuteButton extends StatelessWidget {
  final int minute;
  final bool isSelected;
  final ValueChanged<int> onPressed;

  const MinuteButton({
    super.key,
    required this.minute,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(minute);
      },
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : PRIMARY_COLOR,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: Text(
            minute.toString(),
            style: TextStyle(
                color: isSelected ? PRIMARY_COLOR : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
