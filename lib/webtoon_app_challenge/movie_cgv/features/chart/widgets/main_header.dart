import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/widgets/gradient_box.dart';

const _headerTabs = [
  'Home',
  'Event',
  'Order',
  'Giftshop',
  '@CGV',
];

class SliverMainHeader extends StatelessWidget {
  const SliverMainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _HeaderDelegate(),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return DefaultTextStyle(
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
    );
  }

  @override
  double get maxExtent => 43;

  @override
  double get minExtent => 43;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
