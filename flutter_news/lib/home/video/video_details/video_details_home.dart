import 'package:flutter/material.dart';
import 'package:flutter_news/home/video/video_model.dart';
import '../video_details/player_view/player_view.dart';
import 'package:flutter_news/home/video/video_details/list_view/list_view.dart';

class VideoDetailsHome extends StatefulWidget {
  VideoDetailsHome({Key key, @required this.videoUrl})
      : assert(videoUrl != null);
  final String videoUrl;

  @override
  State<StatefulWidget> createState() {
    return _VideoDetailsHome();
  }
}

class _VideoDetailsHome extends State<VideoDetailsHome> {
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    Player.defaultPlayer().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("播放器"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Player.defaultPlayer().createPlayerView(widget.videoUrl),
            Expanded(child: Container(child: PlayListView(),)),
          ],
        ),
      ),
    );
  }
}
