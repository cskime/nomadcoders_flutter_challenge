import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({super.key});

  void _onTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: GestureDetector(
          onTap: () => _onTap(context),
          behavior: HitTestBehavior.opaque,
          child: const Row(
            children: [
              FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.white,
                size: 16,
              ),
              SizedBox(width: 24),
              Text(
                'Back to list',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
