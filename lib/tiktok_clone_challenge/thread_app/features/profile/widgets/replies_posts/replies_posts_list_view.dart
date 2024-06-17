import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_body_post.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/replies_posts/replies_posts_list_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

class RepliesPostsListView extends StatelessWidget {
  const RepliesPostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RepliesPostsListItem(
          username: "john_mobbin",
          bodyText: const Text("Always a dream to see the Median in Morocco!"),
          body: PostListItemBodyPost(
            userProfileImagePath: dummyUsers[1].profileImagePath!,
            username: "earthpix",
            verifiedUser: true,
            bodyText:
                "What is one place you're absolutely traveling to by next year?",
          ),
        ),
        const RepliesPostsListItem(
          username: "jane_mobbin",
          bodyText: Text("See you there!"),
        ),
        RepliesPostsListItem(
          username: "john_mobbin",
          bodyText: const Text("Always a dream to see the Median in Morocco!"),
          body: PostListItemBodyPost(
            userProfileImagePath: dummyUsers[1].profileImagePath!,
            username: "earthpix",
            verifiedUser: true,
            bodyText:
                "What is one place you're absolutely traveling to by next year?",
          ),
        ),
        const RepliesPostsListItem(
          username: "jane_mobbin",
          bodyText: Text("See you there!"),
        ),
      ],
    );
  }
}
