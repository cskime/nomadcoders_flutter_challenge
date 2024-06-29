import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/login_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/views/privacy_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/views/settings_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/main_navigation_screen.dart';

final router = GoRouter(
  initialLocation: LoginScreen.routeUrl,
  routes: [
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeUrl,
      builder: (context, state) => const LoginScreen(),
    ),
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
