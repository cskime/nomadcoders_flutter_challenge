import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/avatar.dart';

class MultipleAvatar extends StatelessWidget {
  const MultipleAvatar({
    super.key,
    required this.paths,
  });

  final List<String> paths;

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
            child: Avatar.asset(imageUrl: paths.first),
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
            child: Avatar.asset(imageUrl: paths[0]),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: borderDecoration,
            child: Avatar.asset(imageUrl: paths[1]),
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
              child: Avatar.asset(imageUrl: paths[0]),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: _boxSize * 0.5,
              height: _boxSize * 0.5,
              decoration: borderDecoration,
              child: Avatar.asset(imageUrl: paths[2]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: _boxSize * 0.4,
              height: _boxSize * 0.4,
              decoration: borderDecoration,
              child: Avatar.asset(imageUrl: paths[2]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (paths.isEmpty) {
      return Container(width: _boxSize);
    }

    if (paths.length == 1) {
      return _singleAvatar;
    }

    if (paths.length == 2) {
      return _doubleAvatars;
    }

    return _multipleAvatars;
  }
}
