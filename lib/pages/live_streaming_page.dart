import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LivestreamingPage extends StatelessWidget {
  get b9c45d4f2deb3c1e051be075b0145ba0454164150a2d46dbd3fef9031a8bd1ae => null;

  @override
  Widget build(BuildContext context) {
    // Remplacez par la logique appropriée pour générer ou récupérer les valeurs
    String roomID = '1234567890'; // Remplacez par l'ID de la salle réel
    String userID = 'user123';    // Remplacez par l'ID de l'utilisateur actuel
    String userName = 'JohnDoe';  // Remplacez par le nom de l'utilisateur actuel
    String liveID = '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Livestreaming Page'),
      ),
      body: ZegoUIKitPrebuiltLiveStreaming(
        appID: 830260810, // Remplacez par votre App ID
        appSign: b9c45d4f2deb3c1e051be075b0145ba0454164150a2d46dbd3fef9031a8bd1ae, // Remplacez par votre App Sign
        userID: userID,
        userName: userName,
        liveID: roomID,
        config: ZegoUIKitPrebuiltLiveStreamingConfig.host(),  // Utilisez host() ou audience() en fonction du rôle
      ),
    );
  }
}
