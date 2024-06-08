import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/base_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/linkable_text.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/confirmation/confirmation_code_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/create_account/widgets/custom_text_form_field.dart';
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
      builder: (context) => ConfirmationCodeScreen(userData: userData),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarLeading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        onPressed: () => _onBackButtonPressed(context),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36, bottom: 24),
                child: Text(
                  'Create your account',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          Form(
            child: Column(
              children: [
                CustomTextFormField(
                  readOnly: true,
                  text: userData.name,
                  hintText: 'Name',
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  readOnly: true,
                  text: userData.phoneOrEmail,
                  hintText: 'Phone number or email address',
                  labelText: 'Email',
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  readOnly: true,
                  text: userData.dateOfBirth,
                  hintText: 'Date of birth',
                  keyboardType: TextInputType.none,
                ),
              ],
            ),
          ),
          const Spacer(),
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
    );
  }
}
