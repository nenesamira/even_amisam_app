// qr_data.dart

import 'models/multiple_choice_question.dart';
import 'models/true_false_question.dart';

List<MultipleChoiceQuestion> multipleChoiceQuestions = [
  MultipleChoiceQuestion(
    question: '1. Quelle fonctionnalité permet aux participants de poser des questions à l\'animateur en temps réel ?',
    options: ['A) Chat en direct', 'B) Q/R (Questions/Réponses)', 'C) Forum', 'D) E-mail'],
    correctAnswer: 'B',
  ),
  MultipleChoiceQuestion(
    question: '2. Quelle technologie serait la plus appropriée pour garantir des mises à jour en temps réel dans une application mobile ?',
    options: ['A) WebSocket', 'B) AJAX', 'C) HTTP', 'D) FTP'],
    correctAnswer: 'A',
  ),
  MultipleChoiceQuestion(
    question: '3. Quel avantage principal offre une fonctionnalité de quiz en direct lors d\'un événement ?',
    options: ['A) Réduire le coût de l\'événement', 'B) Augmenter l\'interaction et l\'engagement des participants', 'C) Simplifier l\'organisation de l\'événement', 'D) Limiter l\'accès à l\'événement'],
    correctAnswer: 'B',
  ),
];

List<TrueFalseQuestion> trueFalseQuestions = [
  TrueFalseQuestion(
    question: '4. L\'utilisation des notifications push est essentielle pour informer les participants des mises à jour en temps réel pendant l\'événement.',
    correctAnswer: true,
  ),
  TrueFalseQuestion(
    question: '5. Les fonctionnalités de notation et de feedback permettent aux participants d\'évaluer l\'animateur et le contenu en temps réel.',
    correctAnswer: true,
  ),
];
