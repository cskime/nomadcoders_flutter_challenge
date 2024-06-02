import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_app/models/movie.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_app/models/movie_detail.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_app/services/movie_service.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_app/utils/image_uri.dart';

class MovieDetailScreen extends StatelessWidget {
  static const service = MovieService();

  final Movie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              ImageUri.string(movie.posterPath),
              fit: BoxFit.cover,
            ),
          ),
          const Positioned.fill(
            child: ColoredBox(
              color: Colors.black38,
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      appBar(onBackTap: () => Navigator.of(context).pop()),
                      const SizedBox(height: 200),
                      FutureBuilder(
                        future: service.fetchMovieDetailById(id: movie.id),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          MovieDetail movieDetail = snapshot.data!;
                          return Column(
                            children: [
                              movieInfo(
                                title: movieDetail.title,
                                rating: movieDetail.rating ~/ 2,
                                runtime: movieDetail.runtime,
                                genres: movieDetail.genres,
                              ),
                              const SizedBox(height: 48),
                              storyline(movieDetail.storyline)
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 48,
            right: 48,
            bottom: 32,
            child: _BuyTicketButton(),
          ),
        ],
      ),
    );
  }

  Widget appBar({required void Function() onBackTap}) {
    return GestureDetector(
      onTap: onBackTap,
      child: const Row(
        children: [
          Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 24,
          ),
          SizedBox(width: 8),
          Text(
            "Back to list",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Widget movieInfo({
    required String title,
    required int rating,
    required int runtime,
    required List<String> genres,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        _RatingView(rating: rating),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              '2h 14min',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              '|',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 4),
            Text(
              genres.join(", "),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget storyline(String storyline) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Storyline',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          storyline,
          softWrap: true,
          style: const TextStyle(color: Colors.white),
          maxLines: null,
        )
      ],
    );
  }
}

class _RatingView extends StatelessWidget {
  final int rating;

  const _RatingView({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
          return Icon(
            Icons.star,
            color: index < rating ? Colors.yellow : Colors.grey,
          );
        },
      ),
    );
  }
}

class _BuyTicketButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF8D848),
      ),
      child: const Center(
        child: Text(
          'Buy ticket',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
