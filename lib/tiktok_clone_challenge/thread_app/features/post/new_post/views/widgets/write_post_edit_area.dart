import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/views/widgets/write_post_attached_image.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/views/widgets/write_post_text_field.dart';

class WritePostEditArea extends StatelessWidget {
  const WritePostEditArea({
    super.key,
    required this.userProfileImage,
    required this.username,
    required this.textEditingController,
    required this.attachedFiles,
    required this.onAttachPressed,
    required this.onRemovePressed,
  });

  final ImageProvider<Object>? userProfileImage;
  final String username;
  final TextEditingController textEditingController;
  final List<File> attachedFiles;
  final void Function() onAttachPressed;
  final void Function(int index) onRemovePressed;

  @override
  Widget build(BuildContext context) {
    const inset = 16.0;
    const avatarRadius = 20.0;
    const horizontalGap = 16.0;
    const imageGap = 8.0;
    final imageWidth = MediaQuery.sizeOf(context).width -
        inset * 2 -
        avatarRadius * 2 -
        horizontalGap -
        32;
    final imageHeight = imageWidth * 1.1;
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.all(inset),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
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
                  const SizedBox(width: horizontalGap),
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
                        if (attachedFiles.isNotEmpty)
                          SizedBox(
                            height: imageHeight,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: attachedFiles.length,
                              itemBuilder: (context, index) =>
                                  WritePostAttachedImage(
                                width: imageWidth,
                                height: imageHeight,
                                imageFile: attachedFiles[index],
                                onRemovePressed: () => onRemovePressed(index),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: imageGap),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 48,
                          ),
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.paperclip,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: onAttachPressed,
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
