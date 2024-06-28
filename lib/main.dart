import 'package:even_amisam_app/pages/live_page.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:even_amisam_app/pages/home_page.dart';
import 'package:even_amisam_app/pages/inscription_page.dart';
import 'package:even_amisam_app/pages/connexion_page.dart';
import 'package:even_amisam_app/pages/dashboard_page.dart';
import 'package:even_amisam_app/pages/events_page.dart';
import 'package:even_amisam_app/pages/webinar_details_page.dart';
import 'package:even_amisam_app/pages/conference_details_page.dart';
import 'package:even_amisam_app/pages/mot_de_passe_oublie_page.dart';
import 'package:even_amisam_app/pages/qr_page.dart';
import 'package:even_amisam_app/pages/survey_page.dart';
import 'package:even_amisam_app/pages/conference_room_page.dart';
import 'package:even_amisam_app/pages/livestream_screen.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'package:even_amisam_app/live_page.dart';
import 'package:even_amisam_app/pages/welcome_page.dart';
import 'package:even_amisam_app/pages/add_question_page.dart'; // Importez AddQuestionPage

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'even_amisam_app',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Route initiale (page d'accueil)
      routes: {
        '/': (context) => const WelcomePage(), // Route de la page de bienvenue
        '/home': (context) => const HomePage(), // Route de la page d'accueil
        '/inscription': (context) => const InscriptionPage(),
        '/connexion': (context) => const ConnexionPage(),
        '/dashboard': (context) => DashboardPage(username: 'NomUtilisateur'),
        '/events': (context) => const EventsPage(),
        '/webinarDetails': (context) => const WebinarDetailsPage(),
        '/conferenceDetails': (context) => const ConferenceDetailsPage(),
        '/motdepasseoublie': (context) => const MotDePasseOubliePage(),
        '/qr': (context) => const QrPage(),
        '/survey': (context) => const SurveyPage(),
        '/conferenceRoom': (context) => const ConferenceRoomPage(),
        '/livestream': (context) => const LivestreamScreen(),
        '/live': (context) => const LivePage(isHost: true),
        '/addQuestion': (context) => AddQuestionPage(), // Ajoutez cette ligne pour AddQuestionPage
      },
    );
  }
}
