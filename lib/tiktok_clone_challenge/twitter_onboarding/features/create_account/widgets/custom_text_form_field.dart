import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.helperText,
  });

  final String hintText;
  final String? helperText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final _textEditingController = TextEditingController();
  late final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  double get _opacity => _textEditingController.text.isEmpty ? 0 : 1;

  Widget? get _checkmark => _textEditingController.text.isEmpty
      ? null
      : const FaIcon(
          FontAwesomeIcons.solidCircleCheck,
          color: Palette.green,
          size: 22,
        );

  String? get _helperText =>
      _focusNode.hasFocus || _textEditingController.text.isNotEmpty
          ? widget.helperText
          : null;

  void _onChanged(String text) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade400,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 150),
          child: Text(
            widget.hintText,
            style: const TextStyle(
              color: Color(0xFF111319),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        TextFormField(
          controller: _textEditingController,
          focusNode: _focusNode,
          onChanged: _onChanged,
          cursorColor: Palette.primary,
          cursorWidth: 3,
          decoration: InputDecoration(
            // hint
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Palette.text,
            ),
            // helper
            helperText: _helperText,
            helperStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Palette.text,
            ),
            helperMaxLines: 3,
            // suffix
            suffix: _checkmark,
            // style
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            isDense: true,
            contentPadding: const EdgeInsets.only(top: 4, bottom: 16),
          ),
          style: const TextStyle(
            color: Palette.primary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
