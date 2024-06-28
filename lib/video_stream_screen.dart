import 'package:flutter/material.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class LivestreamScreen extends StatefulWidget {
  @override
  _LivestreamScreenState createState() => _LivestreamScreenState();
}

class _LivestreamScreenState extends State<LivestreamScreen> {
  late int streamID;

  @override
  void initState() {
    super.initState();
    streamID = DateTime.now().millisecondsSinceEpoch;
    startLivestream();
  }

  void startLivestream() {
    ZegoExpressEngine.instance.startPublishingStream('stream_$streamID');
  }

  void stopLivestream() {
    ZegoExpressEngine.instance.stopPublishingStream();
  }

  @override
  void dispose() {
    stopLivestream();
    ZegoExpressEngine.destroyEngine();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livestream'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.black,
            ),
            ElevatedButton(
              onPressed: stopLivestream,
              child: Text('Stop Livestream'),
            ),
          ],
        ),
      ),
    );
  }
}
