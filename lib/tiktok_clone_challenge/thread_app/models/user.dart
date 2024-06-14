class User {
  User({
    this.profileImagePath,
    required this.username,
    required this.name,
    required this.verified,
    required this.followerCount,
  });

  final String? profileImagePath;
  final String username;
  final String name;
  final bool verified;
  final int followerCount;

  String get initial => username.toUpperCase().substring(0, 1);
}

final dummyUsers = [
  User(
    profileImagePath: 'assets/images/thread-profile-image-1.jpg',
    username: 'publity',
    name: 'Name publity',
    verified: true,
    followerCount: 26645,
  ),
  User(
    profileImagePath: 'assets/images/thread-profile-image-2.jpg',
    username: 'thetinderblog',
    name: 'Name thetinderblog',
    verified: true,
    followerCount: 301123,
  ),
  User(
    profileImagePath: 'assets/images/thread-profile-image-3.jpg',
    username: 'tropicalseductions',
    name: 'Name tropicalseductions',
    verified: true,
    followerCount: 130984,
  ),
  User(
    profileImagePath: 'assets/images/thread-profile-image-4.jpg',
    username: 'shityoushouldcareabout',
    name: 'Name shityoushouldcareabout',
    verified: true,
    followerCount: 69200,
  ),
  User(
    profileImagePath: 'assets/images/thread-profile-image-5.jpg',
    username: 'plantswithkrystal',
    name: 'Name plantswithkrystal',
    verified: true,
    followerCount: 237819,
  ),
];
