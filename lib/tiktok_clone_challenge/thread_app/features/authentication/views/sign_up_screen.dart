import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/model/sign_up_field.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/view_models/sign_up_view_model.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/widgets/auth_form_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/widgets/auth_form_field.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/views/home_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeName = "signUp";
  static const routeUrl = "/signUp";

  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var formValues = <String, String>{};

  void _onTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSaved({required SignUpField field, required String value}) {
    formValues[field.name] = value;
  }

  void _onSignUpPressed() async {
    final formState = _formKey.currentState!;
    final valid = formState.validate();

    if (!valid) {
      return;
    }

    formState.save();

    await ref.read(signUpViewModelProvider.notifier).signUpWithEmailAndPassword(
          email: formValues[SignUpField.email.name]!,
          password: formValues[SignUpField.password.name]!,
          name: formValues[SignUpField.name.name]!,
          username: formValues[SignUpField.username.name]!,
          bio: formValues[SignUpField.bio.name],
        );

    if (mounted) {
      context.go(HomeScreen.routeUrl);
    }
  }

  void _onLoginPressed() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(signUpViewModelProvider).isLoading;
    return GestureDetector(
      onTap: _onTap,
      child: Scaffold(
          backgroundColor: const Color(0xFFF5FAF3),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Icon(
                        FontAwesomeIcons.squareThreads,
                        size: 96,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Wrap(
                        runSpacing: 12,
                        children: [
                          ...SignUpField.values.map<Widget>(
                            (field) => AuthFormField(
                              hintText: field.hintText,
                              obscureText: field.obscureText,
                              validator: field.validator,
                              onSaved: (value) => _onSaved(
                                field: field,
                                value: value!,
                              ),
                            ),
                          ),
                          AuthFormButton(
                            title: "Sign up",
                            onPressed: _onSignUpPressed,
                            isEnabled: !isLoading,
                          ),
                        ],
                      ),
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
                  GestureDetector(
                    onTap: _onLoginPressed,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Center(
                        child: Text(
                          "Log in existing account",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
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