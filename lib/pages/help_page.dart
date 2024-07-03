import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  int _selectedOption = 0;
  List<String> _answers = []; // Liste pour stocker les réponses des utilisateurs
  TextEditingController _answerController = TextEditingController();

  void _onOptionSelected(int index) {
    setState(() {
      _selectedOption = index;
    });
  }

  void _onSubmitAnswer() {
    String answer = _answerController.text.trim();
    if (answer.isNotEmpty) {
      setState(() {
        _answers.add(answer);
        _answerController.clear();
      });
    }
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions / Réponses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildOptionButton('Ouvrir', 0),
                _buildOptionButton('Résolu', 1),
                _buildOptionButton('Rejeté', 2),
              ],
            ),
            if (_selectedOption == 0) _buildOpenQuestionSection(),
            // Add other sections if needed for Resolved and Rejected options
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _answers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_answers[index]),
                  subtitle: Text('Participant ${index + 1}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String title, int index) {
    return Expanded(
      child: TextButton(
        onPressed: () => _onOptionSelected(index),
        child: Text(
          title,
          style: TextStyle(
            color: _selectedOption == index ? Colors.blue : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildOpenQuestionSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question: Comment avez-vous trouvé le webinaire?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _answerController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Tapez votre réponse ici...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _onSubmitAnswer,
            child: Text('Envoyer'),
          ),
        ],
      ),
    );
  }
}
