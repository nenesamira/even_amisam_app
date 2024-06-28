// pages/survey_page.dart

import 'package:flutter/material.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sondage'),
      ),
      body: Center(
        child: const Text(
          'Bienvenue au sondage!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
