import 'package:flutter/material.dart';

class PollResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultats du Sondage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sondage en cours',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '1. Comment avez-vous trouvé le webinaire ?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(value: 1, groupValue: 0, onChanged: null),
                    Text('Très bien'),
                    Spacer(),
                    Text('50%'), // Exemple de pourcentage
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 2, groupValue: 0, onChanged: null),
                    Text('Bien'),
                    Spacer(),
                    Text('30%'), // Exemple de pourcentage
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 3, groupValue: 0, onChanged: null),
                    Text('Moyen'),
                    Spacer(),
                    Text('15%'), // Exemple de pourcentage
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 4, groupValue: 0, onChanged: null),
                    Text('Mauvais'),
                    Spacer(),
                    Text('5%'), // Exemple de pourcentage
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Nombre de participants ayant voté : 100', // Exemple de nombre de participants
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
