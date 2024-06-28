import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddQuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une Question'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: AddQuestionForm(), // Utilisez un widget de formulaire pour ajouter une question
      ),
    );
  }
}

class AddQuestionForm extends StatefulWidget {
  @override
  _AddQuestionFormState createState() => _AddQuestionFormState();
}

class _AddQuestionFormState extends State<AddQuestionForm> {
  final TextEditingController _questionController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  void _addQuestion() {
    String question = _questionController.text.trim();
    if (question.isNotEmpty) {
      addQuestion(question); // Appel à la fonction pour ajouter la question à Firestore
      Navigator.pop(context); // Retour à l'écran précédent après ajout
    } else {
      // Affichez un message d'erreur si le champ est vide
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez entrer une question')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: _questionController,
          decoration: InputDecoration(labelText: 'Entrez votre question'),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: _addQuestion,
          child: Text('Ajouter la Question'),
        ),
      ],
    );
  }
}

void addQuestion(String question) {
  FirebaseFirestore.instance.collection('questions').add({
    'question': question,
    'timestamp': FieldValue.serverTimestamp(),
  });
}
