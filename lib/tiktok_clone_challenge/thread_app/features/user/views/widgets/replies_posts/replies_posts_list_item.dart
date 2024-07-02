import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_user_avatar.dart';

class RepliesPostsListItem extends StatelessWidget {
  const RepliesPostsListItem({
    super.key,
    required this.username,
    required this.bodyText,
    this.body,
    this.footer,
  });

  final String username;
  final Widget bodyText;
  final Widget? body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return PostListItem(
      avatar: const PostListItemUserAvatar(
        profileImageUrl: "",
        showsFollowButton: false,
      ),
      action: const Icon(FontAwesomeIcons.ellipsis),
      title: username,
      verified: false,
      updated: "5h",
      bodyText: bodyText,
      body: body,
      footer: footer,
    );
  }
}
