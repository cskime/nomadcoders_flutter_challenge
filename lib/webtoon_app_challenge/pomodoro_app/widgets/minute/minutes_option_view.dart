import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/pomodoro_app/widgets/minute/minutes_list_fade_effect.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/pomodoro_app/widgets/minute/minutes_list_view.dart';

class MinutesOptionView extends StatelessWidget {
  const MinutesOptionView({
    super.key,
    required this.height,
    required this.onMinuteSelected,
  });

  final double height;
  final void Function(int minute) onMinuteSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          MinutesListView(
            height: height,
            onMinuteSelected: onMinuteSelected,
          ),
          const MinutesListFadeEffect(),
        ],
      ),
    );
  }
}
