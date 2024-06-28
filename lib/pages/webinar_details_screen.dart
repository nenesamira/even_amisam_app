import 'package:flutter/material.dart';
import 'conference_room_page.dart'; // Importez la page de la salle de conférence

class WebinarDetailsScreen extends StatelessWidget {
  final String webinarTitle;
  final String webinarDescription;

  const WebinarDetailsScreen({
    Key? key,
    required this.webinarTitle,
    required this.webinarDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du webinaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              webinarTitle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              webinarDescription,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la salle de conférence au lieu d'une page de quiz hypothétique
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConferenceRoomPage()),
                );
              },
              child: Text('Rejoindre le webinaire'),
            ),
          ],
        ),
      ),
    );
  }
}
