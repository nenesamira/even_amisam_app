import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Événements'),
      ),
      body: Stack(
        children: <Widget>[
          // Image d'arrière-plan
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/events.jpg'), // Chemin vers votre image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Contenu principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Ne manquez pas cet événemen!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white, // Texte en blanc pour être visible sur l'image
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Exemple de navigation vers une autre page après un événement
                    Navigator.pushNamed(context, '/webinarDetails');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 5,
                  ),
                  child: const Text('Rejoindre'),
                ),
                const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //     // Exemple de navigation vers une autre page après un événement
                //     Navigator.pushNamed(context, '/conferenceDetails');
                //   },
                //   style: ElevatedButton.styleFrom(
                //     foregroundColor: Colors.white,
                //     backgroundColor: Colors.blue,
                //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30.0),
                //     ),
                //     shadowColor: Colors.black,
                //     elevation: 5,
                //   ),
                //   child: const Text('Conférence professionnelle'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
