import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    super.key,
    required this.avatar,
    required this.action,
    required this.title,
    required this.verified,
    required this.updated,
    required this.bodyText,
    this.body,
    this.footer,
  });

  final Widget avatar;
  final Widget action;
  final String title;
  final String updated;
  final bool verified;
  final Widget bodyText;
  final Widget? body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 12,
            right: 16,
            bottom: 8,
          ),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        avatar,
                        if (footer != null) ...[
                          const SizedBox(height: 4),
                          Expanded(
                            child: SizedBox(
                              width: 2,
                              child: ColoredBox(color: Colors.grey.shade300),
                            ),
                          ),
                          const SizedBox(height: 4),
                        ]
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 16,
                              ),
                              const Spacer(),
                              Text(
                                updated,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(width: 12),
                              action,
                            ],
                          ),
                          bodyText,
                          if (body != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: body,
                            ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Wrap(
                              spacing: 20,
                              children: [
                                Icon(FontAwesomeIcons.heart, size: 20),
                                Icon(FontAwesomeIcons.comment, size: 20),
                                Icon(FontAwesomeIcons.repeat, size: 20),
                                Icon(FontAwesomeIcons.paperPlane, size: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (footer != null) footer!,
            ],
          ),
        ),
        Divider(color: Colors.grey.shade200),
      ],
    );
  }
}
