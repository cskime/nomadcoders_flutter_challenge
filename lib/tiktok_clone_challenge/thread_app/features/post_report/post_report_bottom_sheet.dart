import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/common/widgets/bottom_sheet_handle.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post_report/widgets/post_report_list_item.dart';

class PostReportBottomSheet extends StatelessWidget {
  const PostReportBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      initialChildSize: 0.7,
      maxChildSize: 1.0,
      minChildSize: 0.7,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 20),
              child: BottomSheetHandle(),
            ),
            const Text(
              'Report',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Why are you reporting this thread?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Your report is anonymous, except if you're reporting an intellectual property infringgement. If someone is in immediate danger, call the local emergency service - don't wait.",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                controller: scrollController,
                children: const [
                  PostReportListItem(title: "I just don't like it"),
                  PostReportListItem(
                      title: "It's unlawful content under NetzDG"),
                  PostReportListItem(title: "It's spam"),
                  PostReportListItem(title: "Hate speech or symbols"),
                  PostReportListItem(title: "Nudity or sexual activity"),
                  PostReportListItem(title: "I just don't like it"),
                  PostReportListItem(
                      title: "It's unlawful content under NetzDG"),
                  PostReportListItem(title: "It's spam"),
                  PostReportListItem(title: "Hate speech or symbols"),
                  PostReportListItem(title: "Nudity or sexual activity"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
