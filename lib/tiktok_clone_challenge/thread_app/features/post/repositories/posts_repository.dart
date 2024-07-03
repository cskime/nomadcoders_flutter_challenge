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
    final json = jsonDecode(postsDummyJson) as List;
    return json.map((postJson) {
      print(postJson["imageUrls"]);
      print(postJson["repliers"]);
      print(postJson["replierProfileImageUrls"]);
      return Post.fromJson(postJson);
    }).toList();
  }

  @override
  Future<void> uploadPost() async {}
}
