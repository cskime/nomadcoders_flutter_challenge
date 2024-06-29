import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/sign_in_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/sign_up_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/views/privacy_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/views/settings_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/main_navigation_screen.dart';

final router = GoRouter(
  initialLocation: SignInScreen.routeUrl,
  routes: [
    GoRoute(
      name: SignInScreen.routeName,
      path: SignInScreen.routeUrl,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeUrl,
      builder: (context, state) => const SignUpScreen(),
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
