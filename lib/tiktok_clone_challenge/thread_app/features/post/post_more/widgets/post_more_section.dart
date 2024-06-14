import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_more/widgets/post_more_section_item.dart';

class PostMoreSection extends StatelessWidget {
  const PostMoreSection({
    super.key,
    required this.items,
  });

  final List<PostMoreSectionItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container();
    }

    var children = <Widget>[items.first];
    for (int index = 1; index < items.length; index++) {
      children.addAll([
        Divider(
          color: Colors.grey.shade300,
          height: 1,
        ),
        items[index],
      ]);
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
