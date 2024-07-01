import 'package:flutter/material.dart';

class WritePostAppBar extends StatelessWidget {
  const WritePostAppBar({
    super.key,
    required this.title,
    required this.height,
    required this.borderRadius,
    required this.onClose,
  });

  final String title;
  final double height;
  final BorderRadius borderRadius;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onClose,
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Divider(height: 1),
          )
        ],
      ),
    );
  }
}
