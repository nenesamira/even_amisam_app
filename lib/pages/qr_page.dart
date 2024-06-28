import 'package:flutter/material.dart';
import '../qr_data.dart';

class QrPage extends StatelessWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions/Réponses'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Questions à choix multiples
          for (var i = 0; i < multipleChoiceQuestions.length; i++)
            ListTile(
              title: Text('Question ${i + 1}:\n${multipleChoiceQuestions[i].question}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: multipleChoiceQuestions[i].options
                    .map((option) => Text(option))
                    .toList(),
              ),
            ),

          // Questions Vrai/Faux
          for (var i = 0; i < trueFalseQuestions.length; i++)
            ListTile(
              title: Text('Question ${multipleChoiceQuestions.length + i + 1}:\n${trueFalseQuestions[i].question}'),
              subtitle: Text(trueFalseQuestions[i].correctAnswer ? 'Vrai' : 'Faux'),
            ),
        ],
      ),
    );
  }
}
