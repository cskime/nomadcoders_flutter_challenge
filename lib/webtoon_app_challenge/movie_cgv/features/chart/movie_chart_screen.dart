import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/movie_chart_all_screen.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/widgets/main_header.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/widgets/movie_list/movie_chart_list.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/widgets/section/chart_section_divider.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/widgets/section/chart_section_header.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/widgets/section/segmented_header_text.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/models/chart_option.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/state/movies_scope.dart';

class MovieChartScreen extends StatefulWidget {
  const MovieChartScreen({super.key});

  @override
  State<MovieChartScreen> createState() => _MovieChartScreenState();
}

class _MovieChartScreenState extends State<MovieChartScreen> {
  var _selectedSegmentIndex = 0;

  void _onSegmentSelected(int index) {
    setState(() {
      _selectedSegmentIndex = index;
    });
  }

  void _onShowAllPressed(ChartOption option) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MovieChartAllScreen(
        initialChartOption: option,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final movieService = MovieServiceState.of(context).service;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              centerTitle: false,
              title: Text(
                'MGV',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                ),
              ),
              actions: const [
                FaIcon(
                  FontAwesomeIcons.ticket,
                  color: Colors.black,
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: FaIcon(
                    FontAwesomeIcons.bowlFood,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: FaIcon(
                    FontAwesomeIcons.bars,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SliverMainHeader(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChartSectionHeader(
                    title: Text(ChartOption.popular.title),
                    onShowAllPressed: () =>
                        _onShowAllPressed(ChartOption.popular),
                  ),
                  MovieChartList(
                    movies: movieService.fetchPopularMovies(),
                  ),
                  const SizedBox(height: 24),
                  const ChartSectionDivider(),
                  ChartSectionHeader(
                    title: SegmentedHeaderText(
                      texts: [
                        ChartOption.nowPlaying.title,
                        ChartOption.comingSoon.title,
                      ],
                      onSegmentSelected: _onSegmentSelected,
                    ),
                    onShowAllPressed: () => _onShowAllPressed(
                      _selectedSegmentIndex == 0
                          ? ChartOption.nowPlaying
                          : ChartOption.comingSoon,
                    ),
                  ),
                  MovieChartList(
                    movies: _selectedSegmentIndex == 0
                        ? movieService.fetchNowInCinemasMovies()
                        : movieService.fetchComingSoonMovies(),
                  ),
                  const SizedBox(height: 24),
                  const ChartSectionDivider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
