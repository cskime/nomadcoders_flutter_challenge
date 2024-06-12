import 'package:flutter/material.dart';

enum PostMoreSectionItemType {
  normal,
  danger;
}

class PostMoreSectionItem extends StatelessWidget {
  const PostMoreSectionItem({
    super.key,
    required this.title,
    this.type = PostMoreSectionItemType.normal,
    this.onTap,
  });

  final String title;
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
          title,
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
