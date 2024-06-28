import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/services/theme_mode_service.dart';

final settingsViewModelProvider =
    NotifierProvider<SettingsViewModel, ThemeMode>(
  () => SettingsViewModel(),
);

class SettingsViewModel extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ref.watch(themeModeServiceProvider);
  }

  void switchThemeMode(ThemeMode mode) {
    ref.read(themeModeServiceProvider.notifier).switchThemeMode(mode);
  }
}
