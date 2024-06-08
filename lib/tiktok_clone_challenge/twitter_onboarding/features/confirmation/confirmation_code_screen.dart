import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/base_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/confirmation/widgets/confirm_code_input.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/create_account/password_screen.dart';
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
  var _loading = false;
  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onCodeFilled(bool isFilled) {
    setState(() {
      _codeFilled = isFilled;
    });
  }

  void _onNextTap(BuildContext context) async {
    if (_loading) return;

    setState(() {
      _loading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _loading = false;

      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PasswordScreen(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarLeading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        onPressed: () => _onBackButtonPressed(context),
      ),
      title: 'We sent you a code',
      description: 'Enter it below to verify\n${widget.userData.phoneOrEmail}.',
      footer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            loading: _loading,
            onPressed: () => _onNextTap(context),
          ),
        ],
      ),
      children: [
        ConfirmCodeInput(onCodeChanged: _onCodeFilled),
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
      ],
    );
  }
}
