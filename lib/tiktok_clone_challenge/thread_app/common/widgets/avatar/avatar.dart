import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.size = 40,
    this.profileImage,
  });

  factory Avatar.asset({
    String? imageUrl,
    double size = 40,
  }) {
    return Avatar(
      size: size,
      profileImage: imageUrl == null ? null : AssetImage(imageUrl),
    );
  }

  final double size;
  final ImageProvider<Object>? profileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
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
