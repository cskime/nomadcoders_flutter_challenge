import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';

enum CustomTextFieldLabelTextBehavior { automatic, fixedSpace, always }

enum CustomTextFieldHelperTextBehavior { automatic, fixedSpace, always }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.text,
    this.hintText,
    this.labelText,
    this.helperText,
    this.controller,
    this.focusNode,
    this.validator,
    this.onTextEdited,
    this.onFocusChanged,
    this.keyboardType,
    this.readOnly = false,
    this.obscureText = false,
    this.customTextFieldLabelTextBehavior =
        CustomTextFieldLabelTextBehavior.always,
    this.customTextFieldHelperTextBehavior =
        CustomTextFieldHelperTextBehavior.automatic,
  });

  final String? text;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool Function(String value)? validator;
  final void Function()? onTextEdited;
  final void Function(bool hasFocus)? onFocusChanged;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool obscureText;
  final CustomTextFieldLabelTextBehavior customTextFieldLabelTextBehavior;
  final CustomTextFieldHelperTextBehavior customTextFieldHelperTextBehavior;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final _textEditingController =
      widget.controller ?? TextEditingController(text: widget.text);
  late final _focusNode = widget.focusNode ?? FocusNode();

  var _isObscured = true;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_onTextEdited);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Widget _obscureToggleIcon(bool isObscure) => Icon(
        isObscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
        color: Colors.grey.shade400,
        size: 24,
      );

  Widget? get _checkmark => const Icon(
        FontAwesomeIcons.solidCircleCheck,
        color: Palette.green,
        size: 24,
      );

  bool get _showsCheckmarkIcon => widget.validator == null
      ? _textEditingController.text.isNotEmpty
      : widget.validator!(_textEditingController.text);

  bool get _showsHelperText =>
      switch (widget.customTextFieldHelperTextBehavior) {
        CustomTextFieldHelperTextBehavior.automatic =>
          (widget.helperText != null) &&
              (_focusNode.hasFocus || _textEditingController.text.isNotEmpty),
        CustomTextFieldHelperTextBehavior.fixedSpace => true,
        CustomTextFieldHelperTextBehavior.always => widget.helperText != null,
      };

  bool get _showsLabelText => switch (widget.customTextFieldLabelTextBehavior) {
        CustomTextFieldLabelTextBehavior.automatic =>
          (widget.labelText != null || widget.hintText != null) &&
              _textEditingController.text.isNotEmpty,
        CustomTextFieldLabelTextBehavior.fixedSpace => true,
        CustomTextFieldLabelTextBehavior.always => _labelText != null,
      };

  String? get _labelText {
    final text = widget.labelText ?? widget.hintText;
    return switch (widget.customTextFieldLabelTextBehavior) {
      CustomTextFieldLabelTextBehavior.automatic => text,
      CustomTextFieldLabelTextBehavior.fixedSpace =>
        _textEditingController.text.isEmpty ? '' : text,
      CustomTextFieldLabelTextBehavior.always => text,
    };
  }

  void _onTextEdited() {
    widget.onTextEdited?.call();
    setState(() {});
  }

  void _onFocusChanged() {
    widget.onFocusChanged?.call(_focusNode.hasFocus);
    setState(() {});
  }

  void _onChanged(String text) {
    setState(() {});
  }

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_showsLabelText)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _CustomTextFieldLabelText(_labelText!),
          ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 24,
                      child: TextFormField(
                        controller: _textEditingController,
                        focusNode: _focusNode,
                        keyboardType: widget.keyboardType,
                        onChanged: _onChanged,
                        cursorColor: Palette.primary,
                        cursorWidth: 3,
                        readOnly: widget.readOnly,
                        obscureText: widget.obscureText && _isObscured,
                        decoration: InputDecoration(
                          hintText: widget.hintText,
                          hintStyle: const TextStyle(
                            color: Palette.text,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                        style: const TextStyle(
                          color: Palette.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  if (widget.obscureText)
                    GestureDetector(
                      onTap: _toggleObscure,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: _obscureToggleIcon(_isObscured),
                      ),
                    ),
                  const SizedBox(width: 8),
                  if (_showsCheckmarkIcon)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: _checkmark,
                    ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Divider(
                color: Colors.grey.shade400,
                height: 1,
              ),
            )
          ],
        ),
        if (_showsHelperText)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: _CustomTextFieldHelperText(widget.helperText!),
          ),
      ],
    );
  }
}

class _CustomTextFieldLabelText extends StatelessWidget {
  const _CustomTextFieldLabelText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF111319),
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _CustomTextFieldHelperText extends StatelessWidget {
  const _CustomTextFieldHelperText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Palette.text,
        height: 1.3,
      ),
      maxLines: 3,
    );
  }
}
