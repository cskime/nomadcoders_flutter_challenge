abstract final class FormValidator {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter an email";
    }

    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!regExp.hasMatch(value)) {
      return "Email is not valid";
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a password";
    }

    if (value.length < 8) {
      return "A password should be more than 8 characters.";
    }

    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a username.";
    }

    if (value.length < 2) {
      return "A username should be more than 4 characters.";
    }

    return null;
  }
}
