import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_user_avatar.dart';

class OwnPostsListItem extends ConsumerWidget {
  const OwnPostsListItem({
    super.key,
    required this.profileImageUrl,
    required this.bodyText,
    this.body,
  });

  final String profileImageUrl;
  final Widget bodyText;
  final Widget? body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PostListItem(
      avatar: PostListItemUserAvatar(
        profileImageUrl: profileImageUrl,
        showsFollowButton: false,
      ),
      action: const Icon(FontAwesomeIcons.ellipsis),
      title: "jane_mobbin",
      verified: false,
      updated: "5h",
      bodyText: bodyText,
      body: body,
    );
  }
}
