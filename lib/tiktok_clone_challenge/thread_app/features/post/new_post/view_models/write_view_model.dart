import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/repositories/auth_repository.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/models/user_profile.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/repositories/users_repository.dart';

final writeViewModelMyUserProvider = FutureProvider<UserProfile>(
  (ref) async {
    final authRepository = ref.read(authRepositoryProvider);
    final usersRepository = ref.read(usersRepositoryProvider);

    final myUserId = authRepository.user!.uid;
    final userProfile = await usersRepository.fetchProfile(userId: myUserId);
    return userProfile!;
  },
);

final writeViewModelProvider = AsyncNotifierProvider.autoDispose(
  () => WriteViewModel(),
);

class WriteViewModel extends AutoDisposeAsyncNotifier {
  @override
  FutureOr build() {}

  Future<void> uploadPost() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await Future.delayed(const Duration(seconds: 1)),
    );
  }
}
