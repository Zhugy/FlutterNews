import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
    if (_videoPlayerController != null) {
      if (_videoPlayerController.value.isPlaying) {
        _chewieController.pause();
      }
    }

    _videoPlayerController = VideoPlayerController.network(videoUrl, formatHint: VideoFormat.other,);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16/9,
      autoPlay: true,
      looping: false,
      showControls: false,
      isLive: true,
      fullScreenByDefault: false,
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

