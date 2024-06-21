import 'package:flutter/material.dart';

class CameraBottomBar extends StatelessWidget {
  const CameraBottomBar({
    super.key,
    required this.onLibraryPressed,
  });

  final void Function() onLibraryPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Camera",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: onLibraryPressed,
                child: const Text(
                  "Library",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
