import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Événements'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sélectionner un événement',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Exemple de navigation vers une autre page après un événement
                Navigator.pushNamed(context, '/webinarDetails');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Couleur du texte en blanc
              ),
              child: const Text('Webinaire Éducatif'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Exemple de navigation vers une autre page après un événement
                Navigator.pushNamed(context, '/conferenceDetails');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Couleur du texte en blanc
              ),
              child: const Text('Conférence professionnelle'),
            ),
          ],
        ),
      ),
    );
  }
}
