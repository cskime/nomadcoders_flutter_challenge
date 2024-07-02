import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/username_label.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/models/user_profile.dart';

class UserSearchListTile extends StatelessWidget {
  const UserSearchListTile({
    super.key,
    required this.user,
  });

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(user.profileImageUrl!),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UsernameLabel(
                  text: user.username,
                  verified: user.verified,
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
                  '${NumberFormat.compact().format(user.followerCount)} followers',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _FollowButton(),
          ),
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
      child: Text(
        'Follow',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
