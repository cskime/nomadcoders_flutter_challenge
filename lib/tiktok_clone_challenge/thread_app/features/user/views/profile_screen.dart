import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/avatar/multiple_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/views/settings_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/view_models/profile_view_model.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/views/widgets/link_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/views/widgets/own_posts/profile_own_posts_list_view.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/views/widgets/profile_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/views/widgets/profile_tab_bar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/views/widgets/replies_posts/replies_posts_list_view.dart';

class ProfileScreen extends ConsumerWidget {
  static const routeName = "profile";
  static const routeUrl = "/profile";

  const ProfileScreen({super.key});

  void _onSettingsPressed(BuildContext context) {
    context.pushNamed(SettingsScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(profileViewModelProvider);

    if (user.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    if (user.hasError) {
      return const Center(
        child: Text("Something went wrong."),
      );
    }

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
                                user.value!.username,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Row(
                                children: [
                                  Text(user.value!.name),
                                  const SizedBox(width: 8),
                                  const LinkButton(title: "threads.net"),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(user.value!.bio),
                            ],
                          ),
                        ),
                        Avatar.asset(
                          size: 72,
                          imageUrl: user.value!.profileImageUrl!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const MultipleAvatar(
                          // paths: user.value!.followers
                          //     .map((user) => user.profileImageUrl!)
                          //     .toList(),
                          paths: [],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${user.value!.followerCount} followers",
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
              ProfileOwnPostsListView(user: user.value!),
              const RepliesPostsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
