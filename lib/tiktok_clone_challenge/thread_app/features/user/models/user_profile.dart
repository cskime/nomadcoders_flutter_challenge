class UserProfile {
  UserProfile({
    this.profileImageUrl,
    required this.username,
    required this.userId,
    required this.name,
    this.bio = "",
    this.verified = false,
    this.followerCount = 0,
    this.followers = const [],
  });

  final String? profileImageUrl;
  final String userId;
  final String username;
  final String name;
  final String bio;
  final bool verified;
  final int followerCount;
  final List<String> followers;

  String get initial => username.toUpperCase().substring(0, 1);

  UserProfile.fromJson(Map<String, dynamic> json)
      : profileImageUrl = json["profileImageUrl"],
        userId = json["userId"],
        username = json["username"],
        name = json["name"],
        bio = json["bio"],
        verified = json["verified"],
        followerCount = json["followerCount"],
        followers = List<String>.from(json["followers"]);

  Map<String, dynamic> toJson() => {
        "profileImageUrl": profileImageUrl,
        "userId": userId,
        "username": username,
        "name": name,
        "bio": bio,
        "verified": verified,
        "followerCount": followerCount,
        "followers": followers.toString(),
      };
}

const userProfileDummyJson = """
{
  "profileImageUrl" : "assets/images/thread-profile-image-1.jpg",
  "userId" : "1a",
  "username" : "publity",
  "name" : "Name of publity",
  "email": "user@example.com",
  "bio" : "Dog enthusiast!",
  "verified" : true,
  "followerCount" : 26645,
  "followers" : ["2b", "3c"],
  "posts": []
}
""";

const userProfilesDummyJson = """
[
  {
    "profileImageUrl" : "assets/images/thread-profile-image-1.jpg",
    "userId" : "1a",
    "username" : "publity",
    "name" : "Name of publity",
    "email" : "user@example.com",
    "bio" : "Dog enthusiast!",
    "verified" : true,
    "followerCount" : 26645,
    "followers" : ["2b", "3c"],
    "posts": []
  },
  {
    "profileImageUrl" : "assets/images/thread-profile-image-2.jpg",
    "userId" : "2b",
    "username" : "thetinderblog",
    "name" : "Name of thetinderblog",
    "email" : "user@example.com",
    "bio" : "",
    "verified" : true,
    "followerCount" : 301123,
    "followers" : ["3c", "4d"],
    "posts": []
  },
  {
    "profileImageUrl" : "assets/images/thread-profile-image-3.jpg",
    "userId" : "3c",
    "username" : "tropicalseductions",
    "name" : "Name of tropicalseductions",
    "email" : "user@example.com",
    "bio" : "",
    "verified" : true,
    "followerCount" : 130984,
    "followers" : ["4d", "5e"],
    "posts": []
  },
  {
    "profileImageUrl" : "assets/images/thread-profile-image-4.jpg",
    "userId" : "4d",
    "username" : "shityoushouldcareabout",
    "name" : "Name of shityoushouldcareabout",
    "email" : "user@example.com",
    "bio" : "",
    "verified" : true,
    "followerCount" : 69200,
    "followers" : [],
    "posts": []
  },
  {
    "profileImageUrl" : "assets/images/thread-profile-image-5.jpg",
    "userId" : "5e",
    "username" : "plantswithkrystal",
    "name" : "Name of plantswithkrystal",
    "email" : "user@example.com",
    "bio" : "",
    "verified" : true,
    "followerCount" : 237819,
    "followers" : ["4d"],
    "posts": []
  }
]
""";
