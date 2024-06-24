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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Row(
              children: [
                Icon(FontAwesomeIcons.lock),
                SizedBox(width: 16),
                Text("Private profile"),
              ],
            ),
            subtitle: const Text("iOS style Switch"),
            value: _usesPrivateProfile,
            onChanged: _onPrivateProfileChanged,
          ),
          SwitchListTile(
            title: const Row(
              children: [
                Icon(FontAwesomeIcons.lock),
                SizedBox(width: 16),
                Text("Private profile"),
              ],
            ),
            subtitle: const Text("Android style Switch"),
            value: _usesPrivateProfile,
            onChanged: _onPrivateProfileChanged,
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.threads),
            title: Text("Mentions"),
            trailing: Row(
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
          const ListTile(
            leading: Icon(FontAwesomeIcons.bellSlash),
            title: Text("Muted"),
            trailing: Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey,
              size: 20,
            ),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.eyeSlash),
            title: Text("Hidden Words"),
            trailing: Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey,
              size: 20,
            ),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.users),
            title: Text("Profiles you follow"),
            trailing: Icon(
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
          const ListTile(
            leading: Icon(FontAwesomeIcons.circleXmark),
            title: Text("Blocked profiles"),
            trailing: Icon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey,
              size: 20,
            ),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.heartCrack),
            title: Text("Hide likes"),
            trailing: Icon(
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
