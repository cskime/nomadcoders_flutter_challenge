import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/graduation/models/chart_option.dart';

class ChartAllOptionBar extends StatefulWidget {
  const ChartAllOptionBar({
    super.key,
    required this.options,
    required this.initialChartOption,
    required this.onOptionSelected,
  });

  final List<ChartOption> options;
  final ChartOption initialChartOption;
  final void Function(ChartOption option) onOptionSelected;

  @override
  State<ChartAllOptionBar> createState() => _ChartAllOptionBarState();
}

class _ChartAllOptionBarState extends State<ChartAllOptionBar> {
  late var _currentOption = widget.initialChartOption;

  void _onTabPressed(ChartOption option) {
    setState(() {
      _currentOption = option;
      widget.onOptionSelected(option);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          bottom: null,
          child: Divider(height: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.black, fontSize: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.options
                  .map<Widget>(
                    (element) => _OptionButton(
                      option: element,
                      onPressed: () => _onTabPressed(element),
                      selected: _currentOption == element,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _OptionButton extends StatefulWidget {
  const _OptionButton({
    required this.option,
    required this.onPressed,
    required this.selected,
  });

  final ChartOption option;
  final void Function() onPressed;
  final bool selected;

  @override
  State<_OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<_OptionButton> {
  var _selected = false;

  void _onTapDown(TapDownDetails details) => setState(() {
        _selected = true;
      });

  void _onTapUp(TapUpDetails details) => setState(() {
        _selected = false;
      });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Opacity(
            opacity: _selected ? 0.5 : 1,
            child: Text(
              widget.option.title,
              style: TextStyle(
                fontWeight:
                    widget.selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
