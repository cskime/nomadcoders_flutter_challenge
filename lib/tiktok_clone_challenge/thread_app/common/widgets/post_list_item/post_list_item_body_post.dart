import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/utils/image_placeholder.dart';

class PostListItemBodyPost extends StatelessWidget {
  const PostListItemBodyPost({
    super.key,
    this.userProfileImagePath,
    required this.username,
    required this.verifiedUser,
    required this.bodyText,
    this.imageUrls = const [],
  });

  final String? userProfileImagePath;
  final String username;
  final bool verifiedUser;
  final String bodyText;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: (userProfileImagePath == null
                    ? AssetImage(ImagePlaceholder.userProfileImageUrl)
                    : NetworkImage(userProfileImagePath!)) as ImageProvider,
                radius: 10,
              ),
              const SizedBox(width: 8),
              Text(
                username,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 4),
              const FaIcon(
                Icons.verified,
                color: Colors.blue,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(bodyText),
          if (imageUrls.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(imageUrls.first),
            )
          ],
          const SizedBox(height: 16),
          const Text(
            "256 replies",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
