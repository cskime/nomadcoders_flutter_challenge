import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/widgets/movie_list/movie_poster.dart';
import 'package:nomadcoders_flutter_challenge/graduation/models/movie.dart';

class MovieChartListItem extends StatelessWidget {
  const MovieChartListItem({
    super.key,
    required this.movie,
    required this.posterAspectRatio,
    required this.index,
  });

  final Movie movie;
  final double posterAspectRatio;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: posterAspectRatio,
            child: MoviePoster(
              urlString: movie.posterPath,
              order: index + 1,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          movie.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1,
          ),
        ),
        const SizedBox(height: 12),
        _BookButton()
      ],
    );
  }
}

class _BookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 4,
      ),
      child: const Text(
        '지금예매',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
