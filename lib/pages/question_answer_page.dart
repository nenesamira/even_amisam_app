import 'package:flutter/material.dart';

class QuestionAnswerPage extends StatefulWidget {
  const QuestionAnswerPage({Key? key}) : super(key: key);

  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  TextEditingController questionController = TextEditingController();
  List<String> questions = [];

  void askQuestion() {
    String question = questionController.text;
    if (question.isNotEmpty) {
      setState(() {
        questions.add(question);
      });
      questionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question & Réponse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(
                hintText: 'Posez votre question ici...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: askQuestion,
                ),
              ),
              onSubmitted: (value) => askQuestion(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('Question ${index + 1}:'),
                      subtitle: Text(questions[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
