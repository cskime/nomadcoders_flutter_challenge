class FlashcardModel {
  FlashcardModel({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;
}

final flashcardModels = [
  FlashcardModel(
    question: "Who created Helvetica",
    answer: "Max Miedinger with Eduard Hoffmann",
  ),
  FlashcardModel(
    question: "Who created iPhone",
    answer: "Steeve Jobs",
  ),
  FlashcardModel(
    question: "Who created Dart/Flutter",
    answer: "Google",
  ),
  FlashcardModel(
    question: "Who created SwiftUI",
    answer: "Apple",
  ),
];
