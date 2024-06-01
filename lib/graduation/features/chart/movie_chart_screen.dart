import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/widgets/gradient_box.dart';

class MovieChartScreen extends StatelessWidget {
  const MovieChartScreen({super.key});

  final _tabs = const [
    '홈',
    '이벤트',
    '패스트오더',
    '기프트샵',
    '@CGV',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
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
              SliverPersistentHeader(
                delegate: _HeaderTabBar(),
                pinned: true,
                floating: true,
              )
            ],
            body: const ColoredBox(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const DefaultTextStyle(
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: GradientBox(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('홈'),
                  Text('이벤트'),
                  Text('패스트오더'),
                  Text('기프트샵'),
                  Text('@CGV'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 43;

  @override
  double get minExtent => 43;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
