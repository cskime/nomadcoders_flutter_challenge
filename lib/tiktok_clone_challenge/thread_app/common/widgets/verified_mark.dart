import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';

class VerifiedMark extends StatelessWidget {
  const VerifiedMark({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThreadTheme.isDarkTheme(context);
    return Icon(
      Icons.verified,
      color: isDarkMode ? Colors.blue.shade300 : Colors.blue,
      size: 16,
    );
  }
}
