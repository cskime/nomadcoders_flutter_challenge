import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/base_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/confirmation/widgets/confirm_code_input.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/models/user_data.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  var _codeFilled = false;

  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onCodeFilled(bool isFilled) {
    setState(() {
      _codeFilled = isFilled;
    });
  }

  Future<void> _confirm() async {
    return Future.delayed(const Duration(seconds: 3));
  }

  void _onNextTap() {}

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarLeading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        onPressed: () => _onBackButtonPressed(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 24),
            child: Text(
              'We sent you a code',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Text(
            'Enter it below to verify\n${widget.userData.phoneOrEmail}.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 36),
          ConfirmCodeInput(
            onCodeChanged: _onCodeFilled,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: _codeFilled ? 1 : 0,
                child: const Icon(
                  FontAwesomeIcons.solidCircleCheck,
                  color: Palette.green,
                  size: 32,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'Didn\'t receive email?',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Palette.primary,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 24),
          Button(
            title: 'Next',
            type: ButtonType.secondary,
            size: ButtonSize.large,
            enabled: _codeFilled,
            future: _confirm,
            onPressed: _onNextTap,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
