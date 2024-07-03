import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/view_models/home_view_model.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/views/widgets/home_post_list_item.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = "";
  static const routeUrl = "/";

  const HomeScreen({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    await ref.read(homeViewModelProvider.notifier).fetchPosts();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator.adaptive(
      displacement: MediaQuery.viewPaddingOf(context).top,
      edgeOffset: MediaQuery.viewPaddingOf(context).top,
      onRefresh: () => _onRefresh(ref),
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Icon(
              FontAwesomeIcons.threads,
              size: 36,
            ),
          ),
          ref.watch(homeViewModelProvider).when(
                data: (data) => data.isEmpty
                    ? const SliverToBoxAdapter(
                        child: Center(
                          child: Text("There's no posts."),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: data.length,
                          (context, index) =>
                              HomePostListItem(post: data[index]),
                        ),
                      ),
                error: (error, stackTrace) => SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                loading: () => const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
