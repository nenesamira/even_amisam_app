import 'package:even_amisam_app/pages/live_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebinarDetailsPage extends StatefulWidget {
  const WebinarDetailsPage({Key? key}) : super(key: key);

  @override
  _WebinarDetailsPageState createState() => _WebinarDetailsPageState();
}

class _WebinarDetailsPageState extends State<WebinarDetailsPage> {
  final TextEditingController _titleController = TextEditingController(text: 'Titre du Webinaire');
  final TextEditingController _descriptionController = TextEditingController(text: 'Description du Webinaire');
  final TextEditingController _dateController = TextEditingController(text: '25 Juillet 2024');
  final TextEditingController _timeController = TextEditingController(text: '14h00 - 16h00');
  final TextEditingController _speakerNameController = TextEditingController(text: 'Nom de l\'Orateur');
  final TextEditingController _speakerBioController = TextEditingController(text: 'Biographie courte de l\'orateur');
  final TextEditingController _agendaController = TextEditingController(text: '1. Introduction\n2. Sujet 1\n3. Sujet 2\n4. Questions et Réponses');
  final TextEditingController _joinInstructionsController = TextEditingController(text: 'Vous recevrez un lien par email pour rejoindre le webinaire.');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du Webinaire Éducatif'),
      ),
      body: Stack(
        children: <Widget>[
          // Image d'arrière-plan
          Positioned.fill(
            child: Image.asset(
              'assets/images/webinar.jpg', // Chemin vers votre image d'arrière-plan
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Contenu principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Texte en blanc pour contraste
                    ),
                    decoration: InputDecoration(
                      hintText: 'Titre du Webinaire',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/webinar.jpg', // Chemin vers votre image de couverture
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _descriptionController,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Description du Webinaire',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today, color: Colors.white),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _dateController,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Date',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_time, color: Colors.white),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _timeController,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Heure',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Orateur(s)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/orateur.jpg'), // Image de l'orateur
                    ),
                    title: TextField(
                      controller: _speakerNameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Nom de l\'Orateur',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                    ),
                    subtitle: TextField(
                      controller: _speakerBioController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Biographie courte de l\'orateur',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Agenda',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _agendaController,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Agenda',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Comment rejoindre le webinaire',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _joinInstructionsController,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Instructions pour rejoindre',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LivePage(isHost: true)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text('Démarrer le Streaming'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
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
