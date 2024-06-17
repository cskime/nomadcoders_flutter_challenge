import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/home_post_list_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/post.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Icon(
              FontAwesomeIcons.threads,
              size: 36,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: dummyPosts.length,
              (context, index) {
                final post = dummyPosts[index];
                return HomePostListItem(post: post);
              },
            ),
          )
        ],
      ),
    );
  }
}
