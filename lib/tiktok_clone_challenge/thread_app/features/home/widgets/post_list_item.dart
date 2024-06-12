import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/models/post_more_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/more/post_more_bottom_sheet.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/post_list_item_image.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/post_list_item_repliers_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/post_list_item_user_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/report/post_report_bottom_sheet.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});

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
        builder: (context) => const PostReportBottomSheet(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 12,
            right: 16,
            bottom: 8,
          ),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        PostListItemUserAvatar(user: post.user),
                        if (post.repliers.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Expanded(
                            child: SizedBox(
                              width: 2,
                              child: ColoredBox(color: Colors.grey.shade300),
                            ),
                          ),
                          const SizedBox(height: 4),
                        ]
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                post.user.username,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 16,
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
                            ],
                          ),
                          Text(
                            post.body,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          if (post.imageUrls.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child:
                                  PostListItemImage(imageUrls: post.imageUrls),
                            ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  PostListItemRepliersAvatar(repliers: post.repliers),
                  const SizedBox(width: 10),
                  Text(
                    '${post.commentCount} ${post.commentCount > 1 ? 'replies' : 'reply'} · ${post.likeCount} likes',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey.shade200),
      ],
    );
  }
}
