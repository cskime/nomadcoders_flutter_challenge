import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/widgets/movie_list/movie_chart_list_item.dart';
import 'package:nomadcoders_flutter_challenge/graduation/models/movie.dart';

class MovieChartList extends StatelessWidget {
  const MovieChartList({
    super.key,
    required this.movies,
  });

  final Future<List<Movie>> movies;

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.sizeOf(context).width * 0.4;
    const aspectRatio = 0.65;
    return SizedBox(
      height: itemWidth / aspectRatio + 100,
      child: FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              if (snapshot.data == null) {
                return ColoredBox(color: Colors.grey.shade300);
              }

              final movie = snapshot.data![index];
              return SizedBox(
                width: itemWidth,
                child: MovieChartListItem(
                  movie: movie,
                  posterAspectRatio: aspectRatio,
                  index: index,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: snapshot.data?.length ?? 0,
          );
        },
      ),
    );
  }
}
