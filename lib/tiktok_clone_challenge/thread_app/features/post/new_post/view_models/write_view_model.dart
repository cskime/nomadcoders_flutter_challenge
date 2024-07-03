import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/models/post.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/repositories/posts_repository.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/models/user_profile.dart';

final writeViewModelProvider = AsyncNotifierProvider.autoDispose(
  () => WriteViewModel(),
);

class WriteViewModel extends AutoDisposeAsyncNotifier {
  late final PostsRepository _postsRepository;

  @override
  FutureOr build() {
    _postsRepository = ref.read(postsRepositoryProvider);
  }

  Future<void> uploadPost({
    required UserProfile user,
    required String body,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final newPost = Post(
          authorId: user.userId,
          authorName: user.username,
          authorProfileImageUrl: user.profileImageUrl,
          authorVerified: user.verified,
          body: body,
          timestamp: Timestamp.now(),
        );
        await _postsRepository.uploadPost(newPost);
      },
    );
  }
}
