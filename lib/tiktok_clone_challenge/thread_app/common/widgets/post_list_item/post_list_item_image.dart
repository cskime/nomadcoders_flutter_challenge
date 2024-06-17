import 'package:flutter/material.dart';

class PostListItemImage extends StatelessWidget {
  const PostListItemImage({
    super.key,
    required this.imageUrls,
  });

  final List<String> imageUrls;
  final double _height = 216;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          var imageWidth = constraints.maxWidth;
          if (imageUrls.length > 1) {
            imageWidth -= 16;
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) => Container(
              width: imageWidth,
              height: _height,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            clipBehavior: Clip.none,
          );
        },
      ),
    );
  }
}
