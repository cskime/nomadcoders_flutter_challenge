import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/search/widgets/user_search_list_tile.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              'Search',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoSearchTextField(),
            ),
          ),
          SliverList.builder(
            itemCount: dummyUsers.length * 2,
            itemBuilder: (context, index) {
              final user = dummyUsers[index % dummyUsers.length];
              return UserSearchListTile(user: user);
            },
          ),
        ],
      ),
    );
  }
}
