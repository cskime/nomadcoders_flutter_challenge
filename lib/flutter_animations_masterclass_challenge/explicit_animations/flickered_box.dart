import 'package:flutter/widgets.dart';

const _onColor = Color(0xFFFF002B);
const _offColor = Color(0xFF1A0000);

class FlickeredBox extends StatefulWidget {
  const FlickeredBox({
    super.key,
    required this.animationController,
    required this.width,
    required this.height,
  });

  final AnimationController animationController;
  final double width;
  final double height;

  @override
  State<FlickeredBox> createState() => _FlickeredBoxState();
}

class _FlickeredBoxState extends State<FlickeredBox> {
  late final _animation = CurvedAnimation(
    parent: widget.animationController,
    curve: FlikingCurve(),
    reverseCurve: Curves.easeInCirc,
  );

  late final _decoration = DecorationTween(
    begin: const BoxDecoration(color: _offColor),
    end: const BoxDecoration(color: _onColor),
  ).animate(_animation);

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      decoration: _decoration,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}

class FlikingCurve extends Curve {
  @override
  double transformInternal(double t) {
    if (t < 0.03) {
      return 1;
    }

    if (t >= 0.06 && t < 0.09) {
      return 0;
    }

    return 1;
  }
}
