import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/authentication/util/form_validator.dart';

enum SignUpField {
  email,
  password,
  username,
  name,
  bio;

  String get hintText => switch (this) {
        SignUpField.email => "Mobile number or email",
        SignUpField.password => "Password",
        SignUpField.username => "Username",
        SignUpField.name => "Name",
        SignUpField.bio => "Bio",
      };

  bool get obscureText => this == SignUpField.password;

  String? Function(String?)? get validator => switch (this) {
        SignUpField.email => FormValidator.emailValidator,
        SignUpField.password => FormValidator.passwordValidator,
        SignUpField.username || SignUpField.name => FormValidator.nameValidator,
        _ => null,
      };
}
