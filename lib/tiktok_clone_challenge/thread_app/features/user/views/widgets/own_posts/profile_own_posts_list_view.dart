import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_body_post.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/models/user_profile.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/views/widgets/own_posts/own_posts_list_item.dart';

class ProfileOwnPostsListView extends StatelessWidget {
  const ProfileOwnPostsListView({
    super.key,
    required this.user,
  });

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OwnPostsListItem(
          profileImageUrl: user.profileImageUrl!,
          bodyText: const Text.rich(
            TextSpan(
              text: "Give ",
              children: [
                TextSpan(
                  text: "@john_mobbin",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: " a follow if you want to see more travel content!",
                ),
              ],
            ),
          ),
        ),
        OwnPostsListItem(
          profileImageUrl: user.profileImageUrl!,
          bodyText: const Text("Tea. Spillage."),
          body: PostListItemBodyPost(
            userProfileImagePath: user.profileImageUrl!,
            username: "iwetmyyplants",
            verifiedUser: true,
            bodyText:
                "I'm just going to say what we are all thinking and knowing is about to go downity down: there is about to be some piping hot tea spillage on here daily that people wiill be...",
            imageUrls: const [
              'assets/images/thread-image.jpg',
            ],
          ),
        ),
        OwnPostsListItem(
          profileImageUrl: user.profileImageUrl!,
          bodyText: const Text.rich(
            TextSpan(
              text: "Give ",
              children: [
                TextSpan(
                  text: "@john_mobbin",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: " a follow if you want to see more travel content!",
                ),
              ],
            ),
          ),
        ),
        OwnPostsListItem(
          profileImageUrl: user.profileImageUrl!,
          bodyText: const Text("Tea. Spillage."),
          body: PostListItemBodyPost(
            userProfileImagePath: user.profileImageUrl!,
            username: "iwetmyyplants",
            verifiedUser: true,
            bodyText:
                "I'm just going to say what we are all thinking and knowing is about to go downity down: there is about to be some piping hot tea spillage on here daily that people wiill be...",
            imageUrls: const [
              'assets/images/thread-image.jpg',
            ],
          ),
        ),
      ],
    );
  }
}
