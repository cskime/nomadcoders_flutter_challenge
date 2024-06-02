import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/graduation/common/rating_view.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/detail/widgets/movie_detail_app_bar.dart';
import 'package:nomadcoders_flutter_challenge/graduation/models/movie_detail.dart';
import 'package:nomadcoders_flutter_challenge/graduation/state/movies_scope.dart';
import 'package:nomadcoders_flutter_challenge/graduation/utils/image_uri.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    super.key,
    required this.id,
  });

  final int id;
  String _runtime(MovieDetail movie) =>
      '${movie.runtime ~/ 60}h ${movie.runtime % 60}min';
  String _genres(MovieDetail movie) => movie.genres.join(', ');

  @override
  Widget build(BuildContext context) {
    final movieService = MovieServiceState.of(context).service;
    return Scaffold(
      body: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FutureBuilder(
              future: movieService.fetchMovieDetailById(id: id),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                final movie = snapshot.data!;
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        ImageUri.string(movie.posterPath),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const Positioned.fill(
                      child: ColoredBox(
                        color: Colors.black38,
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 8,
                                  children: movie.companyLogoPaths
                                      .map<Widget>(
                                        (path) => Image.network(
                                          ImageUri.string(path),
                                          height: 32,
                                        ),
                                      )
                                      .toList(),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                RatingView(rating: movie.rating),
                                const SizedBox(height: 24),
                                Text(
                                  '${_runtime(movie)} | ${_genres(movie)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                const Text(
                                  'Storyline',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  movie.storyline,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 48),
                            const _BuyTicketButton(),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: MovieDetailAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuyTicketButton extends StatelessWidget {
  const _BuyTicketButton({this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.6,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Buy ticket',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
