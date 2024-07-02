import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_body_post.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_user_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/views/widgets/replies_posts/replies_posts_list_item.dart';

class RepliesPostsListView extends StatelessWidget {
  const RepliesPostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        RepliesPostsListItem(
          username: "john_mobbin",
          bodyText: Text("Always a dream to see the Median in Morocco!"),
          body: PostListItemBodyPost(
            userProfileImagePath: "assets/images/thread-profile-image-1.jpg",
            username: "earthpix",
            verifiedUser: true,
            bodyText:
                "What is one place you're absolutely traveling to by next year?",
          ),
          footer: PostListItem(
            avatar: PostListItemUserAvatar(
              profileImageUrl: "assets/images/thread-profile-image-1.jpg",
              showsFollowButton: false,
            ),
            action: FaIcon(FontAwesomeIcons.ellipsis),
            title: "jane_mobbin",
            verified: false,
            updated: "5h",
            bodyText: Text("See you there!"),
          ),
        ),
        RepliesPostsListItem(
          username: "john_mobbin",
          bodyText: Text("Always a dream to see the Median in Morocco!"),
          body: PostListItemBodyPost(
            userProfileImagePath: "assets/images/thread-profile-image-1.jpg",
            username: "earthpix",
            verifiedUser: true,
            bodyText:
                "What is one place you're absolutely traveling to by next year?",
          ),
          footer: PostListItem(
            avatar: PostListItemUserAvatar(
              profileImageUrl: "assets/images/thread-profile-image-1.jpg",
              showsFollowButton: false,
            ),
            action: FaIcon(FontAwesomeIcons.ellipsis),
            title: "jane_mobbin",
            verified: false,
            updated: "5h",
            bodyText: Text("See you there!"),
          ),
        ),
        RepliesPostsListItem(
          username: "john_mobbin",
          bodyText: Text("Always a dream to see the Median in Morocco!"),
          body: PostListItemBodyPost(
            userProfileImagePath: "assets/images/thread-profile-image-1.jpg",
            username: "earthpix",
            verifiedUser: true,
            bodyText:
                "What is one place you're absolutely traveling to by next year?",
          ),
          footer: PostListItem(
            avatar: PostListItemUserAvatar(
              profileImageUrl: "assets/images/thread-profile-image-1.jpg",
              showsFollowButton: false,
            ),
            action: FaIcon(FontAwesomeIcons.ellipsis),
            title: "jane_mobbin",
            verified: false,
            updated: "5h",
            bodyText: Text("See you there!"),
          ),
        ),
      ],
    );
  }
}
