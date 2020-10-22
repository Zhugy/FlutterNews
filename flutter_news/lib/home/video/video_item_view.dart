import 'package:flutter/material.dart';
import '../video/video_model.dart';


typedef ClickPlayerButtonBuilder = void Function(HomeVideo videoItem);
typedef VoidCallback = void Function();

// 播放按钮
Widget _playBtn(VoidCallback clickBlock) {
  return SizedBox(
    width: 56,
    height: 56,
    child: FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: clickBlock,
      color: Colors.white,
      highlightColor: Colors.cyan,
      child: Icon(
        Icons.play_circle_outline,
        size: 56,
      ),
    ),
  );
}

// 个性标签
List<Widget> _markflagView(HomeVideo itemVideo) {
  Widget _itemView(String name) {
    return Container(
      padding: EdgeInsets.only(bottom: 8, right: 8),
      child: Container(
        padding: EdgeInsets.all(5),
        height: 35,
        color: Colors.black87,
        child: Center(child: Text(
          name,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),)
      ),
    );
  }

  List<Widget> _listArr = [];

  if (itemVideo.videoArtificialTag != null) {
      if (itemVideo.videoArtificialTag.length > 0) {
        _listArr.add(_itemView(itemVideo.videoArtificialTag));
      }
  }
  if (itemVideo.videos[0].duration.toString().length > 0) {
    _listArr.add(_itemView(itemVideo.videos[0].duration.toString()));
  }
  return _listArr;
}


Widget videoItemView(HomeVideo itemVideo, ClickPlayerButtonBuilder clickBuilder) {
  return Container(
    height: 261,
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 14),
          height: 183,
          child: Stack(
            alignment: Alignment(1, 1),
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 183,
                      width: double.infinity,
                      child: Image.network(
                      itemVideo.coverImage,fit: BoxFit.fitWidth,),
                    ),
                    _playBtn(() {
                      clickBuilder(itemVideo);
                    })
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                // height: 28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _markflagView(itemVideo)
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 6),
          color: Colors.white,
          child: Text(
            itemVideo.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
  );
}
