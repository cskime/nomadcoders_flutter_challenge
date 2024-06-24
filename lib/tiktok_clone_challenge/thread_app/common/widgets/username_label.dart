import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/verified_mark.dart';

class UsernameLabel extends StatelessWidget {
  const UsernameLabel({
    super.key,
    required this.text,
    required this.verified,
  });

  final String text;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(overflow: TextOverflow.ellipsis),
          ),
        ),
        const SizedBox(width: 4),
        if (verified) const VerifiedMark(),
      ],
    );
  }
}
