import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.onSaved,
  });

  final String hintText;
  final bool obscureText;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      cursorColor: const Color(0xFF0B64E1),
      obscureText: obscureText,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
