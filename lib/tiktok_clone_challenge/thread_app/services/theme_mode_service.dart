import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeServiceProvider = NotifierProvider<ThemeModeService, ThemeMode>(
  () => ThemeModeService(),
);

class ThemeModeService extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void switchThemeMode(ThemeMode mode) {
    state = mode;
  }
}
