import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/repositories/auth_repository.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/models/user_profile.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/repositories/users_repository.dart';

final signUpViewModelProvider = AsyncNotifierProvider.autoDispose(
  () => SignUpViewModel(),
);

class SignUpViewModel extends AutoDisposeAsyncNotifier<void> {
  late final AuthRepository _authRepository;
  late final UsersRepositoryType _usersRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepositoryProvider);
    _usersRepository = ref.read(usersRepositoryProvider);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final credential = await _authRepository.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (credential.user == null) {
          throw Exception("Account not created");
        }

        final newProfile = UserProfile(
          username: "username",
          userId: credential.user!.uid,
          name: "name",
        );
        _usersRepository.createProfile(newProfile);
      },
    );
  }
}
