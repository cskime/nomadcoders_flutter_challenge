import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/models/activity.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/models/activity_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';

class ActivityAllListItem extends StatelessWidget {
  const ActivityAllListItem({
    super.key,
    required this.activity,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThreadTheme.isDarkTheme(context);
    return ListTile(
      leading: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(
                activity.user.profileImagePath!,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: activity.type.icon,
            ),
          ],
        ),
      ),
      title: Row(
        children: [
          Flexible(
            child: Text(
              activity.user.username,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            activity.received,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (activity.description != null)
            Text(
              activity.description!,
              style: Theme.of(context).textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
            ),
          if (activity.body != null)
            Text(
              activity.body!,
              style: Theme.of(context).textTheme.bodyMedium,
            )
        ],
      ),
      trailing: activity.type == ActivityType.requests
          ? Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: Text(
                'Following',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ThreadTheme.foregroundColor(
                        isDarkMode: isDarkMode,
                      ),
                    ),
              ),
            )
          : null,
    );
  }
}
