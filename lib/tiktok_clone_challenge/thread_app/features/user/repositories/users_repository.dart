import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/models/user_profile.dart';

final usersRepositoryProvider = Provider<UsersRepositoryType>(
  (ref) => UsersRepositoryMock(),
);

abstract class UsersRepositoryType {
  Future<void> createProfile(UserProfile profile);
  Future<List<UserProfile>> fetchProfiles();
  Future<UserProfile?> fetchProfile({required String userId});
}

class UsersRepositoryMock extends UsersRepositoryType {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  late final _usersCollection = _database.collection("users");

  @override
  Future<void> createProfile(UserProfile profile) async {
    await _usersCollection.doc(profile.userId).set(profile.toJson());
  }

  @override
  Future<List<UserProfile>> fetchProfiles() async {
    return (jsonDecode(userProfilesDummyJson) as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .map((json) => UserProfile.fromJson(json))
        .toList();
  }

  @override
  Future<UserProfile?> fetchProfile({required String userId}) async {
    final json = jsonDecode(userProfileDummyJson) as Map<String, dynamic>;
    return UserProfile.fromJson(json);
  }
}

class UsersRepository extends UsersRepositoryType {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  late final _usersCollection = _database.collection("users");

  @override
  Future<void> createProfile(UserProfile profile) async {
    await _usersCollection.doc(profile.userId).set(profile.toJson());
  }

  @override
  Future<List<UserProfile>> fetchProfiles() async {
    final snapshot = await _usersCollection.get();
    return snapshot.docs
        .map((doc) => UserProfile.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<UserProfile?> fetchProfile({required String userId}) async {
    final snapshot = await _usersCollection.doc(userId).get();
    final json = snapshot.data();

    if (json == null) {
      return null;
    }

    return UserProfile.fromJson(json);
  }
}
