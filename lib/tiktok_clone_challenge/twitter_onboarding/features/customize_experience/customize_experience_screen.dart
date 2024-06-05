import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/linkable_text.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Palette.primary,
          size: 36,
        ),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          onPressed: _onBackButtonPressed,
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                  child: Column(
                    children: [
                      Text(
                        'Customize your experience',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Track where you see Twitter content across the web',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Twitter uses this data to personalize your experience. THis web browsing history will never be stored with your name, email, or phone number.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
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
                      const Spacer(),
                      const Button(
                        title: 'Next',
                        type: ButtonType.large,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
