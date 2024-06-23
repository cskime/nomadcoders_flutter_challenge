import 'package:flutter/material.dart';

class WritePostAppBar extends StatelessWidget {
  const WritePostAppBar({
    super.key,
    required this.title,
    required this.height,
    required this.borderRadius,
  });

  final String title;
  final double height;
  final BorderRadius borderRadius;

  void _onClose(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
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
                    onTap: () => _onClose(context),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Divider(
              height: 1,
              color: Colors.grey.shade300,
            ),
          )
        ],
      ),
    );
  }
}
