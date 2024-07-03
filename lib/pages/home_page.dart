import 'package:flutter/material.dart';
import 'package:even_amisam_app/pages/inscription_page.dart';
import 'package:even_amisam_app/pages/connexion_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AmiSam',
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
      ),
      body: Stack(
        children: [
          // Image d'arrière-plan
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/4.jpg'), // Chemin vers votre image d'arrière-plan
                fit: BoxFit.cover, // Utilisation de BoxFit.cover pour remplir l'espace disponible
              ),
            ),
          ),
          // Boutons en bas de l'écran
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inscription');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Inscription', style: TextStyle(fontSize: 18)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/connexion');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Se connecter', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
