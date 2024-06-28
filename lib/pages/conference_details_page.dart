import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:even_amisam_app/pages/quiz_page.dart';
import 'package:even_amisam_app/pages/qr_page.dart'; // Importez la page Q/R
import 'package:even_amisam_app/pages/survey_page.dart'; // Importez la page du sondage

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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchURL('https://meet.google.com/your-meeting-link');  // Remplacez par votre lien Google Meet
              },
              child: const Text('Rejoindre la Conférence'),
            ),
            const SizedBox(height: 20), // Ajoutez un espace entre les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()), // Naviguer vers la page du quiz
                );
              },
              child: const Text('Quiz'),
            ),
            const SizedBox(height: 20), // Ajoutez un espace entre les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QrPage()), // Naviguer vers la page Q/R
                );
              },
              child: const Text('Q/R'),
            ),
            const SizedBox(height: 20), // Ajoutez un espace entre les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SurveyPage()), // Naviguer vers la page du sondage
                );
              },
              child: const Text('Sondage'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
