import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_app/components/poster.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_app/components/titled_poster.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_app/models/movie.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_app/screens/movie_detail_screen.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_app/services/movie_service.dart';

class HomeScreen extends StatelessWidget {
  static const service = MovieService();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              posterRow(
                title: 'Popular Movies',
                future: service.fetchPopularMovies(),
                onItemPressed: (movie) => onItemPressed(context, movie),
              ),
              const SizedBox(height: 16),
              titledPosterRow(
                title: 'Now In Cinemas',
                future: service.fetchNowInCinemasMovies(),
                onItemPressed: (movie) => onItemPressed(context, movie),
              ),
              const SizedBox(height: 16),
              titledPosterRow(
                title: 'Coming soon',
                future: service.fetchComingSoonMovies(),
                onItemPressed: (movie) => onItemPressed(context, movie),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)),
    );
  }

  Widget posterRow(
      {required String title,
      required Future<List<Movie>> future,
      required RowItemPressedCallback onItemPressed}) {
    return _Row(
      title: title,
      onItemPressed: onItemPressed,
      future: future,
      size: (context, movies) {
        final screenSize = MediaQuery.of(context).size;
        final imageWidth = screenSize.width * 0.7;
        final imageHeight = imageWidth * 0.8;
        return Size(imageWidth, imageHeight);
      },
      builder: (movie, size) {
        return Poster(
          urlString: movie.posterPath,
          width: size.width,
          height: size.height,
        );
      },
    );
  }

  Widget titledPosterRow({
    required String title,
    required Future<List<Movie>> future,
    required RowItemPressedCallback onItemPressed,
  }) {
    return _Row(
      title: title,
      onItemPressed: onItemPressed,
      future: future,
      size: (context, movies) {
        final screenSize = MediaQuery.of(context).size;
        final imageSize = screenSize.width * 0.4;
        final maximumHeight = movies
            .map((movie) => TitledPoster.estimatedHeight(
                  imageSize: imageSize,
                  title: movie.title,
                ))
            .reduce(max);
        return Size(imageSize, maximumHeight);
      },
      builder: (movie, size) {
        return TitledPoster(
          urlString: movie.posterPath,
          title: movie.title,
          imageSize: size.width,
        );
      },
    );
  }
}

typedef RowHeight = Size Function(BuildContext context, List<Movie> movies);
typedef RowBuilder = Widget Function(Movie movie, Size itmeSize);
typedef RowItemPressedCallback = void Function(Movie movie);

class _Row extends StatelessWidget {
  final String title;
  final Future<List<Movie>> future;
  final RowHeight size;
  final RowBuilder builder;
  final RowItemPressedCallback onItemPressed;

  const _Row({
    required this.title,
    required this.future,
    required this.size,
    required this.builder,
    required this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(title),
        const SizedBox(height: 16),
        FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error!.toString());
            }

            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            Size itemSize = size(context, snapshot.data!);
            return SizedBox(
              height: itemSize.height,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final Movie movie = snapshot.data![index];
                  return GestureDetector(
                    onTap: () => onItemPressed(movie),
                    child: builder(movie, itemSize),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  const _Title(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
