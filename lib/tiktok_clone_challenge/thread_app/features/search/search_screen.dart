import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/search/widgets/user_search_list_tile.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/search/widgets/user_search_text_field.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "search";
  static const routeUrl = "/search";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final users = [...dummyUsers, ...dummyUsers];
  late var displayingUsers = users;

  void _onSearchChanged(String text) {
    setState(() {
      displayingUsers = text.isEmpty
          ? users
          : users
              .where((user) =>
                  user.username.contains(text) || user.name.contains(text))
              .toList();
    });
  }

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
          SliverPersistentHeader(
            pinned: true,
            delegate: UserSearchTextField(
              onSearchChanged: _onSearchChanged,
            ),
          ),
          SliverList.builder(
            itemCount: displayingUsers.length,
            itemBuilder: (context, index) {
              final user = displayingUsers[index % displayingUsers.length];
              return UserSearchListTile(user: user);
            },
          ),
        ],
      ),
    );
  }
}
