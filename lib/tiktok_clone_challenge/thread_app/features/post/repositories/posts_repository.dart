import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/models/post.dart';

final postsRepositoryProvider = Provider(
  // (ref) => PostsRepositoryMock(),
  (ref) => PostsRepository(),
);

abstract class PostsRepositoryType {
  Future<List<Post>> fetchPosts();
  Future<String> uploadPost(Post post);
  Future<List<String>> uploadPostImages(
    List<(File, String)> fileInfos, {
    required String postId,
  });
  Future<void> updatePostImages(
    List<String> imageUrls, {
    required String postId,
  });
}

class PostsRepositoryMock extends PostsRepositoryType {
  @override
  Future<List<Post>> fetchPosts() async {
    final json = jsonDecode(postsDummyJson) as List;
    return json.map((postJson) => Post.fromJson(postJson)).toList();
  }

  @override
  Future<String> uploadPost(Post post) async {
    return "";
  }

  @override
  Future<List<String>> uploadPostImages(
    List<(File, String)> fileInfos, {
    required String postId,
  }) async {
    return [];
  }

  @override
  Future<void> updatePostImages(
    List<String> imageUrls, {
    required String postId,
  }) async {}
}

class PostsRepository extends PostsRepositoryType {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  late final _collection = _database.collection("posts");

  @override
  Future<List<Post>> fetchPosts() async {
    final snapshot =
        await _collection.orderBy("timestamp", descending: true).get();
    return snapshot.docs.map((doc) => doc.data()).map(Post.fromJson).toList();
  }

  @override
  Future<String> uploadPost(Post post) async {
    final newDocument = await _collection.add(post.toJson());
    return newDocument.id;
  }

  @override
  Future<List<String>> uploadPostImages(
    List<(File, String)> fileInfos, {
    required String postId,
  }) async {
    final reference = _storage.ref("posts/$postId");
    final results = await Future.wait(
      fileInfos.map((info) async => reference.child(info.$2).putFile(info.$1)),
    );
    return await Future.wait(
      results.map((task) => task.ref.getDownloadURL()),
    );
  }

  @override
  Future<void> updatePostImages(
    List<String> imageUrls, {
    required String postId,
  }) async {
    await _collection.doc(postId).update({"imageUrls": imageUrls});
  }
}
