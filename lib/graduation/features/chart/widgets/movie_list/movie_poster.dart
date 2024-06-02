import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nomadcoders_flutter_challenge/graduation/models/movie.dart';
import 'package:nomadcoders_flutter_challenge/graduation/utils/image_uri.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.movie,
    required this.order,
  });

  final Movie movie;
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
            ImageUri.string(movie.posterPath),
            fit: BoxFit.cover,
          ),
          const ColoredBox(color: Colors.black12),
          Positioned(
            left: 6,
            bottom: 0,
            child: Row(
              children: [
                Text(
                  '$order',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    height: 1,
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    '평점 ${movie.voteAverage.toInt()}/10',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: SvgPicture.asset(
              'assets/images/icon-${movie.adult ? 'adult' : 'all'}.svg',
            ),
          ),
        ],
      ),
    );
  }
}
