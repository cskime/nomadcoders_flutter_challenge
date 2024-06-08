import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/base_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/custom_text_field.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  late final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onTextEdited() {
    setState(() {});
  }

  bool _validator(String value) {
    return value.length >= 8;
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarLeading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        onPressed: () => _onBackButtonPressed(context),
      ),
      title: 'You\'ll need a password',
      description: 'Make sure it\'s 8 characters or more.',
      footer: Button(
        title: 'Next',
        type: ButtonType.secondary,
        size: ButtonSize.large,
        enabled: _validator(_textEditingController.text),
        onPressed: () => (),
      ),
      children: [
        CustomTextField(
          controller: _textEditingController,
          hintText: 'Password',
          obscureText: true,
          validator: _validator,
          onTextEdited: _onTextEdited,
        ),
      ],
    );
  }
}
