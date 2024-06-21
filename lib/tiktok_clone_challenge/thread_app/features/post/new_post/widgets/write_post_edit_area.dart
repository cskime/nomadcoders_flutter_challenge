import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/camera/camera_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/widgets/write_post_attached_image.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/widgets/write_post_text_field.dart';

class WritePostEditArea extends StatefulWidget {
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
  State<WritePostEditArea> createState() => _WritePostEditAreaState();
}

class _WritePostEditAreaState extends State<WritePostEditArea> {
  final List<File> _attachedFiles = [];

  void _onAttachPressed(BuildContext context) async {
    final files = await Navigator.of(context).push<List<XFile>>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const CameraScreen(),
      ),
    );

    if (files == null) {
      return;
    }

    setState(() {
      _attachedFiles.addAll(
        files.map((file) => File(file.path)).toList(),
      );
    });
  }

  void _onRemovePressed(int index) {
    setState(() {
      _attachedFiles.removeAt(index);
    });
  }

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
                        backgroundImage: widget.userProfileImage,
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
                          backgroundImage: widget.userProfileImage,
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
                          widget.username,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WritePostTextField(
                          controller: widget.textEditingController,
                        ),
                        if (_attachedFiles.isNotEmpty)
                          SizedBox(
                            height: imageHeight,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: _attachedFiles.length,
                              itemBuilder: (context, index) =>
                                  WritePostAttachedImage(
                                width: imageWidth,
                                height: imageHeight,
                                imageFile: _attachedFiles[index],
                                onRemovePressed: () => _onRemovePressed(index),
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
                            onPressed: () => _onAttachPressed(context),
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
