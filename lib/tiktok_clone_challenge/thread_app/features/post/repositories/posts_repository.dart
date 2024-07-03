import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/models/post.dart';

final postsRepositoryProvider = Provider(
  // (ref) => PostsRepositoryMock(),
  (ref) => PostsRepository(),
);

abstract class PostsRepositoryType {
  Future<List<Post>> fetchPosts();
  Future<void> uploadPost(Post post);
}

class PostsRepositoryMock extends PostsRepositoryType {
  @override
  Future<List<Post>> fetchPosts() async {
    final json = jsonDecode(postsDummyJson) as List;
    return json.map((postJson) => Post.fromJson(postJson)).toList();
  }

  @override
  Future<void> uploadPost(Post post) async {}
}

class PostsRepository extends PostsRepositoryType {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  late final _collection = _database.collection("posts");

  @override
  Future<List<Post>> fetchPosts() async {
    final snapshot =
        await _collection.orderBy("timestamp", descending: true).get();
    return snapshot.docs.map((doc) => doc.data()).map(Post.fromJson).toList();
  }

  @override
  Future<void> uploadPost(Post post) async {
    await _collection.add(post.toJson());
  }
}
