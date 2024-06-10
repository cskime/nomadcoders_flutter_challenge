import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/post_list_item_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

class PostListItemRepliersAvatar extends StatelessWidget {
  const PostListItemRepliersAvatar({
    super.key,
    required this.repliers,
  });

  final List<User> repliers;

  final double _boxSize = 48;

  Widget get _singleAvatar {
    final avatarSize = _boxSize * 0.7;
    return SizedBox(
      width: _boxSize,
      height: _boxSize,
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: avatarSize,
            height: avatarSize,
            child: PostListItemAvatar.asset(repliers.first.profileImagePath),
          ),
        ),
      ]),
    );
  }

  Widget get _doubleAvatars {
    final borderDecoration = BoxDecoration(
      color: Colors.black,
      border: Border.all(color: Colors.white, width: 3),
      shape: BoxShape.circle,
    );
    final avatarSize = _boxSize * 0.6;

    return SizedBox(
      width: _boxSize,
      height: avatarSize,
      child: Stack(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: borderDecoration,
            child: PostListItemAvatar.asset(repliers[0].profileImagePath),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: borderDecoration,
            child: PostListItemAvatar.asset(repliers[1].profileImagePath),
          ),
        ),
      ]),
    );
  }

  Widget get _multipleAvatars {
    final borderDecoration = BoxDecoration(
      color: Colors.black,
      border: Border.all(color: Colors.white, width: 3),
      shape: BoxShape.circle,
    );

    return SizedBox(
      width: _boxSize,
      height: _boxSize,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: _boxSize * 0.6,
              height: _boxSize * 0.6,
              decoration: borderDecoration,
              child: PostListItemAvatar.asset(repliers[0].profileImagePath),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: _boxSize * 0.5,
              height: _boxSize * 0.5,
              decoration: borderDecoration,
              child: PostListItemAvatar.asset(repliers[2].profileImagePath),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: _boxSize * 0.4,
              height: _boxSize * 0.4,
              decoration: borderDecoration,
              child: PostListItemAvatar.asset(repliers[2].profileImagePath),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (repliers.isEmpty) {
      return Container(width: _boxSize);
    }

    if (repliers.length == 1) {
      return _singleAvatar;
    }

    if (repliers.length == 2) {
      return _doubleAvatars;
    }

    return _multipleAvatars;
  }
}