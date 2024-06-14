import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ActivityType {
  replies,
  mentions,
  requests,
  likes;

  String get title => switch (this) {
        ActivityType.replies => 'Replies',
        ActivityType.mentions => 'Mentions',
        ActivityType.requests => 'Requests',
        ActivityType.likes => 'Quotes',
      };

  IconData get iconData => switch (this) {
        ActivityType.replies => Icons.reply,
        ActivityType.mentions => FontAwesomeIcons.threads,
        ActivityType.requests => FontAwesomeIcons.solidUser,
        ActivityType.likes => FontAwesomeIcons.solidHeart,
      };

  Widget get icon => switch (this) {
        ActivityType.replies => _IconContainer(
            color: Colors.blue.shade200,
            iconData: iconData,
            iconSize: 18,
          ),
        ActivityType.mentions => _IconContainer(
            color: Colors.green.shade300,
            iconData: iconData,
            iconSize: 18,
          ),
        ActivityType.requests => _IconContainer(
            color: Colors.purple.shade800,
            iconData: iconData,
            iconSize: 14,
          ),
        ActivityType.likes => _IconContainer(
            color: Colors.pink,
            iconData: iconData,
            iconSize: 12,
          ),
      };
}

class _IconContainer extends StatelessWidget {
  const _IconContainer({
    required this.color,
    required this.iconData,
    required this.iconSize,
  });

  final Color color;
  final IconData iconData;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}
