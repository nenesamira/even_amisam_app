import 'package:flutter/material.dart';

class MotDePasseOubliePage extends StatelessWidget {
  const MotDePasseOubliePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublié'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Entrez votre adresse email pour réinitialiser votre mot de passe',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique pour envoyer un email de réinitialisation
              },
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}
