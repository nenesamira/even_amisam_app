import 'package:flutter/material.dart';
import 'poll_result_page.dart'; // Assurez-vous d'importer la page de résultats du sondage

class SharedPollPage extends StatelessWidget {
  final int numberOfVoters;

  SharedPollPage({required this.numberOfVoters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sondage Partagé'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre de participants ayant voté : $numberOfVoters',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Retour à la page précédente
              },
              child: Text('Arrêter le partage'),
            ),
          ],
        ),
      ),
    );
  }
}
