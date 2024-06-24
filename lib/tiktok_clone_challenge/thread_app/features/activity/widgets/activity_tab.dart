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

  Color backgroundColor({required bool isDarkMode}) {
    if (selected) {
      return isDarkMode ? Colors.white : Colors.black;
    } else {
      return isDarkMode ? Colors.black : Colors.white;
    }
  }

  Color foregroundColor({required bool isDarkMode}) {
    if (selected) {
      return isDarkMode ? Colors.black : Colors.white;
    } else {
      return isDarkMode ? Colors.white : Colors.black;
    }
  }

  Color borderColor({required bool isDarkMode}) {
    if (selected) {
      return isDarkMode ? Colors.white : Colors.black;
    } else {
      return isDarkMode ? Colors.grey : Colors.grey.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThreadTheme.isDarkTheme(context);
    return Container(
      width: 100,
      height: 36,
      decoration: BoxDecoration(
        color: backgroundColor(isDarkMode: isDarkMode),
        border: Border.all(
          color: borderColor(isDarkMode: isDarkMode),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: foregroundColor(isDarkMode: isDarkMode),
              ),
        ),
      ),
    );
  }
}
