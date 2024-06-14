import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

class UserSearchListTile extends StatelessWidget {
  const UserSearchListTile({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(user.profileImagePath!),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        user.username,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.verified,
                      color: Colors.blue,
                      size: 18,
                    )
                  ],
                ),
                Text(
                  user.name,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(height: 4),
                Text(
                  '${user.followerCount} followers',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
          const SizedBox(width: 16),
          _FollowButton(),
        ],
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 4,
      ),
      child: const Text(
        'Follow',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
