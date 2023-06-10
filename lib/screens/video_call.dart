import 'package:flutter/material.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bit.png"))),
        )
      ],
    ));
  }
}
