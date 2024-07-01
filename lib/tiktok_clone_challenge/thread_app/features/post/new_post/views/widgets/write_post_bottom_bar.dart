import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WritePostBottomBar extends StatelessWidget {
  const WritePostBottomBar({
    super.key,
    required this.height,
    required this.canPost,
    required this.loading,
    required this.onPostPressed,
  });

  final double height;
  final bool canPost;
  final bool loading;
  final void Function()? onPostPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Anyone can reply',
            style: TextStyle(color: Colors.grey),
          ),
          loading
              ? const CupertinoActivityIndicator()
              : GestureDetector(
                  onTap: onPostPressed,
                  child: Text(
                    'Post',
                    style: TextStyle(
                      color: canPost ? Colors.blue : Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
