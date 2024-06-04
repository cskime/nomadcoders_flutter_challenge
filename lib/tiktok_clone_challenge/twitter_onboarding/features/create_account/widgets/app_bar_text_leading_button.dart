import 'package:flutter/material.dart';

class AppBarLeadingTextButton extends StatelessWidget {
  const AppBarLeadingTextButton({
    super.key,
    required this.text,
  });

  final String text;

  static double fitWidth({required String text}) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: _textStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return painter.size.width + 22;
  }

  static const _textStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  void _onTap(BuildContext context) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: _textStyle,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
