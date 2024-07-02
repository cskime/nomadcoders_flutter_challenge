import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/activity/activity_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/views/home_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/views/write_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/views/profile_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/search/views/search_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const tabs = [
    HomeScreen.routeName,
    SearchScreen.routeName,
    "write",
    ActivityScreen.routeName,
    ProfileScreen.routeName,
  ];
  static final routeUrl = "/:tab(${tabs.join("|")})";

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  final String tab;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex = MainNavigationScreen.tabs.indexOf(widget.tab);

  void _onTap() {
    FocusScope.of(context).unfocus();
  }

  void _onItemTap(int index) {
    if (index == 2) {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (context) => const WriteScreen(),
      );
      return;
    }

    context.go("/${MainNavigationScreen.tabs[index]}");
    setState(() {
      _currentIndex = index;
    });
  }

  Widget get _body => switch (_currentIndex) {
        1 => const SearchScreen(),
        3 => const ActivityScreen(),
        4 => const ProfileScreen(),
        _ => const HomeScreen(),
      };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Scaffold(
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.magnifyingGlass),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.penToSquare),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidHeart),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
