import 'package:flutter/material.dart';

class PostListItemAvatar extends StatelessWidget {
  const PostListItemAvatar({
    super.key,
    this.profileImage,
    required this.placeholder,
    this.fontSize,
  });

  final ImageProvider<Object>? profileImage;
  final String placeholder;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      foregroundImage: profileImage,
      radius: 20,
      child: Text(
        placeholder,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
