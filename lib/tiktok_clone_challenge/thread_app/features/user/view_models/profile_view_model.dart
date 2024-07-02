import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/repositories/auth_repository.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/models/user_profile.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/repositories/users_repository.dart';

final profileViewModelProvider =
    AsyncNotifierProvider<ProfileViewModel, UserProfile>(
  () => ProfileViewModel(),
);

class ProfileViewModel extends AsyncNotifier<UserProfile> {
  late final AuthRepository _authRepository;
  late final UsersRepositoryType _usersRepository;

  @override
  FutureOr<UserProfile> build() async {
    _authRepository = ref.read(authRepositoryProvider);
    _usersRepository = ref.read(usersRepositoryProvider);

    final myUserId = _authRepository.user!.uid;
    final userProfile = await _usersRepository.fetchProfile(userId: myUserId);
    return userProfile!;
  }
}
