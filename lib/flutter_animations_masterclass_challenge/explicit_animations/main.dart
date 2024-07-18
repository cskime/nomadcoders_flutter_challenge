import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/explicit_animations/flickered_box.dart';

void main() => runApp(const ExplicitAnimationsApp());

class ExplicitAnimationsApp extends StatefulWidget {
  const ExplicitAnimationsApp({super.key});

  @override
  State<ExplicitAnimationsApp> createState() => ExplicitAnimationsAppState();
}

class ExplicitAnimationsAppState extends State<ExplicitAnimationsApp>
    with TickerProviderStateMixin {
  late final _animationControllers = List.generate(
    25,
    (index) => AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 700),
    ),
  );

  @override
  void initState() {
    super.initState();
    _startAnimations();
  }

  void _startAnimations() async {
    for (int index = 0; index < 25; index++) {
      final portion = index ~/ 5;
      final forwards = portion.isOdd;
      final mid = portion * 5 + 2;
      final offset = forwards ? (mid - index) * 2 : 0;
      final targetIndex = 24 - index - offset;

      final animationController = _animationControllers[targetIndex];
      animationController.forward();
      animationController.addStatusListener(
        (status) => _statusListener(status, animationController),
      );
      await Future.delayed(const Duration(milliseconds: 30));
    }
  }

  void _statusListener(AnimationStatus status, AnimationController controller) {
    switch (status) {
      case AnimationStatus.completed:
        controller.reverse();
      case AnimationStatus.dismissed:
        controller.forward();
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const padding = EdgeInsets.all(24);
    final length = ((size.width - padding.horizontal) / 9).roundToDouble();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Explicit Animations"),
        ),
        body: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: Colors.black,
            padding: padding,
            child: Wrap(
              spacing: length,
              runSpacing: length,
              children: List.generate(
                25,
                (index) => FlickeredBox(
                  animationController: _animationControllers[index],
                  width: length,
                  height: length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
