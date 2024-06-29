import 'package:flutter/material.dart';

class AuthFormButton extends StatelessWidget {
  const AuthFormButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isEnabled = true,
  });

  final String title;
  final void Function()? onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: isEnabled ? const Color(0xFF0B64E1) : Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
