import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/search/view_models/search_view_model.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/search/views/widgets/user_search_list_tile.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/search/views/widgets/user_search_text_field.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const routeName = "search";
  static const routeUrl = "/search";

  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  void _onSearchChanged(String text) {
    ref.read(searchViewModelProvider.notifier).search(query: text);
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(searchViewModelProvider).when(
          data: (users) {
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
                    shape: Border(),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: UserSearchTextField(
                      onSearchChanged: _onSearchChanged,
                    ),
                  ),
                  SliverList.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) =>
                        UserSearchListTile(user: users[index]),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Fail to fetch users."),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
  }
}
