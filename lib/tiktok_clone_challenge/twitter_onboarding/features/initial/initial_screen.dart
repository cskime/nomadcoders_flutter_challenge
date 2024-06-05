import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/linkable_text.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/create_account/create_account_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/initial/widgets/social_login_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/initial/widgets/titled_divider.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  void _onTermsTap() {
    // TODO: Go to the terms and services page
  }
  void _onPrivacyPolicyTap() {
    // TODO: Go to the privacy policy page
  }
  void _onCookieUseTap() {
    // TODO: Go to the cookie usage page
  }
  void _onLoginTap() {
    // TODO: Go to the login screen
  }

  void _onSocialLoginPressed(SocialLoginType type) {
    // TODO: Social login
  }

  void _onCreateAccountPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CreateAccountScreen(),
      fullscreenDialog: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Palette.primary,
          size: 36,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    "See what's happening in the word right now.",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              SocialLoginButton(
                type: SocialLoginType.google,
                onPressed: _onSocialLoginPressed,
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                type: SocialLoginType.apple,
                onPressed: _onSocialLoginPressed,
              ),
              const SizedBox(height: 16),
              const TitledDivider(),
              const SizedBox(height: 4),
              Button(
                title: 'Create account',
                type: ButtonType.large,
                onPressed: () => _onCreateAccountPressed(context),
              ),
              const SizedBox(height: 28),
              LinkableText(
                text:
                    'By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.',
                links: [
                  Link(text: 'Terms', callback: _onTermsTap),
                  Link(text: 'Privacy Policy', callback: _onPrivacyPolicyTap),
                  Link(text: 'Cookie Use', callback: _onCookieUseTap),
                ],
              ),
              const SizedBox(height: 40),
              LinkableText(
                text: 'Have an account already? Log in',
                links: [
                  Link(text: 'Log in', callback: _onLoginTap),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
