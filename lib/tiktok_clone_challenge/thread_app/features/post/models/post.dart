import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Post({
    required this.authorId,
    required this.authorName,
    this.authorProfileImageUrl,
    required this.authorVerified,
    required this.body,
    this.imageUrls = const [],
    this.likeCount = 0,
    this.replyCount = 0,
    this.repliers = const [],
    this.replierProfileImageUrls = const [],
    required this.timestamp,
  });

  final String authorId;
  final String authorName;
  final String? authorProfileImageUrl;
  final bool authorVerified;
  final String body;
  final List<String> imageUrls;
  final int likeCount;
  final int replyCount;
  final List<String> repliers;
  final List<String> replierProfileImageUrls;
  final Timestamp timestamp;

  Post.fromJson(Map<String, dynamic> json)
      : authorId = json["authorId"],
        authorName = json["authorName"],
        authorProfileImageUrl = json["authorProfileImageUrl"],
        authorVerified = json["authorVerified"],
        body = json["body"],
        imageUrls = List<String>.from(json["imageUrls"]),
        likeCount = json["likeCount"],
        replyCount = json["replyCount"],
        repliers = List<String>.from(json["repliers"]),
        replierProfileImageUrls =
            List<String>.from(json["replierProfileImageUrls"]),
        timestamp = json["timestamp"];

  Map<String, dynamic> toJson() => {
        "authorId": authorId,
        "authorName": authorName,
        "authorProfileImageUrl": authorProfileImageUrl,
        "authorVerified": authorVerified,
        "body": body,
        "imageUrls": imageUrls,
        "likeCount": likeCount,
        "replyCount": replyCount,
        "repliers": repliers,
        "replierProfileImageUrls": replierProfileImageUrls,
        "timestamp": timestamp,
      };

  String get updated {
    final timestampDate = timestamp.toDate();
    final ago = DateTime.now().difference(timestampDate).inSeconds;

    if (ago / 60 < 1) {
      return '${ago}s';
    }
    if (ago / 3600 < 1) {
      return '${ago ~/ 60}m';
    }
    if (ago / 86400 < 1) {
      return '${ago ~/ 3600}h';
    }
    return '${ago ~/ 86400}d';
  }
}

String generateTimestamp({
  int beforeDays = 0,
  int beforeHours = 0,
  int beforeMinutes = 0,
  int beforeSeconds = 0,
}) =>
    DateTime.now()
        .subtract(Duration(
          days: beforeDays,
          hours: beforeHours,
          minutes: beforeMinutes,
          seconds: beforeSeconds,
        ))
        .millisecondsSinceEpoch
        .toString();

final postsDummyJson = jsonEncode([
  {
    "authorId": "1a",
    "authorName": "publity",
    "authorProfileImageUrl": "assets/images/thread-profile-image-1.jpg",
    "authorVerified": true,
    "body": "Vine after seeing the Treads logo unveiled",
    "imageUrls": [],
    "likeCount": 391,
    "replyCount": 36,
    "repliers": ["2b"],
    "replierProfileImageUrls": [],
    "timestamp": generateTimestamp(beforeSeconds: 10)
  },
  {
    "authorId": "2b",
    "authorName": "thetinderblog",
    "authorProfileImageUrl": "assets/images/thread-profile-image-2.jpg",
    "authorVerified": true,
    "body": "Elon alone on Twitter right now...",
    "imageUrls": [],
    "likeCount": 391,
    "replyCount": 36,
    "repliers": ["3c", "4d"],
    "replierProfileImageUrls": [],
    "timestamp": generateTimestamp(beforeMinutes: 5)
  },
  {
    "authorId": "3c",
    "authorName": "tropicalseductions",
    "authorProfileImageUrl": "assets/images/thread-profile-image-3.jpg",
    "authorVerified": true,
    "body": "Drop a comment here to test things out.",
    "imageUrls": [],
    "likeCount": 4,
    "replyCount": 3,
    "repliers": ["1a", "2b", "4d"],
    "replierProfileImageUrls": [],
    "timestamp": generateTimestamp(beforeHours: 2)
  },
  {
    "authorId": "4d",
    "authorName": "shityoushouldcareabout",
    "authorProfileImageUrl": "assets/images/thread-profile-image-3.jpg",
    "authorVerified": true,
    "body": "my phone feels like a vibrator with all these notifications rn",
    "imageUrls": [
      "assets/images/thread-image.jpg",
      "assets/images/thread-image.jpg",
      "assets/images/thread-image.jpg"
    ],
    "likeCount": 631,
    "replyCount": 64,
    "repliers": ["1a", "2b", "3c", "5e"],
    "replierProfileImageUrls": [],
    "timestamp": generateTimestamp(beforeDays: 3)
  },
  {
    "authorId": "5e",
    "authorName": "plantswithkrystal",
    "authorProfileImageUrl": "assets/images/thread-profile-image-3.jpg",
    "authorVerified": true,
    "body":
        "If you're reading this, go water that thirsty plant. You're welcome ☺️",
    "imageUrls": [
      "assets/images/thread-image.jpg",
      "assets/images/thread-image.jpg",
      "assets/images/thread-image.jpg"
    ],
    "likeCount": 74,
    "replyCount": 0,
    "repliers": [],
    "replierProfileImageUrls": [],
    "timestamp": generateTimestamp(beforeDays: 14)
  },
  {
    "authorId": "1a",
    "authorName": "publity",
    "authorProfileImageUrl": "assets/images/thread-profile-image-1.jpg",
    "authorVerified": true,
    "body": "Vine after seeing the Treads logo unveiled",
    "imageUrls": [],
    "likeCount": 391,
    "replyCount": 36,
    "repliers": ["2b"],
    "replierProfileImageUrls": ["assets/images/thread-profile-image-2.jpg"],
    "timestamp": generateTimestamp(beforeSeconds: 10)
  },
  {
    "authorId": "2b",
    "authorName": "thetinderblog",
    "authorProfileImageUrl": "assets/images/thread-profile-image-2.jpg",
    "authorVerified": true,
    "body": "Elon alone on Twitter right now...",
    "imageUrls": [],
    "likeCount": 391,
    "replyCount": 36,
    "repliers": ["3c", "4d"],
    "replierProfileImageUrls": [
      "assets/images/thread-profile-image-3.jpg",
      "assets/images/thread-profile-image-4.jpg",
    ],
    "timestamp": generateTimestamp(beforeMinutes: 5)
  },
  {
    "authorId": "3c",
    "authorName": "tropicalseductions",
    "authorProfileImageUrl": "assets/images/thread-profile-image-3.jpg",
    "authorVerified": true,
    "body": "Drop a comment here to test things out.",
    "imageUrls": [],
    "likeCount": 4,
    "replyCount": 3,
    "repliers": ["1a", "2b", "4d"],
    "replierProfileImageUrls": [
      "assets/images/thread-profile-image-1.jpg",
      "assets/images/thread-profile-image-2.jpg",
      "assets/images/thread-profile-image-4.jpg",
    ],
    "timestamp": generateTimestamp(beforeHours: 2)
  },
  {
    "authorId": "4d",
    "authorName": "shityoushouldcareabout",
    "authorProfileImageUrl": "assets/images/thread-profile-image-3.jpg",
    "authorVerified": true,
    "body": "my phone feels like a vibrator with all these notifications rn",
    "imageUrls": [
      "assets/images/thread-image.jpg",
      "assets/images/thread-image.jpg",
      "assets/images/thread-image.jpg"
    ],
    "likeCount": 631,
    "replyCount": 64,
    "repliers": ["1a", "2b", "3c", "5e"],
    "replierProfileImageUrls": [
      "assets/images/thread-profile-image-1.jpg",
      "assets/images/thread-profile-image-2.jpg",
      "assets/images/thread-profile-image-3.jpg",
      "assets/images/thread-profile-image-5.jpg",
    ],
    "timestamp": generateTimestamp(beforeDays: 3)
  },
  {
    "authorId": "5e",
    "authorName": "plantswithkrystal",
    "authorProfileImageUrl": "assets/images/thread-profile-image-3.jpg",
    "authorVerified": true,
    "body":
        "If you're reading this, go water that thirsty plant. You're welcome ☺️",
    "imageUrls": [
      "assets/images/thread-image.jpg",
      "assets/images/thread-image.jpg",
      "assets/images/thread-image.jpg"
    ],
    "likeCount": 74,
    "replyCount": 0,
    "repliers": [],
    "replierProfileImageUrls": [],
    "timestamp": generateTimestamp(beforeDays: 14)
  }
]);
