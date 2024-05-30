import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day11/widgets/minute/minute_button.dart';

class MinutesListView extends StatefulWidget {
  const MinutesListView({
    super.key,
    required this.height,
    required this.onMinuteSelected,
  });

  final double height;
  final void Function(int minute) onMinuteSelected;

  @override
  State<MinutesListView> createState() => _MinutesListViewState();
}

class _MinutesListViewState extends State<MinutesListView> {
  static const unit = 5;
  final minutes = List.generate(12, (index) => (index + 1) * unit);
  int _current = unit;

  void _onPressed(int minute) {
    setState(() {
      _current = minute;
    });
    widget.onMinuteSelected(minute);
  }

  @override
  Widget build(BuildContext context) {
    const buttonAspectRatio = 1.5;
    final buttonWidth = widget.height * buttonAspectRatio;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: (MediaQuery.sizeOf(context).width - buttonWidth) / 2,
      ),
      itemCount: minutes.length,
      itemBuilder: (context, index) {
        int minute = minutes[index];
        return MinuteButton(
          width: buttonWidth,
          height: widget.height,
          minute: minute,
          isSelected: minute == _current,
          onPressed: _onPressed,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 16);
      },
    );
  }
}
