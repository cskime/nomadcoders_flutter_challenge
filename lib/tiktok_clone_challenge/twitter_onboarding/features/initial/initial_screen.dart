import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/base_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return BaseScreen(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "See what's happening in the word right now.",
              style: textTheme.headlineMedium,
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
          type: ButtonType.secondary,
          size: ButtonSize.large,
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
    );
  }
}
