import 'package:flutter/material.dart';
import 'package:even_amisam_app/pages/chat_page.dart';
import 'package:even_amisam_app/pages/chatwebinaire_page.dart';
import 'package:even_amisam_app/pages/poll_page.dart';
import 'package:even_amisam_app/pages/help_page.dart';
import 'package:even_amisam_app/pages/participant_count_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

class ConferenceLivePage extends StatefulWidget {
  final bool isHost;

  const ConferenceLivePage({Key? key, required this.isHost}) : super(key: key);

  @override
  _ConferenceLivePageState createState() => _ConferenceLivePageState();
}

class _ConferenceLivePageState extends State<ConferenceLivePage> with WidgetsBindingObserver {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;
  int _participantCount = 0;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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

  void _openDrawer(String title, Widget page) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return page;
      },
    );
  }

  void _navigateToParticipantCountPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ParticipantCountPage(participantCount: _participantCount),
      ),
    );
  }

  void _toggleRecording() async {
    if (_isRecording) {
      await _stopRecording();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      setState(() {
        _isRecording = true;
      });
      try {
        await _cameraController!.startVideoRecording();
      } catch (e) {
        print('Error starting recording: $e');
        setState(() {
          _isRecording = false;
        });
      }
    }
  }

  Future<void> _stopRecording() async {
    if (_cameraController != null && _cameraController!.value.isRecordingVideo) {
      try {
        XFile videoFile = await _cameraController!.stopVideoRecording();
        setState(() {
          _isRecording = false;
        });
        _showSaveDialog(videoFile);
      } catch (e) {
        print('Error stopping recording: $e');
      }
    }
  }

  void _showSaveDialog(XFile videoFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Recording'),
          content: Text('Would you like to save the recording locally or in the cloud?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _saveRecording(videoFile, saveToCloud: false);
              },
              child: Text('Local'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _saveRecording(videoFile, saveToCloud: true);
              },
              child: Text('Cloud'),
            ),
          ],
        );
      },
    );
  }

  void _saveRecording(XFile videoFile, {required bool saveToCloud}) async {
    if (saveToCloud) {
      // Implémenter la logique pour sauvegarder dans le cloud
      print('Saving to cloud...');
    } else {
      // Implémenter la logique pour sauvegarder localement
      print('Saving locally...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conférence en Direct'),
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
              icon: Icon(Icons.chat),
              onPressed: () {
                _openDrawer('Chat Q&R', ChatPage());
              },
            ),
            IconButton(
              icon: Icon(Icons.poll),
              onPressed: () {
                _openDrawer('Sondage sur la conférence', PollPage());
              },
            ),
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                _openDrawer('Help', HelpPage());
              },
            ),
            IconButton(
              icon: Icon(Icons.people),
              onPressed: _navigateToParticipantCountPage,
            ),
            SizedBox(width: 4),
            Text(_participantCount.toString()),
            IconButton(
              icon: Icon(_isRecording ? Icons.stop : Icons.videocam),
              onPressed: _toggleRecording,
              color: _isRecording ? Colors.red : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
