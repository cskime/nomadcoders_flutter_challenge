import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/base_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/custom_text_field.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/create_account/widgets/app_bar_text_leading_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/customize_experience/customize_experience_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/models/user_data.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  static const _cancelText = 'Cancel';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _nameTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  final _dateOfBirthTextEditingController = TextEditingController();

  var _nextEnabled = false;
  var _showsDatePicker = false;

  void _onTextEdited() {
    setState(() {
      _nextEnabled = _nameTextEditingController.text.isNotEmpty &&
          _emailTextEditingController.text.isNotEmpty &&
          _dateOfBirthTextEditingController.text.isNotEmpty;
    });
  }

  void _onDateTextFieldFocusChanged(bool hasFocus) {
    setState(() {
      _showsDatePicker = hasFocus;
    });
  }

  void _onDateTimeChanged(DateTime dateTime) {
    _dateOfBirthTextEditingController.text =
        DateFormat.yMMMMd().format(dateTime);
  }

  void _onNextTap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CustomizeExperienceScreen(
        userData: UserData(
          name: _nameTextEditingController.text,
          phoneOrEmail: _emailTextEditingController.text,
          dateOfBirth: _dateOfBirthTextEditingController.text,
        ),
      ),
    ));
  }

  DateTime? get _initialDateTime {
    if (_dateOfBirthTextEditingController.text.isEmpty) {
      return null;
    }

    return DateFormat.yMMMMd().parse(_dateOfBirthTextEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarLeading: const AppBarLeadingTextButton(
        text: CreateAccountScreen._cancelText,
      ),
      appBarLeadingWidth: AppBarLeadingTextButton.fitWidth(
        text: CreateAccountScreen._cancelText,
      ),
      title: 'Create your account',
      bottomNavigationBar: _showsDatePicker
          ? BottomAppBar(
              color: Colors.white,
              height: 200,
              padding: EdgeInsets.zero,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _initialDateTime,
                    onDateTimeChanged: _onDateTimeChanged,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Divider(
                      color: Colors.grey.shade300,
                      height: 1,
                    ),
                  ),
                ],
              ),
            )
          : null,
      children: [
        Form(
          child: Column(
            children: [
              CustomTextField(
                controller: _nameTextEditingController,
                onTextEdited: _onTextEdited,
                hintText: 'Name',
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _emailTextEditingController,
                onTextEdited: _onTextEdited,
                hintText: 'Phone number or email address',
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _dateOfBirthTextEditingController,
                onTextEdited: _onTextEdited,
                onFocusChanged: _onDateTextFieldFocusChanged,
                hintText: 'Date of birth',
                helperText:
                    'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
                keyboardType: TextInputType.none,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Button(
                  title: 'Next',
                  type: ButtonType.secondary,
                  size: ButtonSize.small,
                  enabled: _nextEnabled,
                  onPressed: _onNextTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}