import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/view_models/settings_view_model.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/services/theme_mode_service.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  if (kIsWeb) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeModeService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsViewModel(
            themeModeService: context.read(),
          ),
        ),
      ],
      child: const ThreadApp(),
    ),
  );
}

class ThreadApp extends StatelessWidget {
  const ThreadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      themeMode: context.watch<ThemeModeService>().themeMode,
      theme: ThreadTheme.light,
      darkTheme: ThreadTheme.dark,
    );
  }
}
