import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_more/widgets/post_more_section_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';

class PostMoreSection extends StatelessWidget {
  const PostMoreSection({
    super.key,
    required this.items,
  });

  final List<PostMoreSectionItem> items;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThreadTheme.isDarkTheme(context);

    if (items.isEmpty) {
      return Container();
    }

    var children = <Widget>[items.first];
    for (int index = 1; index < items.length; index++) {
      children.addAll([
        const Divider(height: 1),
        items[index],
      ]);
    }
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
