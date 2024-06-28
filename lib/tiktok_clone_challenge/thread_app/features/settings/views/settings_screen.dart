import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/view_models/settings_view_model.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/views/privacy_screen.dart';

class SettingsScreen extends ConsumerWidget {
  static const routeName = "settings";
  static const routeUrl = "/settings";

  const SettingsScreen({super.key});

  void _onLogoutCancelPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onLogoutOKPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onLogoutTap(BuildContext context, {required bool isIOS}) {
    if (isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text("Log out?"),
          actions: [
            CupertinoDialogAction(
              textStyle: const TextStyle(color: Colors.blue),
              child: const Text("Cancel"),
              onPressed: () => _onLogoutCancelPressed(context),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text("OK"),
              onPressed: () => _onLogoutOKPressed(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Log out?"),
          actions: [
            TextButton(
              onPressed: () => _onLogoutCancelPressed(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => _onLogoutOKPressed(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void _onPrivacyTap(BuildContext context) {
    context.pushNamed(PrivacyScreen.routeName);
  }

  void _onAppearanceTap(BuildContext context, WidgetRef ref) {
    void buttonPressed(ThemeMode mode) {
      ref.read(settingsViewModelProvider.notifier).switchThemeMode(mode);
      context.pop();
    }

    List<Widget> actions = ThemeMode.values.map((mode) {
      final title = _appearanceTitle(mode);
      final textStyle = Theme.of(context).textTheme.bodyMedium;
      return Platform.isIOS
          ? CupertinoDialogAction(
              onPressed: () => buttonPressed(mode),
              child: Text(
                title,
                style: textStyle?.copyWith(color: Colors.blue),
              ),
            )
          : TextButton(
              onPressed: () => buttonPressed(mode),
              child: Text(title, style: textStyle),
            );
    }).toList();

    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(actions: actions),
    );
  }

  String _appearanceTitle(ThemeMode mode) => switch (mode) {
        ThemeMode.system => "System",
        ThemeMode.light => "Light",
        ThemeMode.dark => "Dark",
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoutTextStyle = Theme.of(context)
        .listTileTheme
        .titleTextStyle
        ?.copyWith(color: Colors.blue);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(FontAwesomeIcons.userPlus),
            title: Text("Follow and invite friends"),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.bell),
            title: Text("Notifications"),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.lock),
            title: const Text("Privacy"),
            onTap: () => _onPrivacyTap(context),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.circleUser),
            title: Text("Account"),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.circleHalfStroke),
            title: const Text("Appearance"),
            trailing: Text(
              _appearanceTitle(ref.watch(settingsViewModelProvider)),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onTap: () => _onAppearanceTap(context, ref),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.solidLifeRing),
            title: Text("Help"),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text("About"),
          ),
          const Divider(height: 1),
          ListTile(
            title: Text(
              "Log out (iOS)",
              style: logoutTextStyle,
            ),
            onTap: () => _onLogoutTap(context, isIOS: true),
          ),
          ListTile(
            title: Text(
              "Log out (Android)",
              style: logoutTextStyle,
            ),
            onTap: () => _onLogoutTap(context, isIOS: false),
          ),
        ],
      ),
    );
  }
}
