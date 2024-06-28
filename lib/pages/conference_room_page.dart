// lib/pages/conference_room_page.dart

import 'package:flutter/material.dart';
import 'quiz_page.dart';
import 'question_answer_page.dart';
import 'survey_page.dart';

class ConferenceRoomPage extends StatelessWidget {
  const ConferenceRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salle de Conférence'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizPage()),
                      );
                    },
                    child: Text('Quiz'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuestionAnswerPage()),
                      );
                    },
                    child: Text('Q/R'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SurveyPage()),
                      );
                    },
                    child: Text('Sondage'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        // Example question and answer
                        ListTile(
                          title: Text("Participant 1: C'est une question ?"),
                          subtitle: Text("Réponse de l'animateur."),
                        ),
                        ListTile(
                          title: Text("Participant 2: Une autre question ?"),
                          subtitle: Text("Réponse de l'animateur."),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Posez votre question...',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          // Logic to send question and display in the list
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
