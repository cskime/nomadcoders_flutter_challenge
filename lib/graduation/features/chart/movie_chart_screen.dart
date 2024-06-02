import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/movie_chart_all_screen.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/widgets/gradient_box.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/widgets/movie_list/movie_chart_list.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/widgets/section/chart_section_divider.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/widgets/section/chart_section_header.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/widgets/section/segmented_header_text.dart';
import 'package:nomadcoders_flutter_challenge/graduation/models/chart_option.dart';
import 'package:nomadcoders_flutter_challenge/graduation/state/movies_scope.dart';

const _headerTabs = [
  '홈',
  '이벤트',
  '패스트오더',
  '기프트샵',
  '@CGV',
];

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
      appBar: AppBar(
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(43),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            child: Stack(
              children: [
                const Positioned.fill(
                  child: GradientBox(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _headerTabs.map((e) => Text(e)).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChartSectionHeader(
              title: const Text('무비차트'),
              onShowAllPressed: () => _onShowAllPressed(ChartOption.popular),
            ),
            MovieChartList(
              movies: movieService.fetchPopularMovies(),
            ),
            const SizedBox(height: 24),
            const ChartSectionDivider(),
            ChartSectionHeader(
              title: SegmentedHeaderText(
                texts: const ['현재상영작', '상영예정'],
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
      ),
    );
  }
}
