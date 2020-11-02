import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class ExampleVideo extends StatefulWidget {
  final String streamUrl;
  ExampleVideo({Key key, this.streamUrl}) : super(key: key);

  @override
  _ExampleVideoState createState() => _ExampleVideoState();
}

class _ExampleVideoState extends State<ExampleVideo> {
  VlcPlayerController controller;
  int playerWidth = 640;
  int playerHeight = 360;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new VlcPlayerController(onInit: () {
      controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: playerHeight.toDouble(),
            width: playerWidth.toDouble(),
            child: new VlcPlayer(
              aspectRatio: 16 / 9,
              url: widget.streamUrl,
              controller: controller,
              placeholder: Center(child: CircularProgressIndicator()),
            )));
  }
}
