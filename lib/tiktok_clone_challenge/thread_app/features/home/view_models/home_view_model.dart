import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/models/post.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/repositories/posts_repository.dart';

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, List<Post>>(
  () => HomeViewModel(),
);

class HomeViewModel extends AsyncNotifier<List<Post>> {
  late final PostsRepositoryType _postsRepository;

  @override
  FutureOr<List<Post>> build() async {
    _postsRepository = ref.read(postsRepositoryProvider);
    return await _postsRepository.fetchPosts();
  }

  Future<void> fetchPosts() async {
    state = await AsyncValue.guard(
      () async => await _postsRepository.fetchPosts(),
    );
  }
}
