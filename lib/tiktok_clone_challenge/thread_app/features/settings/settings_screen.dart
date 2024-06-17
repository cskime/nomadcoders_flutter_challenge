import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/settings/privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _textStyle = TextStyle(
    fontWeight: FontWeight.w500,
  );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(FontAwesomeIcons.userPlus),
            title: Text("Follow and invite friends", style: _textStyle),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.bell),
            title: Text("Notifications", style: _textStyle),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.lock),
            title: const Text("Privacy", style: _textStyle),
            onTap: () => _onPrivacyTap(context),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.circleUser),
            title: Text("Account", style: _textStyle),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.solidLifeRing),
            title: Text("Help", style: _textStyle),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text("About", style: _textStyle),
          ),
          Divider(
            color: Colors.grey.shade300,
            height: 1,
          ),
          ListTile(
            title: Text(
              "Log out (iOS)",
              style: _textStyle.copyWith(color: Colors.blue),
            ),
            onTap: () => _onLogoutTap(context, isIOS: true),
          ),
          ListTile(
            title: Text(
              "Log out (Android)",
              style: _textStyle.copyWith(color: Colors.blue),
            ),
            onTap: () => _onLogoutTap(context, isIOS: false),
          ),
        ],
      ),
    );
  }
}
