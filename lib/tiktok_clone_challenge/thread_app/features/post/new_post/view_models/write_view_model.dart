import 'dart:async';
import 'dart:io';

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
    List<File>? imageFiles,
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

        final postId = await _postsRepository.uploadPost(newPost);

        if (imageFiles != null) {
          final filenames =
              imageFiles.map((file) => "${file.hashCode}").toList();
          final fileInfos = _zip(imageFiles, filenames);
          final imageUrls = await _postsRepository.uploadPostImages(
            fileInfos,
            postId: postId,
          );
          await _postsRepository.updatePostImages(imageUrls, postId: postId);
        }
      },
    );
  }
}

List<(E1, E2)> _zip<E1, E2>(List<E1> list1, List<E2> list2) {
  assert(list1.length == list2.length);

  var result = <(E1, E2)>[];
  for (int index = 0; index < list1.length; index++) {
    result.add((list1[index], list2[index]));
  }
  return result;
}
