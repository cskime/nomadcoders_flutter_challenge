import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/models/activity.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/widgets/activity_all_list_item.dart';

class ActivityAllPage extends StatelessWidget {
  const ActivityAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ListView.builder(
        itemCount: dummyActivities.length,
        itemBuilder: (context, index) => ActivityAllListItem(
          activity: dummyActivities[index],
        ),
      ),
    );
  }
}
