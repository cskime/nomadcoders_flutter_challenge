import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

class Post {
  Post({
    required this.user,
    required this.body,
    this.imagePaths = const [],
    required this.commentCount,
    required this.likeCount,
    this.repliers = const [],
    required this.uploadDate,
  });

  final User user;
  final String body;
  final List<String> imagePaths;
  final int commentCount;
  final int likeCount;
  final List<User> repliers;
  final DateTime uploadDate;

  String get updated {
    final ago = DateTime.now().difference(uploadDate).inSeconds;
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

final dummyPosts = [
  Post(
    user: User(
      username: 'publity',
      verified: true,
    ),
    body: 'Vine after seeing the Treads logo unveiled',
    commentCount: 36,
    likeCount: 391,
    repliers: [
      User(username: 'tropicalseductions', verified: true),
    ],
    uploadDate: DateTime.now().subtract(const Duration(seconds: 14)),
  ),
  Post(
    user: User(
      username: 'thetinderblog',
      verified: true,
    ),
    body: 'Elon alone on Twitter right now...',
    commentCount: 36,
    likeCount: 391,
    repliers: [
      User(username: 'tropicalseductions', verified: true),
      User(username: 'shityoushouldcareabout', verified: true),
    ],
    uploadDate: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  Post(
    user: User(
      username: 'tropicalseductions',
      verified: true,
    ),
    body: 'Drop a comment here to test things out.',
    commentCount: 2,
    likeCount: 4,
    repliers: [
      User(username: 'tropicalseductions', verified: true),
      User(username: 'shityoushouldcareabout', verified: true),
      User(username: 'plantswithkrystal_', verified: true),
    ],
    uploadDate: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  Post(
    user: User(
      username: 'shityoushouldcareabout',
      verified: true,
    ),
    body: 'my phone feels like a vibrator with all these notifications rn',
    commentCount: 64,
    likeCount: 631,
    repliers: [
      User(username: 'tropicalseductions', verified: true),
      User(username: 'shityoushouldcareabout', verified: true),
      User(username: 'plantswithkrystal_', verified: true),
      User(username: 'terracottacoco', verified: true),
    ],
    uploadDate: DateTime.now().subtract(const Duration(days: 3)),
  ),
  Post(
    user: User(
      username: 'plantswithkrystal',
      verified: true,
    ),
    body:
        'If you\'re reading this, go water that thirsty plant. You\'re welcome ☺️',
    commentCount: 8,
    likeCount: 74,
    uploadDate: DateTime.now().subtract(const Duration(days: 14)),
  ),
  Post(
    user: User(
      username: 'publity',
      verified: true,
    ),
    body: 'Vine after seeing the Treads logo unveiled',
    commentCount: 36,
    likeCount: 391,
    repliers: [
      User(username: 'tropicalseductions', verified: true),
    ],
    uploadDate: DateTime.now().subtract(const Duration(seconds: 14)),
  ),
  Post(
    user: User(
      username: 'thetinderblog',
      verified: true,
    ),
    body: 'Elon alone on Twitter right now...',
    commentCount: 36,
    likeCount: 391,
    repliers: [
      User(username: 'tropicalseductions', verified: true),
      User(username: 'shityoushouldcareabout', verified: true),
    ],
    uploadDate: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  Post(
    user: User(
      username: 'tropicalseductions',
      verified: true,
    ),
    body: 'Drop a comment here to test things out.',
    commentCount: 2,
    likeCount: 4,
    repliers: [
      User(username: 'tropicalseductions', verified: true),
      User(username: 'shityoushouldcareabout', verified: true),
      User(username: 'plantswithkrystal_', verified: true),
    ],
    uploadDate: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  Post(
    user: User(
      username: 'shityoushouldcareabout',
      verified: true,
    ),
    body: 'my phone feels like a vibrator with all these notifications rn',
    commentCount: 64,
    likeCount: 631,
    repliers: [
      User(username: 'tropicalseductions', verified: true),
      User(username: 'shityoushouldcareabout', verified: true),
      User(username: 'plantswithkrystal_', verified: true),
      User(username: 'terracottacoco', verified: true),
    ],
    uploadDate: DateTime.now().subtract(const Duration(days: 3)),
  ),
  Post(
    user: User(
      username: 'plantswithkrystal',
      verified: true,
    ),
    body:
        'If you\'re reading this, go water that thirsty plant. You\'re welcome ☺️',
    commentCount: 8,
    likeCount: 74,
    uploadDate: DateTime.now().subtract(const Duration(days: 14)),
  ),
];
