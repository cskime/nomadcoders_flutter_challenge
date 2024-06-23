import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';

class ActivityTab extends StatelessWidget {
  const ActivityTab({
    super.key,
    required this.title,
    required this.selected,
  });

  final String title;
  final bool selected;

  Color backgroundColor({
    required bool selected,
    required bool isDarkMode,
  }) {
    if (selected) {
      return isDarkMode ? Colors.white : Colors.black;
    } else {
      return isDarkMode ? Colors.black : Colors.white;
    }
  }

  Color foregroundColor({
    required bool selected,
    required bool isDarkMode,
  }) {
    if (selected) {
      return isDarkMode ? Colors.black : Colors.white;
    } else {
      return isDarkMode ? Colors.white : Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThreadTheme.isDarkTheme(context);
    return Container(
      width: 100,
      height: 36,
      decoration: BoxDecoration(
        color: backgroundColor(selected: selected, isDarkMode: isDarkMode),
        border: Border.all(
          color: selected ? Colors.black : Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: foregroundColor(
                  selected: selected,
                  isDarkMode: isDarkMode,
                ),
              ),
        ),
      ),
    );
  }
}
