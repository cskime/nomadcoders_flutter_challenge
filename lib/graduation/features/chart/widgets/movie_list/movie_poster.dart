import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/graduation/utils/image_uri.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.urlString,
    required this.order,
  });

  final String urlString;
  final int order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            ImageUri.string(urlString),
            fit: BoxFit.cover,
          ),
          const ColoredBox(color: Colors.black12),
          Positioned(
            left: 6,
            bottom: 0,
            child: Text(
              '$order',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
