// lib/models/multiple_choice_question.dart

class MultipleChoiceQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;

  MultipleChoiceQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}
