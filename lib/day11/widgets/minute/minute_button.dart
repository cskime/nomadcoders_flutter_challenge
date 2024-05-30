import 'package:flutter/material.dart';

class MinuteButton extends StatelessWidget {
  const MinuteButton({
    super.key,
    required this.width,
    required this.height,
    required this.minute,
    required this.isSelected,
    required this.onPressed,
  });

  final double width;
  final double height;
  final int minute;
  final bool isSelected;
  final void Function(int minute) onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(minute),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Theme.of(context).primaryColor,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: Text(
            minute.toString(),
            style: TextStyle(
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
