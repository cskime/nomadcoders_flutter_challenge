import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';

class CustomTextFormField extends StatefulWidget {
  const    CustomTextFormField({
    super.key,
    this.controller,
    this.onTextEdited,
    this.focusNode,
    this.onFocusChanged,
    this.hintText,
    this.labelText,
    this.helperText,
    this.keyboardType,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final void Function()? onTextEdited;
  final FocusNode? focusNode;
  final void Function(bool hasFocus)? onFocusChanged;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextInputType? keyboardType;
  final bool readOnly;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final _textEditingController =
      widget.controller ?? TextEditingController();
  late final _focusNode = widget.focusNode ?? FocusNode();

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
            widget.labelText ?? widget.hintText ?? '',
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
          keyboardType: widget.keyboardType,
          onChanged: _onChanged,
          cursorColor: Palette.primary,
          cursorWidth: 3,
          readOnly: widget.readOnly,
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
