import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/models/post_more_item.dart';

enum PostMoreSectionItemType {
  normal,
  danger;
}

class PostMoreSectionItem extends StatelessWidget {
  const PostMoreSectionItem({
    super.key,
    required this.item,
    this.type = PostMoreSectionItemType.normal,
    this.onTap,
  });

  final PostMoreItem item;
  final PostMoreSectionItemType type;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        child: Text(
          item.title,
          style: TextStyle(
            color: type == PostMoreSectionItemType.danger
                ? Colors.red
                : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
