import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostListItemBodyPost extends StatelessWidget {
  const PostListItemBodyPost({
    super.key,
    required this.userProfileImagePath,
    required this.username,
    required this.verifiedUser,
    required this.bodyText,
    this.imageUrls = const [],
  });

  final String userProfileImagePath;
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
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(userProfileImagePath),
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
        ],
      ),
    );
  }
}
