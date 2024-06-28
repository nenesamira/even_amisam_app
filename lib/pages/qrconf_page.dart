// pages/qr_page.dart

import 'package:flutter/material.dart';

class QrPage extends StatelessWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions/Réponses'),
      ),
      body: Center(
        child: const Text(
          'Bienvenue à la session Questions/Réponses!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
