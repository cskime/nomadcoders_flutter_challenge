import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day12/utils/image_uri.dart';

class Poster extends StatelessWidget {
  final String urlString;
  final double width;
  final double height;

  const Poster({
    super.key,
    required this.urlString,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        ImageUri.string(urlString),
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
