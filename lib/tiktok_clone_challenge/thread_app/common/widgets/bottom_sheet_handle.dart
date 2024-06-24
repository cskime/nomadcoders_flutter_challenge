import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThreadTheme.isDarkTheme(context);
    return Container(
      width: 52,
      height: 6,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
