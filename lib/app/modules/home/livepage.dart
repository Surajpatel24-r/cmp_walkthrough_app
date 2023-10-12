import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LiveVideoPopup extends StatelessWidget {
  final String videoUrl; // The URL of the live video

  LiveVideoPopup({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Video'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(videoUrl)),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture: false,
          ),
        ),
      ),
    );
  }
}
