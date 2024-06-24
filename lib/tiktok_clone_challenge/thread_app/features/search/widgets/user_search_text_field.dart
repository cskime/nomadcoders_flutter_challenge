import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';

class UserSearchTextField extends SliverPersistentHeaderDelegate {
  UserSearchTextField({this.onSearchChanged});

  final void Function(String text)? onSearchChanged;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final isDarkMode = ThreadTheme.isDarkTheme(context);
    final Color? backgroundColor = isDarkMode ? Colors.grey.shade800 : null;
    final itemColor = isDarkMode ? Colors.grey : CupertinoColors.secondaryLabel;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoSearchTextField(
        onChanged: onSearchChanged,
        backgroundColor: backgroundColor,
        itemColor: itemColor,
        style: TextStyle(
          color: ThreadTheme.foregroundColor(
            isDarkMode: isDarkMode,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 36;

  @override
  double get minExtent => 36;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
