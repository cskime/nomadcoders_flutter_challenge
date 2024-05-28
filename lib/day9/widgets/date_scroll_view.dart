import 'package:flutter/material.dart';

class DateScrollView extends StatelessWidget {
  const DateScrollView({super.key});

  static const double _scrollItemHeight = 36;
  static const TextStyle _scrollItemTextStyle = TextStyle(
    fontSize: _scrollItemHeight,
    height: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MONDAY 16',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: _scrollItemHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 17,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Text(
                  'TODAY',
                  style: _scrollItemTextStyle.copyWith(
                    color: Colors.white,
                  ),
                );
              }

              if (index == 1) {
                return Text(
                  '·',
                  style: _scrollItemTextStyle.copyWith(
                    color: const Color(0xFFB22581),
                    fontWeight: FontWeight.w900,
                  ),
                );
              }

              return Text(
                '${index + 15}',
                style: _scrollItemTextStyle.copyWith(color: Colors.grey),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: index < 2 ? 6 : 16);
            },
          ),
        ),
      ],
    );
  }
}
