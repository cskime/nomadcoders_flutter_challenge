import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';

class InterestDetailItem extends StatelessWidget {
  const InterestDetailItem({
    super.key,
    required this.interest,
    required this.selected,
    required this.onSelected,
  });

  final String interest;
  final bool selected;
  final void Function(String interest) onSelected;

  void _onTap() {
    onSelected(interest);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Palette.primary : Colors.white,
          border: Border.all(
              color: selected ? Palette.primary : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Text(
          interest,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
