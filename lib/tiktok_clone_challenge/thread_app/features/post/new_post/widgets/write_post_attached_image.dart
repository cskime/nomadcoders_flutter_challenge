import 'dart:io';

import 'package:flutter/material.dart';

class WritePostAttachedImage extends StatelessWidget {
  const WritePostAttachedImage({
    super.key,
    required this.width,
    required this.height,
    required this.imageFile,
    required this.onRemovePressed,
  });

  final double width;
  final double height;
  final File imageFile;
  final void Function() onRemovePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 240,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                imageFile,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: onRemovePressed,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
