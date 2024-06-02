import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/scheduler_app/models/event.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/scheduler_app/widgets/event_card_time.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/scheduler_app/widgets/participants_list_view.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16).copyWith(top: 24),
      decoration: BoxDecoration(
        color: event.backgroundColor,
        borderRadius: BorderRadius.circular(48),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EventCardTime(
            start: event.startTime,
            end: event.endTime,
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 60,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 32),
                ParticipantsListView(participants: event.participants)
              ],
            ),
          )
        ],
      ),
    );
  }
}
