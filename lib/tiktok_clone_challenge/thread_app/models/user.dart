class User {
  User({
    this.profileImagePath,
    required this.username,
    required this.verified,
  });

  final String? profileImagePath;
  final String username;
  final bool verified;

  String get initial => username.toUpperCase().substring(0, 1);
}
