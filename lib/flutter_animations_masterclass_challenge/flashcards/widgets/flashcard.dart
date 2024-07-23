import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/flashcards/models/flashcard_model.dart';

class Flashcard extends StatelessWidget {
  const Flashcard({
    super.key,
    required this.model,
    required this.size,
    this.backgroundColor,
    required this.opacity,
    required this.flipped,
    this.onTap,
  });

  final FlashcardModel model;
  final Size size;
  final Color? backgroundColor;
  final double opacity;
  final bool flipped;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Opacity(
            opacity: opacity,
            child: Text(
              flipped ? model.answer : model.question,
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
