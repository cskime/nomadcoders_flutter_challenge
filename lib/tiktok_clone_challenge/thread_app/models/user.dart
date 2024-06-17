class User {
  User({
    this.profileImagePath,
    required this.username,
    required this.name,
    required this.bio,
    required this.verified,
    required this.followerCount,
    required this.followers,
  });

  final String? profileImagePath;
  final String username;
  final String name;
  final String bio;
  final bool verified;
  final int followerCount;
  final List<User> followers;

  String get initial => username.toUpperCase().substring(0, 1);
}

final user1 = User(
  profileImagePath: 'assets/images/thread-profile-image-1.jpg',
  username: 'publity',
  name: 'Name publity',
  bio: "Dog enthusiast!",
  verified: true,
  followerCount: 26645,
  followers: [user2, user3],
);
final user2 = User(
  profileImagePath: 'assets/images/thread-profile-image-2.jpg',
  username: 'thetinderblog',
  name: 'Name thetinderblog',
  bio: "",
  verified: true,
  followerCount: 301123,
  followers: [user3, user4],
);
final user3 = User(
  profileImagePath: 'assets/images/thread-profile-image-3.jpg',
  username: 'tropicalseductions',
  name: 'Name tropicalseductions',
  bio: "",
  verified: true,
  followerCount: 130984,
  followers: [user4, user5],
);
final user4 = User(
  profileImagePath: 'assets/images/thread-profile-image-4.jpg',
  username: 'shityoushouldcareabout',
  name: 'Name shityoushouldcareabout',
  bio: "",
  verified: true,
  followerCount: 69200,
  followers: [],
);
final user5 = User(
  profileImagePath: 'assets/images/thread-profile-image-5.jpg',
  username: 'plantswithkrystal',
  name: 'Name plantswithkrystal',
  bio: "",
  verified: true,
  followerCount: 237819,
  followers: [user4],
);
final dummyUsers = [
  user1,
  user2,
  user3,
  user4,
  user5,
];
