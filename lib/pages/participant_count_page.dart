import 'package:flutter/material.dart';

class ParticipantCountPage extends StatelessWidget {
  final int participantCount;

  const ParticipantCountPage({Key? key, required this.participantCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre de Participants'),
      ),
      body: Center(
        child: Text(
          'Nombre de participants : $participantCount',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
