import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostListItemAvatar extends StatelessWidget {
  const PostListItemAvatar({
    super.key,
    this.profileImage,
  });

  factory PostListItemAvatar.asset(String? imageUrl) {
    return PostListItemAvatar(
      profileImage: imageUrl == null ? null : AssetImage(imageUrl),
    );
  }

  final ImageProvider<Object>? profileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: profileImage == null
          ? const Icon(
              FontAwesomeIcons.user,
            )
          : Image(image: profileImage!),
    );
  }
}
