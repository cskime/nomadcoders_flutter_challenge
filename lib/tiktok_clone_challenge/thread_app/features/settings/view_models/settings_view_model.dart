import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/repositories/auth_repository.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/services/theme_mode_service.dart';

final settingsViewModelProvider =
    NotifierProvider<SettingsViewModel, ThemeMode>(
  () => SettingsViewModel(),
);

class SettingsViewModel extends Notifier<ThemeMode> {
  late final AuthRepository _authRepository;

  @override
  ThemeMode build() {
    _authRepository = ref.read(authRepositoryProvider);
    return ref.watch(themeModeServiceProvider);
  }

  void switchThemeMode(ThemeMode mode) {
    ref.read(themeModeServiceProvider.notifier).switchThemeMode(mode);
  }

  Future<void> logOut() async {
    await _authRepository.signOut();
  }
}
