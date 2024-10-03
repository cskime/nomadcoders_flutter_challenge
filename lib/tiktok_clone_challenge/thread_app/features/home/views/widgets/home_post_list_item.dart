import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/multiple_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_image.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_user_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/username_label.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/models/post.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_more/models/post_more_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_more/post_more_bottom_sheet.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_report/post_report_bottom_sheet.dart';

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
        profileImageUrl: post.authorProfileImageUrl,
        showsFollowButton: true,
      ),
      action: GestureDetector(
        onTap: () => _onMoreTap(context),
        child: const Icon(
          FontAwesomeIcons.ellipsis,
          size: 18,
        ),
      ),
      title: post.authorName,
      verified: post.authorVerified,
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
              paths: post.replierProfileImageUrls,
            ),
            const SizedBox(width: 10),
            Text(
              '${post.replyCount} ${post.replyCount > 1 ? 'replies' : 'reply'} · ${post.likeCount} likes',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }

  /// ListItem에 표시되는 image들이 화면 밖으로 완전히 나가지 않았는데도 사라지는 문제를 해결한 버전
  /// 단, avatar 아래에 있는 vertical line은 구현되지 않음
  Widget fixedVersion(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 12),
              Column(
                children: [
                  PostListItemUserAvatar(
                    profileImageUrl: post.authorProfileImageUrl,
                    showsFollowButton: true,
                  ),
                  const VerticalDivider(
                    thickness: 2,
                    width: 2,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        UsernameLabel(
                          text: post.authorName,
                          verified: true,
                        ),
                        const Spacer(),
                        Text(
                          post.updated,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => _onMoreTap(context),
                          child: const Icon(
                            FontAwesomeIcons.ellipsis,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    Text(
                      post.body,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (post.imageUrls.isNotEmpty) const SizedBox(height: 216),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Wrap(
                        spacing: 20,
                        children: [
                          Icon(FontAwesomeIcons.heart, size: 20),
                          Icon(FontAwesomeIcons.comment, size: 20),
                          Icon(FontAwesomeIcons.repeat, size: 20),
                          Icon(FontAwesomeIcons.paperPlane, size: 20),
                        ],
                      ),
                    ),
                    Text(
                      '${post.replyCount} ${post.replyCount > 1 ? 'replies' : 'reply'} · ${post.likeCount} likes',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (post.imageUrls.isNotEmpty)
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: PostListItemImage(imageUrls: post.imageUrls),
          ),
        const Positioned(
            left: 0, right: 0, bottom: 0, child: Divider(height: 1)),
      ],
    );
  }
}
