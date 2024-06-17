import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

class PostListItemUserAvatar extends StatelessWidget {
  const PostListItemUserAvatar({
    super.key,
    required this.user,
    required this.showsFollowButton,
  });

  final User user;
  final bool showsFollowButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Avatar.asset(imageUrl: user.profileImagePath),
          ),
          if (showsFollowButton)
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            )
        ],
      ),
    );
  }
}
