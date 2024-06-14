import 'package:flutter/material.dart';

class WritePostBottomBar extends StatelessWidget {
  const WritePostBottomBar({
    super.key,
    required this.height,
    required this.canPost,
  });

  final double height;
  final bool canPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: height,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Anyone can reply',
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            'Post',
            style: TextStyle(
              color: canPost ? Colors.blue : Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
