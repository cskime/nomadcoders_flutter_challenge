import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({
    super.key,
    required this.size,
    required this.filled,
  });

  final double size;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      FontAwesomeIcons.solidStar,
      color: filled ? const Color(0xFFF8D848) : Colors.grey,
      size: size,
    );
  }
}
