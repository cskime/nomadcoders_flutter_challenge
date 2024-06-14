import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/widgets/write_post_text_field.dart';

class WritePostEditArea extends StatelessWidget {
  const WritePostEditArea({
    super.key,
    required this.userProfileImage,
    required this.username,
    required this.textEditingController,
  });

  final ImageProvider<Object>? userProfileImage;
  final String username;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: userProfileImage,
                      ),
                      const Expanded(
                        child: VerticalDivider(
                          indent: 8,
                          endIndent: 8,
                        ),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundImage: userProfileImage,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WritePostTextField(
                          controller: textEditingController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 48,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.paperclip,
                            color: Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
