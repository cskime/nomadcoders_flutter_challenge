import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChartSectionHeader extends StatelessWidget {
  const ChartSectionHeader({
    super.key,
    required this.title,
    required this.onShowAllPressed,
  });

  final Widget title;
  final void Function() onShowAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            child: title,
          ),
          GestureDetector(
            onTap: onShowAllPressed,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '전체보기',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                const SizedBox(width: 4),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 10,
                  color: Colors.grey.shade500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
