import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
  static const routeName = "privacy";
  static const routeUrl = "privacy";

  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _usesPrivateProfile = true;

  void _onPrivateProfileChanged(bool value) {
    setState(() {
      _usesPrivateProfile = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: Row(
              children: [
                const Icon(FontAwesomeIcons.lock),
                const SizedBox(width: 16),
                Text(
                  "Private profile",
                  style: textStyle,
                ),
              ],
            ),
            subtitle: const Text("iOS style Switch"),
            value: _usesPrivateProfile,
            onChanged: _onPrivateProfileChanged,
          ),
          SwitchListTile(
            title: Row(
              children: [
                const Icon(FontAwesomeIcons.lock),
                const SizedBox(width: 16),
                Text(
                  "Private profile",
                  style: textStyle,
                ),
              ],
            ),
            subtitle: const Text("Android style Switch"),
            value: _usesPrivateProfile,
            onChanged: _onPrivateProfileChanged,
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.threads),
            title: Text(
              "Mentions",
              style: textStyle,
            ),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.bellSlash),
            title: Text(
              "Muted",
              style: textStyle,
            ),
            trailing: const Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey,
              size: 20,
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.eyeSlash),
            title: Text(
              "Hidden Words",
              style: textStyle,
            ),
            trailing: const Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey,
              size: 20,
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.users),
            title: Text(
              "Profiles you follow",
              style: textStyle,
            ),
            trailing: const Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey.shade300,
          ),
          const ListTile(
            title: Text(
              "Other Proviacy settings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
            ),
            trailing: Column(
              children: [
                Icon(
                  FontAwesomeIcons.arrowUpRightFromSquare,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.circleXmark),
            title: Text(
              "Blocked profiles",
              style: textStyle,
            ),
            trailing: const Icon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey,
              size: 20,
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.heartCrack),
            title: Text(
              "Hide likes",
              style: textStyle,
            ),
            trailing: const Icon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
