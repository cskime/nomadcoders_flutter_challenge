import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/flashcards/models/flashcard_model.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/flashcards/widgets/flashcard.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/flashcards/widgets/progress_bar_painter.dart';

void main() => runApp(const FlashcardApp());

class FlashcardApp extends StatefulWidget {
  const FlashcardApp({super.key});

  @override
  State<FlashcardApp> createState() => _FlashcardAppState();
}

class _FlashcardAppState extends State<FlashcardApp>
    with TickerProviderStateMixin {
  // Flip Animations
  late final _flipController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  double get _flipRotationAngle => _flipController.value * pi;
  double get _flipOpacity => cos(_flipController.value * pi).clamp(0, 1);
  Color? get _flipColor => Color.lerp(
        Colors.white,
        Colors.grey.shade800,
        sin(_flipController.value * pi),
      );

  void _onFlashcardTap() {
    _flipping = true;
    _flipController.forward().whenComplete(() {
      _flipController.value = 0;
      _flipped = !_flipped;
      _flipping = false;
    });
  }

  bool _flipped = false;
  bool _flipping = false;

  // Drag Animations

  late final screenSize = MediaQuery.sizeOf(context);
  late final _dragController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
    lowerBound: -screenSize.width,
    upperBound: screenSize.width,
    value: 0,
  );
  Offset get _dragOffset => Offset(_dragController.value, 0);
  double get _dragRotationAngle =>
      Tween<double>(
        begin: -15,
        end: 15,
      ).transform(
        (_dragController.value / 2 + screenSize.width / 2) / screenSize.width,
      ) *
      pi /
      180;
  double get _dragScale => Tween<double>(
        begin: 0.8,
        end: 1,
      ).transform(_dragController.value.abs() / screenSize.width).clamp(0.8, 1);

  late final _dragDirectionController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );

  Color? get _dragLeftColor => ColorTween(
        begin: const Color(0xFF40CAFE),
        end: const Color(0xFFFF7952),
      ).transform(_dragDirectionController.value);
  Color? get _dragRightColor => ColorTween(
        begin: const Color(0xFF40CAFE),
        end: const Color(0xFF71DD7A),
      ).transform(_dragDirectionController.value);
  double get _dragOpacity => Tween<double>(
        begin: 0,
        end: 1,
      ).transform(_dragDirectionController.value);

  bool _draggingLeft = false;

  String get _draggingText =>
      _draggingLeft ? "Need to review" : "I got it right";

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _dragController.value += details.delta.dx;
    _dragDirectionController.value = _dragController.value.abs() / 50;
    _draggingLeft = _dragController.value.isNegative;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final boundary = screenSize.width / 2;
    final shouldDismiss = _dragController.value.abs() >= boundary;

    if (!shouldDismiss) {
      _animateTo(0);
      return;
    }

    final goLeft = _dragController.value.isNegative;
    double target = screenSize.width * (goLeft ? -1 : 1);

    _animateTo(target);
  }

  void _animateTo(double target) {
    _dragController.animateTo(target, curve: Curves.easeOut).whenComplete(() {
      if (target == 0) {
        return;
      }

      _dragController.value = 0;
      setState(() {
        _index = _nextIndex;
        _flipped = false;
      });
    });

    _dragDirectionController.animateTo(0);
  }

  int _index = 0;
  int get _nextIndex => (_index + 1) % flashcardModels.length;

  double get _progress => (_index + 1) / flashcardModels.length;

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final cardSize = Size(
      screenSize.width * 0.9,
      screenSize.height * 0.5,
    );

    return MaterialApp(
      home: AnimatedBuilder(
        animation: _dragDirectionController,
        builder: (context, child) => Scaffold(
          backgroundColor: _draggingLeft ? _dragLeftColor : _dragRightColor,
          body: SafeArea(
            child: AnimatedBuilder(
              animation: _flipController,
              builder: (context, child) => AnimatedBuilder(
                animation: _dragController,
                builder: (context, child) => Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Opacity(
                          opacity: _dragOpacity,
                          child: Text(
                            _draggingText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: cardSize.height,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (!_flipping)
                            Positioned(
                              child: Transform.scale(
                                scale: _dragScale,
                                child: Flashcard(
                                  model: flashcardModels[_nextIndex],
                                  size: cardSize,
                                  backgroundColor: _flipColor,
                                  opacity: _flipOpacity,
                                  flipped: false,
                                  onTap: _onFlashcardTap,
                                ),
                              ),
                            ),
                          Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(_flipRotationAngle),
                            origin: Offset(
                              cardSize.width / 2,
                              cardSize.height / 2,
                            ),
                            child: GestureDetector(
                              onHorizontalDragUpdate: _onHorizontalDragUpdate,
                              onHorizontalDragEnd: _onHorizontalDragEnd,
                              child: Transform.translate(
                                offset: _dragOffset,
                                child: Transform.rotate(
                                  angle: _dragRotationAngle,
                                  child: Flashcard(
                                    model: flashcardModels[_index],
                                    size: cardSize,
                                    backgroundColor: _flipColor,
                                    opacity: _flipOpacity,
                                    flipped: _flipped,
                                    onTap: _onFlashcardTap,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CustomPaint(
                      painter: ProgressBarPainter(progress: _progress),
                      size: Size(screenSize.width, 48),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
