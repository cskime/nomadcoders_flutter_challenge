import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/firebase_options.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/services/theme_mode_service.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }

  runApp(
    const ProviderScope(
      child: ThreadApp(),
    ),
  );
}

class ThreadApp extends ConsumerWidget {
  const ThreadApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      themeMode: ref.watch(themeModeServiceProvider),
      theme: ThreadTheme.light,
      darkTheme: ThreadTheme.dark,
    );
  }
}
