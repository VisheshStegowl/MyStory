import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoWidget extends StatefulWidget {
  final String videoUrl;

  const MyVideoWidget({
    super.key,
    required this.videoUrl,
  });

  @override
  State<MyVideoWidget> createState() => _MyVideoWidgetState();
}

class _MyVideoWidgetState extends State<MyVideoWidget> {
  late VideoPlayerController _videoController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    Future.wait([
      _videoController.initialize().then((_) {
        setState(() {
          _videoController.setLooping(true);
          _videoController.setVolume(0);
          _videoController.play();
        });
      })
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_videoController);
  }
}
