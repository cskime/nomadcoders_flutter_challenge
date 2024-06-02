import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/scheduler_app/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/scheduler_app/models/event.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/scheduler_app/widgets/date_scroll_view.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/scheduler_app/widgets/event_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset('assets/images/avatar.png', width: 60),
                    ),
                    const Icon( 
                      Icons.add,
                      color: Colors.white,
                      size: 36,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const DateScrollView(),
                const SizedBox(height: 40),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => EventCard(
                    event: events[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: events.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
