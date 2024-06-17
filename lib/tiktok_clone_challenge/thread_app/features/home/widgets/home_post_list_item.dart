import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/multiple_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_image.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_user_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_more/models/post_more_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_more/post_more_bottom_sheet.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_report/post_report_bottom_sheet.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/post.dart';

class HomePostListItem extends StatelessWidget {
  const HomePostListItem({
    super.key,
    required this.post,
  });

  final Post post;

  void _onMoreTap(BuildContext context) async {
    final item = await showModalBottomSheet(
      context: context,
      builder: (context) => const PostMoreBottomSheet(),
    );

    if (!context.mounted) {
      return;
    }

    if (item == PostMoreItem.report) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) => const PostReportBottomSheet(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PostListItem(
      avatar: PostListItemUserAvatar(
        user: post.user,
        showsFollowButton: true,
      ),
      action: GestureDetector(
        onTap: () => _onMoreTap(context),
        child: const Icon(
          FontAwesomeIcons.ellipsis,
          size: 18,
        ),
      ),
      title: post.user.username,
      verified: post.user.verified,
      updated: post.updated,
      bodyText: Text(
        post.body,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      body: post.imageUrls.isEmpty
          ? null
          : PostListItemImage(imageUrls: post.imageUrls),
      footer: Padding(
        padding: const EdgeInsets.only(left: 12, right: 16),
        child: Row(
          children: [
            MultipleAvatar(
              paths:
                  post.repliers.map((user) => user.profileImagePath!).toList(),
            ),
            const SizedBox(width: 10),
            Text(
              '${post.commentCount} ${post.commentCount > 1 ? 'replies' : 'reply'} · ${post.likeCount} likes',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
