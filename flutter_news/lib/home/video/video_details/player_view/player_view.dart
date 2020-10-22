import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class PlayerView extends StatefulWidget {

  final String videoUrlStr;
  final double height;

  PlayerView({
    Key key,
    @required this.videoUrlStr,
    @required this.height,
  }): assert(videoUrlStr != null);
  @override
  State<StatefulWidget> createState() {
    return _PlayerView();
  }
}

class _PlayerView extends State<PlayerView> {

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrlStr);
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 3/2,
        autoPlay: true,
        looping: true
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Chewie(controller: _chewieController,),
    );
  }
}

class Player {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  static Player _player;
  static Player defaultPlayer() {
    if (_player == null) {
      _player = Player();
    }
    return _player;
  }

  void _initState(String videoUrl) {
    // dispose();
    _videoPlayerController = VideoPlayerController.network(videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16.0/9.0,
      autoPlay: true,
      looping: false,
      showControls: true,
      placeholder: new Container(
        color: Colors.grey,
      ),
      autoInitialize: !true,
    );
  }

  Widget createPlayerView(String videoUrl) {

    _initState(videoUrl);
    return Chewie(controller: _chewieController);
  }

  void dispose() {
    if (_videoPlayerController != null) {
      _videoPlayerController.dispose();
    }

    if (_chewieController != null) {
      _chewieController.dispose();
    }
  }

}

