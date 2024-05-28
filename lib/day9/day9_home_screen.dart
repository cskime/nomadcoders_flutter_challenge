import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day9/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/day9/models/event.dart';
import 'package:nomadcoders_flutter_challenge/day9/widgets/date_scroll_view.dart';
import 'package:nomadcoders_flutter_challenge/day9/widgets/event_card.dart';

class Day9HomeScreen extends StatelessWidget {
  const Day9HomeScreen({super.key});

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
