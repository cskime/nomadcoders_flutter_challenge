import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/features/chart/widgets/section/header_text.dart';

class SegmentedHeaderText extends StatefulWidget {
  const SegmentedHeaderText({
    super.key,
    required this.texts,
    required this.onSegmentSelected,
  });

  final List<String> texts;
  final void Function(int index) onSegmentSelected;

  @override
  State<SegmentedHeaderText> createState() => _SegmentedHeaderTextState();
}

class _SegmentedHeaderTextState extends State<SegmentedHeaderText> {
  final _duration = const Duration(milliseconds: 250);
  var _currentIndex = 0;

  void _onTap(int index) {
    widget.onSegmentSelected(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final segmentTexts = widget.texts.indexed
        .map<Widget>(
          (element) => AnimatedOpacity(
            opacity: _currentIndex == element.$1 ? 1 : 0.3,
            duration: _duration,
            child: HeaderText(
              element.$2,
              onTap: () => _onTap(element.$1),
            ),
          ),
        )
        .toList();

    final children = [segmentTexts.first];
    for (var index = 0; index < segmentTexts.length - 1; index++) {
      children.addAll([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            color: Colors.grey.shade300,
            width: 1,
            height: 12,
          ),
        ),
        segmentTexts[index + 1],
      ]);
    }

    return Row(children: children);
  }
}
