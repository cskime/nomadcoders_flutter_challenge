import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/create_account/widgets/app_bar_text_leading_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/create_account/widgets/custom_text_form_field.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/widgets/button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  static const _cancelText = 'Cancel';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formData = <String, String>{};

  void _onTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Scaffold(
        appBar: AppBar(
          title: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Palette.primary,
            size: 36,
          ),
          leadingWidth: AppBarLeadingTextButton.fitWidth(
            text: CreateAccountScreen._cancelText,
          ),
          leading: const AppBarLeadingTextButton(
            text: CreateAccountScreen._cancelText,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 36, bottom: 24),
                        child: Text(
                          'Create your account',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Form(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: 'Name',
                        ),
                        SizedBox(height: 24),
                        CustomTextFormField(
                          hintText: 'Phone number or email address',
                        ),
                        SizedBox(height: 24),
                        CustomTextFormField(
                          hintText: 'Date of birth',
                          helperText:
                              'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 24,
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        Button(
                          title: 'Next',
                          type: ButtonType.small,
                          enabled: _formData.length == 3,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
