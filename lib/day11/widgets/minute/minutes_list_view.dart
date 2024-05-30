import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day11/widgets/minute/minute_button.dart';

class MinutesListView extends StatefulWidget {
  const MinutesListView({
    super.key,
    required this.height,
    required this.onMinuteSelected,
  });

  static const double buttonAspectRatio = 1.5;
  final double height;
  double get buttonWidth => height * buttonAspectRatio;

  final void Function(int minute) onMinuteSelected;

  @override
  State<MinutesListView> createState() => _MinutesListViewState();
}

class _MinutesListViewState extends State<MinutesListView> {
  static const double buttonSpacing = 16;

  static const unit = 5;
  final minutes = List.generate(12, (index) => (index + 1) * unit);
  int _current = unit;

  final _scrollController = ScrollController();

  void _onPressed(int minute) {
    setState(() {
      _current = minute;
    });
    widget.onMinuteSelected(minute);

    final index = minutes.indexOf(minute);
    _scrollController.animateTo(
      (buttonSpacing + widget.buttonWidth) * index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: (MediaQuery.sizeOf(context).width - widget.buttonWidth) / 2,
      ),
      itemCount: minutes.length,
      itemBuilder: (context, index) {
        int minute = minutes[index];
        return MinuteButton(
          width: widget.buttonWidth,
          height: widget.height,
          minute: minute,
          isSelected: minute == _current,
          onPressed: _onPressed,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: buttonSpacing);
      },
    );
  }
}
