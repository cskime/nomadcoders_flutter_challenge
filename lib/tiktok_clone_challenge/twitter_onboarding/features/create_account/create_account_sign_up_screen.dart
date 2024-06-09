import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/base_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/custom_text_field.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/linkable_text.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/verification/verification_code_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/models/user_data.dart';

class CreateAccountSignUpScreen extends StatelessWidget {
  const CreateAccountSignUpScreen({
    super.key,
    required this.userData,
  });

  final UserData userData;

  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onSignUpPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VerificationCodeScreen(userData: userData),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarLeading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        onPressed: () => _onBackButtonPressed(context),
      ),
      title: 'Create your account',
      footer: Column(
        children: [
          LinkableText(
            text:
                'By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. Learn more. Others will be able to find you by email or phone number, when provided, unless you choose otherwise here.',
            links: [
              Link(text: 'Terms of Service', callback: () {}),
              Link(text: 'Privacy Policy', callback: () {}),
              Link(text: 'Cookie Use', callback: () {}),
              Link(text: 'Learn more', callback: () {}),
              Link(text: 'here', callback: () {}),
            ],
          ),
          const SizedBox(height: 20),
          Button(
            title: 'Sign Up',
            type: ButtonType.primary,
            size: ButtonSize.large,
            onPressed: () => _onSignUpPressed(context),
          ),
        ],
      ),
      children: [
        Form(
          child: Column(
            children: [
              CustomTextField(
                readOnly: true,
                text: userData.name,
                hintText: 'Name',
              ),
              const SizedBox(height: 24),
              CustomTextField(
                readOnly: true,
                text: userData.phoneOrEmail,
                hintText: 'Phone number or email address',
                labelText: 'Email',
              ),
              const SizedBox(height: 24),
              CustomTextField(
                readOnly: true,
                text: userData.dateOfBirth,
                hintText: 'Date of birth',
                keyboardType: TextInputType.none,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
