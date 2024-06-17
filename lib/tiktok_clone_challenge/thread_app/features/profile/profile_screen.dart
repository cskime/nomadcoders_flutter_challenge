import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/multiple_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/post_list_item/post_list_item_body_post.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/link_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/own_posts_list_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/profile_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/profile_tab_bar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

final _user = dummyUsers.first;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              leading: Icon(FontAwesomeIcons.globe),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(FontAwesomeIcons.cameraRetro),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(FontAwesomeIcons.bars),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _user.username,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(_user.name),
                                  const SizedBox(width: 8),
                                  const LinkButton(title: "threads.net"),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(_user.bio),
                            ],
                          ),
                        ),
                        Avatar.asset(
                          size: 72,
                          imageUrl: _user.profileImagePath!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        MultipleAvatar(
                          paths: _user.followers
                              .map((user) => user.profileImagePath!)
                              .toList(),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${_user.followers.length} followers",
                          style: TextStyle(color: Colors.grey.shade600),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Expanded(
                          child: ProfileButton(title: "Edit profile"),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ProfileButton(title: "Share profile"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ProfileTabBar(),
            ),
            SliverList.list(
              children: [
                const OwnPostsListItem(
                  bodyText: Text.rich(
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
                          text:
                              " a follow if you want to see more travel content!",
                        ),
                      ],
                    ),
                  ),
                ),
                OwnPostsListItem(
                  bodyText: const Text("Tea. Spillage."),
                  body: PostListItemBodyPost(
                    userProfileImagePath: _user.profileImagePath!,
                    username: "iwetmyyplants",
                    verifiedUser: true,
                    bodyText:
                        "I'm just going to say what we are all thinking and knowing is about to go downity down: there is about to be some piping hot tea spillage on here daily that people wiill be...",
                    imageUrls: const [
                      'assets/images/thread-image.jpg',
                    ],
                  ),
                ),
                const OwnPostsListItem(
                  bodyText: Text.rich(
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
                          text:
                              " a follow if you want to see more travel content!",
                        ),
                      ],
                    ),
                  ),
                ),
                OwnPostsListItem(
                  bodyText: const Text("Tea. Spillage."),
                  body: PostListItemBodyPost(
                    userProfileImagePath: _user.profileImagePath!,
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
            ),
          ],
        ),
      ),
    );
  }
}
