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

final dummyUsers = [
  User(
    profileImagePath: 'assets/images/thread-profile-image-1.jpg',
    username: 'publity',
    verified: true,
  ),
  User(
    profileImagePath: 'assets/images/thread-profile-image-2.jpg',
    username: 'thetinderblog',
    verified: true,
  ),
  User(
    profileImagePath: 'assets/images/thread-profile-image-3.jpg',
    username: 'tropicalseductions',
    verified: true,
  ),
  User(
    profileImagePath: 'assets/images/thread-profile-image-4.jpg',
    username: 'shityoushouldcareabout',
    verified: true,
  ),
  User(
    profileImagePath: 'assets/images/thread-profile-image-5.jpg',
    username: 'plantswithkrystal',
    verified: true,
  ),
];
