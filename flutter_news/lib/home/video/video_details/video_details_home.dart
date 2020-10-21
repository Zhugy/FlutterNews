import 'package:flutter/material.dart';
import 'package:flutter_news/home/video/video_model.dart';


class VideoDetailsHome extends StatefulWidget {
  VideoDetailsHome({Key key, @required  this.videoUrl}) : assert(videoUrl != null);
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
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("视频播放叶"),),
      body: Text(widget.videoUrl),);
  }

}