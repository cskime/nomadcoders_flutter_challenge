import 'package:flutter/material.dart';

class LoginFormButton extends StatelessWidget {
  const LoginFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B64E1),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Center(
        child: Text(
          "Log in",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
