import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/repositories/auth_repository.dart';

final signUpViewModelProvider = AsyncNotifierProvider.autoDispose(
  () => SignUpViewModel(),
);

class SignUpViewModel extends AutoDisposeAsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepositoryProvider);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _authRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }
}
