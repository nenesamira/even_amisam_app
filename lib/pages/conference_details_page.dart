import 'package:flutter/material.dart';
import 'package:even_amisam_app/pages/conference_live_page.dart'; // Importez la nouvelle page ConferenceLivePage

class ConferenceDetailsPage extends StatelessWidget {
  const ConferenceDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la Conférence Professionnelle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Informations sur la conférence',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20), // Ajoutez un espace entre le texte et le contenu suivant
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConferenceLivePage(isHost: true), // Exemple : en tant qu'hôte
                  ),
                );
              },
              child: const Text('Démarrer la Conférence en Direct'),
            ),
          ],
        ),
      ),
    );
  }
}
