import 'package:flutter/material.dart';
import 'poll_result_page.dart'; // Assurez-vous que ce chemin est correct
import 'edit_poll_dialog.dart'; // Importez la boîte de dialogue

class PollPage extends StatefulWidget {
  @override
  _PollPageState createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  bool _allowVoting = false;
  bool _voteOpened = false;
  String _question = 'Comment avez-vous trouvé le webinaire ?';
  List<String> _options = ['Très bien', 'Bien', 'Moyen', 'Mauvais'];

  void _toggleVoting(bool? value) {
    setState(() {
      _allowVoting = value ?? false;
    });
  }

  void _startVoting() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PollResultPage()),
    );
  }

  void _editPoll() async {
    var result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return EditPollDialog(
          question: _question,
          options: _options,
        );
      },
    );

    if (result != null) {
      setState(() {
        _question = result['question'];
        _options = List<String>.from(result['options']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sondage'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _editPoll,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Sondage 1 : Sondage démonstration',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '1. $_question',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _options.map((option) {
                  return Row(
                    children: [
                      Radio(value: _options.indexOf(option) + 1, groupValue: 0, onChanged: (_) {}),
                      Text(option),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _allowVoting,
                    onChanged: _toggleVoting,
                  ),
                  Text('Autoriser les participants à voter'),
                  Spacer(),
                  ElevatedButton(
                    onPressed: _startVoting,
                    child: Text('Ouvrir le vote'),
                  ),
                ],
              ),
              if (_voteOpened) ...[
                SizedBox(height: 20),
                Text(
                  'Sondage en cours',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  '1. $_question',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _options.map((option) {
                    return Row(
                      children: [
                        Radio(value: _options.indexOf(option) + 1, groupValue: 0, onChanged: (_) {}),
                        Text(option),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  'Les participants peuvent maintenant voter.',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
