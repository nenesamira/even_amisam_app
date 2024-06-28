import 'package:flutter/material.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class LivestreamScreen extends StatefulWidget {
  const LivestreamScreen({Key? key}) : super(key: key);

  @override
  _LivestreamScreenState createState() => _LivestreamScreenState();
}

class _LivestreamScreenState extends State<LivestreamScreen> {
  late Widget canvasView;
  
  get engine => null;

  @override
  void initState() {
    super.initState();

    // Créer une vue de canvas et démarrer la prévisualisation
    setState(() {
      canvasView = engine.createCanvasView(context);
    });

    ZegoExpressEngine.instance.startPreview(canvas: ZegoCanvas(() as int));
  }

  @override
  void dispose() {
    ZegoExpressEngine.instance.stopPreview();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livestream Screen'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 400,
          child: canvasView,
        ),
      ),
    );
  }
}
