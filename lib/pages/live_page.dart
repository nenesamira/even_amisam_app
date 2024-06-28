import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LivePage extends StatefulWidget {
  final bool isHost;

  const LivePage({Key? key, required this.isHost}) : super(key: key);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> with WidgetsBindingObserver {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _initializeCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    print('Initializing camera...');
    try {
      await _checkPermissions();

      cameras = await availableCameras();
      print('Available cameras: $cameras');
      if (cameras != null && cameras!.isNotEmpty) {
        _cameraController = CameraController(
          cameras![0],
          ResolutionPreset.high,
        );

        _cameraController?.addListener(() {
          if (mounted) {
            setState(() {});
          }
        });

        try {
          await _cameraController?.initialize();
          setState(() {
            _isCameraInitialized = true;
          });
          print('Camera initialized.');
        } catch (e) {
          print('Error initializing camera: $e');
        }
      } else {
        print('No cameras available.');
      }
    } catch (e) {
      print('Error initializing camera and permissions: $e');
    }
  }

  Future<void> _checkPermissions() async {
    var cameraStatus = await Permission.camera.status;
    var microphoneStatus = await Permission.microphone.status;

    if (!cameraStatus.isGranted || !microphoneStatus.isGranted) {
      var status = await [Permission.camera, Permission.microphone].request();
      if (status[Permission.camera] != PermissionStatus.granted ||
          status[Permission.microphone] != PermissionStatus.granted) {
        print('Permissions not granted.');
        throw Exception('Permissions not granted.');
      }
    }
    print('Permissions granted.');
  }

  @override
  Widget build(BuildContext context) {
    // Remplacez avec vos valeurs réelles
    int appID = 830260810; // Votre Zego appID
    String appSign = 'b9c45d4f2deb3c1e051be075b0145ba0454164150a2d46dbd3fef9031a8bd1ae'; // Votre Zego appSign
    String roomID = '1234567890'; // Remplacez par votre ID de salle réel
    String userID = 'user123'; // Remplacez par votre ID utilisateur réel
    String userName = 'JohnDoe'; // Remplacez par votre nom d'utilisateur réel

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Page'),
      ),
      body: Stack(
        children: [
          if (_isCameraInitialized && _cameraController != null)
            CameraPreview(_cameraController!),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(FontAwesomeIcons.questionCircle), // Icône de quiz
              onPressed: () {
                // Action à effectuer lors du clic sur le bouton de quiz
                print('Quiz button pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                // Action à effectuer lors du clic sur le bouton de chat Q&R
                print('Chat button pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.poll),
              onPressed: () {
                // Action à effectuer lors du clic sur le bouton de sondage
                print('Poll button pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
