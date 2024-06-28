import 'package:flutter/material.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({Key? key}) : super(key: key);

  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _motDePasseController = TextEditingController();
  TextEditingController _confirmationMotDePasseController = TextEditingController();

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _motDePasseController.dispose();
    _confirmationMotDePasseController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Envoyer les données du formulaire (enregistrement, etc.)
      // Par exemple, afficher les valeurs dans la console
      print('Nom: ${_nomController.text}');
      print('Prénom: ${_prenomController.text}');
      print('Email: ${_emailController.text}');
      print('Mot de passe: ${_motDePasseController.text}');
      // Réinitialiser les champs après validation
      _nomController.clear();
      _prenomController.clear();
      _emailController.clear();
      _motDePasseController.clear();
      _confirmationMotDePasseController.clear();

      // Naviguer vers la page de succès après l'inscription
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultatInscription()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'S\'enregistrer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber, // Texte en or clair
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Créer votre compte',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: _nomController,
                        decoration: InputDecoration(labelText: 'Nom'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre nom';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _prenomController,
                        decoration: InputDecoration(labelText: 'Prénom'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre prénom';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre email';
                          }
                          // Ajoutez une validation d'email plus avancée si nécessaire
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _motDePasseController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Mot de passe'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre mot de passe';
                          }
                          // Ajoutez des validations supplémentaires si nécessaire (longueur, complexité, etc.)
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _confirmationMotDePasseController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Confirmer le mot de passe'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez confirmer votre mot de passe';
                          }
                          if (value != _motDePasseController.text) {
                            return 'Les mots de passe ne correspondent pas';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('S\'inscrire'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.blue, // Texte en blanc
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(child: Text('Ou')),
                      SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {
                          // Handle Google sign-in
                        },
                        child: Text('Se connecter avec Google'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.amber, side: BorderSide(color: Colors.amber),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/connexion');
                },
                child: Text('Vous avez déjà un compte ? Connectez-vous', style: TextStyle(color: Colors.purple)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultatInscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription réussie'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            Text(
              'Inscription réussie!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page de connexion après l'inscription réussie
                Navigator.pushNamed(context, '/connexion');
              },
              child: Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}
