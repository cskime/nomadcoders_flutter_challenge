import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/widgets/chart_all_tab_bar.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/widgets/movie_list/movie_chart_all_list_item.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/detail/movie_detail_screen.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/models/chart_option.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/models/movie.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/state/movies_scope.dart';

class MovieChartAllScreen extends StatefulWidget {
  const MovieChartAllScreen({
    super.key,
    required this.initialChartOption,
  });

  final ChartOption initialChartOption;

  @override
  State<MovieChartAllScreen> createState() => _MovieChartAllScreenState();
}

class _MovieChartAllScreenState extends State<MovieChartAllScreen> {
  late var _chartOption = widget.initialChartOption;

  void _onOptionSelected(ChartOption option) {
    setState(() {
      _chartOption = option;
    });
  }

  void _onItemPressed(int id) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MovieDetailScreen(id: id),
    ));
  }

  Future<List<Movie>> _fetchMovies() {
    final movieService = MovieServiceState.of(context).service;
    return switch (_chartOption) {
      ChartOption.popular => movieService.fetchPopularMovies(),
      ChartOption.nowPlaying => movieService.fetchNowInCinemasMovies(),
      ChartOption.comingSoon => movieService.fetchComingSoonMovies(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FaIcon(FontAwesomeIcons.bars),
          ),
        ],
      ),
      body: Column(
        children: [
          ChartAllOptionBar(
            options: ChartOption.values,
            initialChartOption: _chartOption,
            onOptionSelected: _onOptionSelected,
          ),
          FutureBuilder(
            future: _fetchMovies(),
            builder: (context, snapshot) {
              if (!snapshot.hasData ||
                  snapshot.connectionState != ConnectionState.done) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }

              return Expanded(
                child: ColoredBox(
                  color: Colors.grey.shade200,
                  child: ListView.separated(
                    itemCount: snapshot.data!.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.check,
                                    size: 12,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Show Now Playing',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }

                      final movie = snapshot.data![index - 1];
                      return MovieChartAllListItem(
                        movie: movie,
                        onPressed: () => _onItemPressed(movie.id),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
