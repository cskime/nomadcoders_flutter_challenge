import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialLoginType {
  google,
  apple;

  String get title => switch (this) {
        SocialLoginType.google => 'Continue with Google',
        SocialLoginType.apple => 'Continue with Apple',
      };

  Widget get logo => switch (this) {
        SocialLoginType.google => const FaIcon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
        SocialLoginType.apple => const FaIcon(
            FontAwesomeIcons.apple,
          ),
      };
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.type,
    required this.onPressed,
  });

  final SocialLoginType type;
  final void Function(SocialLoginType type) onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(type),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              type.logo,
              const SizedBox(width: 16),
              Text(
                type.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
