import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/multiple_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/link_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/own_posts/profile_own_posts_list_view.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/profile_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/profile_tab_bar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/profile/widgets/replies_posts/replies_posts_list_view.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/settings_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

final _user = dummyUsers.first;

class ProfileScreen extends StatelessWidget {
  static const routeName = "profile";
  static const routeUrl = "/profile";

  const ProfileScreen({super.key});

  void _onSettingsPressed(BuildContext context) {
    context.pushNamed(SettingsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              leading: const Icon(FontAwesomeIcons.globe),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.cameraRetro),
                ),
                IconButton(
                  onPressed: () => _onSettingsPressed(context),
                  icon: const Icon(FontAwesomeIcons.bars),
                ),
              ],
              shape: const Border(),
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
                                style: Theme.of(context).textTheme.titleLarge,
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
          ],
          body: TabBarView(
            children: [
              ProfileOwnPostsListView(user: _user),
              const RepliesPostsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
