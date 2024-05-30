import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/day11/widgets/minute/minute_button.dart';

class MinutesListView extends StatefulWidget {
  const MinutesListView({
    super.key,
    required this.height,
    required this.onMinuteSelected,
  });

  static const double _buttonAspectRatio = 1.5;
  double get _buttonWidth => height * _buttonAspectRatio;

  final double height;
  final void Function(int minute) onMinuteSelected;

  @override
  State<MinutesListView> createState() => _MinutesListViewState();
}

class _MinutesListViewState extends State<MinutesListView> {
  static const double _buttonSpacing = 16;
  static const _unit = 5;
  final _minutes = List.generate(12, (index) => (index + 1) * _unit);
  int _current = _unit;

  final _scrollController = ScrollController();

  void _onPressed(int minute) {
    setState(() {
      _current = minute;
    });
    widget.onMinuteSelected(minute);

    final index = _minutes.indexOf(minute);
    _scrollController.animateTo(
      (_buttonSpacing + widget._buttonWidth) * index,
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
        horizontal:
            (MediaQuery.sizeOf(context).width - widget._buttonWidth) / 2,
      ),
      itemCount: _minutes.length,
      itemBuilder: (context, index) {
        int minute = _minutes[index];
        return MinuteButton(
          width: widget._buttonWidth,
          height: widget.height,
          minute: minute,
          isSelected: minute == _current,
          onPressed: _onPressed,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: _buttonSpacing);
      },
    );
  }
}
