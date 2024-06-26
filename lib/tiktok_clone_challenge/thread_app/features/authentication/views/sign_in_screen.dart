import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/util/form_validator.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/view_models/sign_in_view_model.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/sign_up_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/widgets/auth_form_button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/views/widgets/auth_form_field.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/home_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const routeName = "signIn";
  static const routeUrl = "/signIn";

  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  var formValues = <String, String>{};

  void _onTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void _onSaved({required String key, required String value}) {
    formValues[key] = value;
  }

  void _onSignInPressed() async {
    final formState = _formKey.currentState!;
    final valid = formState.validate();

    if (!valid) {
      return;
    }

    formState.save();

    await ref.read(signInViewModelProvider.notifier).signInWithEmailAndPassword(
          email: formValues["email"]!,
          password: formValues["password"]!,
        );

    if (mounted) {
      context.go(HomeScreen.routeUrl);
    }
  }

  void _onCreateAccountPressed(BuildContext context) {
    context.pushNamed(SignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(signInViewModelProvider).isLoading;
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AuthFormField(
                            hintText: "Mobile number or email",
                            validator: FormValidator.emailValidator,
                            onSaved: (value) => _onSaved(
                              key: "email",
                              value: value!,
                            ),
                          ),
                          const SizedBox(height: 12),
                          AuthFormField(
                            hintText: "Password",
                            obscureText: true,
                            validator: FormValidator.passwordValidator,
                            onSaved: (value) => _onSaved(
                              key: "password",
                              value: value!,
                            ),
                          ),
                          const SizedBox(height: 12),
                          AuthFormButton(
                            title: "Log in",
                            onPressed: _onSignInPressed,
                            isEnabled: !isLoading,
                          ),
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
                  GestureDetector(
                    onTap: () => _onCreateAccountPressed(context),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
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
