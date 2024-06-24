import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/models/activity_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/widgets/activity_all_page.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/widgets/activity_tab.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/widgets/activity_tab_bar.dart';

class ActivityScreen extends StatefulWidget {
  static const routeName = "activity";
  static const routeUrl = "/activity";
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(
    length: ActivityType.values.length + 1,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(
              'Activity',
              style: Theme.of(context)
                  .appBarTheme
                  .titleTextStyle
                  ?.copyWith(fontSize: 32),
            ),
            centerTitle: false,
            shape: const Border(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: ActivityTabBar(
              tabController: _tabController,
              tabs: [
                ActivityTab(
                  title: 'All',
                  selected: _tabController.index == 0,
                ),
                ...ActivityType.values.map((type) => ActivityTab(
                      title: type.title,
                      selected: type.index + 1 == _tabController.index,
                    ))
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            const ActivityAllPage(),
            Center(child: Icon(ActivityType.replies.iconData)),
            Center(child: Icon(ActivityType.mentions.iconData)),
            Center(child: Icon(ActivityType.requests.iconData)),
            Center(child: Icon(ActivityType.likes.iconData)),
          ],
        ),
      ),
    );
  }
}
