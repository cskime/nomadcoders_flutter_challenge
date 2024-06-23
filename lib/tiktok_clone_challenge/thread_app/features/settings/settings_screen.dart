import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/privacy_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';

class SettingsScreen extends StatelessWidget {
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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PrivacyScreen(),
      ),
    );
  }

  Icon leadingIcon(
    IconData iconData, {
    required bool isDarkMode,
  }) {
    return Icon(
      iconData,
      color: ThreadTheme.foregroundColor(
        isDarkMode: isDarkMode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThreadTheme.isDarkTheme(context);
    final textStyle = TextStyle(
      color: ThreadTheme.foregroundColor(isDarkMode: isDarkMode),
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: leadingIcon(
              FontAwesomeIcons.userPlus,
              isDarkMode: isDarkMode,
            ),
            title: Text("Follow and invite friends", style: textStyle),
          ),
          ListTile(
            leading: leadingIcon(
              FontAwesomeIcons.bell,
              isDarkMode: isDarkMode,
            ),
            title: Text("Notifications", style: textStyle),
          ),
          ListTile(
            leading: leadingIcon(
              FontAwesomeIcons.lock,
              isDarkMode: isDarkMode,
            ),
            title: Text("Privacy", style: textStyle),
            onTap: () => _onPrivacyTap(context),
          ),
          ListTile(
            leading: leadingIcon(
              FontAwesomeIcons.circleUser,
              isDarkMode: isDarkMode,
            ),
            title: Text("Account", style: textStyle),
          ),
          ListTile(
            leading: leadingIcon(
              FontAwesomeIcons.solidLifeRing,
              isDarkMode: isDarkMode,
            ),
            title: Text("Help", style: textStyle),
          ),
          ListTile(
            leading: leadingIcon(
              Icons.info_outline_rounded,
              isDarkMode: isDarkMode,
            ),
            title: Text("About", style: textStyle),
          ),
          const Divider(height: 1),
          ListTile(
            title: Text(
              "Log out (iOS)",
              style: textStyle.copyWith(color: Colors.blue),
            ),
            onTap: () => _onLogoutTap(context, isIOS: true),
          ),
          ListTile(
            title: Text(
              "Log out (Android)",
              style: textStyle.copyWith(color: Colors.blue),
            ),
            onTap: () => _onLogoutTap(context, isIOS: false),
          ),
        ],
      ),
    );
  }
}
