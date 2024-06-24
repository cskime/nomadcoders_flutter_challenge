import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/home_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/privacy_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/settings_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/main_navigation_screen.dart';

final router = GoRouter(
  initialLocation: HomeScreen.routeUrl,
  routes: [
    GoRoute(
      path: MainNavigationScreen.routeUrl,
      builder: (context, state) => MainNavigationScreen(
        tab: state.pathParameters["tab"]!,
      ),
    ),
    GoRoute(
      name: SettingsScreen.routeName,
      path: SettingsScreen.routeUrl,
      builder: (context, state) => const SettingsScreen(),
      routes: [
        GoRoute(
          name: PrivacyScreen.routeName,
          path: PrivacyScreen.routeUrl,
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
  ],
);
