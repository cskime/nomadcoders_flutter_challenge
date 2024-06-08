import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/base_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/linkable_text.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/create_account/create_account_sign_up_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/models/user_data.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  var _allow = true;

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _onSwitchChanged(bool isOn) {
    setState(() {
      _allow = isOn;
    });
  }

  void _onNextPressd() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CreateAccountSignUpScreen(
        userData: widget.userData,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarLeading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        onPressed: _onBackButtonPressed,
      ),
      largeTitle: 'Customize your experience',
      title: 'Track where you see Twitter content across the web',
      footer: Button(
          title: 'Next',
          type: ButtonType.secondary,
          size: ButtonSize.large,
          onPressed: _onNextPressd,
        ),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Twitter uses this data to personalize your experience. THis web browsing history will never be stored with your name, email, or phone number.',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Switch.adaptive(
              value: _allow,
              onChanged: _onSwitchChanged,
            ),
          ],
        ),
        const SizedBox(height: 24),
        LinkableText(
          text:
              'By signing up, you agree to our Terms, Privacy Policy, and Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. Learn more',
          links: [
            Link(text: 'Terms', callback: () {}),
            Link(text: 'Privacy Policy', callback: () {}),
            Link(text: 'Cookie Use', callback: () {}),
            Link(text: 'Learn more', callback: () {}),
          ],
        ),
      ],
    );
  }
}
