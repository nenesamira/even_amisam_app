// lib/models/question.dart

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

class TrueFalseQuestion {
  final String question;
  final bool correctAnswer;

  TrueFalseQuestion({
    required this.question,
    required this.correctAnswer,
  });
}

class ShortAnswerQuestion {
  final String question;
  final String correctAnswer;

  ShortAnswerQuestion({
    required this.question,
    required this.correctAnswer,
  });
}

class MatchingQuestion {
  final String question;
  final Map<String, String> pairs;

  MatchingQuestion({
    required this.question,
    required this.pairs,
  });
}

class LogicQuestion {
  final String question;
  final String correctAnswer;

  LogicQuestion({
    required this.question,
    required this.correctAnswer,
  });
}
