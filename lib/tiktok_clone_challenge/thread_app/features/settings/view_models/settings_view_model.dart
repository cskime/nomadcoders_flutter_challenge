import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/services/theme_mode_service.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel({required this.themeModeService}) {
    themeModeService.addListener(_themeModeListener);
  }

  @override
  void dispose() {
    themeModeService.removeListener(_themeModeListener);
    super.dispose();
  }

  late ThemeMode _currentThemeMode = themeModeService.themeMode;

  void _themeModeListener() {
    _currentThemeMode = themeModeService.themeMode;
    notifyListeners();
  }

  final ThemeModeService themeModeService;

  ThemeMode get currentThemeMode => _currentThemeMode;
  String get currentAppearanceTitle => appearanceTitle(currentThemeMode);

  String appearanceTitle(ThemeMode mode) => switch (mode) {
        ThemeMode.system => "System",
        ThemeMode.light => "Light",
        ThemeMode.dark => "Dark",
      };

  void switchThemeMode(ThemeMode mode) {
    themeModeService.switchThemeMode(mode);
  }
}
