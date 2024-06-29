import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/widgets/login_form_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/widgets/login_form_field.dart';

class LoginScreen extends ConsumerWidget {
  static const routeName = "login";
  static const routeUrl = "/login";

  const LoginScreen({super.key});

  void _onTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Scaffold(
          backgroundColor: const Color(0xFFF5FAF3),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "English (US)",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 80),
                      child: Icon(
                        FontAwesomeIcons.squareThreads,
                        size: 96,
                      ),
                    ),
                    const Form(
                      child: Column(
                        children: [
                          LoginFormField(
                            hintText: "Mobile number or email",
                          ),
                          SizedBox(height: 12),
                          LoginFormField(
                            hintText: "Password",
                          ),
                          SizedBox(height: 12),
                          LoginFormButton(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Forgot password?",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Center(
                      child: Text(
                        "Create new account",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FontAwesomeIcons.meta,
                        color: Colors.grey.shade700,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Meta",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
