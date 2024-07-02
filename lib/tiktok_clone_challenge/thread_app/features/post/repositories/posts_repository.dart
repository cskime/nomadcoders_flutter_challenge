import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/models/post.dart';

final postsRepositoryProvider = Provider(
  (ref) => PostsRepositoryMock(),
);

abstract class PostsRepositoryType {
  Future<List<Post>> fetchPosts();
  Future<void> uploadPost();
}

class PostsRepositoryMock extends PostsRepositoryType {
  @override
  Future<List<Post>> fetchPosts() async {
    final json = jsonDecode(postsDummyJson) as List<Map<String, dynamic>>;
    return json.map((postJson) => Post.fromJson(postJson)).toList();
  }

  @override
  Future<void> uploadPost() async {}
}
