import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/models/activity_type.dart';

class Activity {
  Activity({
    required this.username,
    required this.profileImageUrl,
    required this.type,
    this.description,
    this.body,
    required this.receiveDate,
  });

  final String username;
  final String profileImageUrl;
  final ActivityType type;
  final String? description;
  final String? body;
  final DateTime receiveDate;

  String get received {
    final ago = DateTime.now().difference(receiveDate).inSeconds;
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

final dummyActivities = [
  Activity(
      username: "publity",
      profileImageUrl: "assets/images/thread-profile-image-1.jpg",
      type: ActivityType.mentions,
      description: "Mentioned you",
      body: "Here's a thread you should follow if you love botany @jane_mobbin",
      receiveDate: DateTime.now().subtract(const Duration(hours: 4))),
  Activity(
      username: "thetinderblog",
      profileImageUrl: "assets/images/thread-profile-image-2.jpg",
      type: ActivityType.replies,
      description: "Starting out my gardening club with thread blablabla",
      body: "Count me in!",
      receiveDate: DateTime.now().subtract(const Duration(hours: 4))),
  Activity(
      username: "tropicalseductions",
      profileImageUrl: "assets/images/thread-profile-image-3.jpg",
      type: ActivityType.requests,
      description: "Followed you",
      receiveDate: DateTime.now().subtract(const Duration(hours: 5))),
  Activity(
      username: "shityoushouldcareabout",
      profileImageUrl: "assets/images/thread-profile-image-4.jpg",
      type: ActivityType.likes,
      description: "Definitely broken! 🌟🏆🚀",
      receiveDate: DateTime.now().subtract(const Duration(hours: 5))),
  Activity(
      username: "plantswithkrystal",
      profileImageUrl: "assets/images/thread-profile-image-5.jpg",
      type: ActivityType.likes,
      body: "🌟🏆🚀",
      receiveDate: DateTime.now().subtract(const Duration(hours: 5))),
];
