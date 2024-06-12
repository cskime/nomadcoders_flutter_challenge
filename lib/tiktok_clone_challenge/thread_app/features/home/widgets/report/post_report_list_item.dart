import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostReportListItem extends StatelessWidget {
  const PostReportListItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Divider(
            height: 1,
            color: Colors.grey.shade400,
          ),
        ),
        ListTile(
          minVerticalPadding: 20,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const FaIcon(
            FontAwesomeIcons.chevronRight,
            color: Colors.grey,
            size: 16,
          ),
        ),
      ],
    );
  }
}
