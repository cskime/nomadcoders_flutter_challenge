import 'package:flutter/material.dart';

class ActivityTabBar extends SliverPersistentHeaderDelegate {
  const ActivityTabBar({
    required this.tabController,
    required this.tabs,
  });

  final TabController tabController;
  final List<Widget> tabs;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
      tabAlignment: TabAlignment.start,
      dividerHeight: 0,
      indicatorColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.white,
      tabs: tabs,
    );
  }

  @override
  double get maxExtent => 36;

  @override
  double get minExtent => 36;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
