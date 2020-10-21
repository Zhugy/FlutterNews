import 'package:flutter/material.dart';
import '../video/video_item_view.dart';
import '../video/video_model.dart';
import 'package:dio/dio.dart';
import '../video/video_details/video_details_home.dart';


class VideoHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoHome();
  }
}

class _VideoHome extends State<VideoHome> with AutomaticKeepAliveClientMixin {

  List<HomeVideo> _dataArr = [];

  void _requestVideoList() async {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    var response = await dio.request("https://guokrapp-apis.guokr.com/hawking/v1/articles?limit=20&page_type=video_page");
    String content = response.data.toString();
    _dataArr = homeVideoFromJson(content);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _requestVideoList();
  }
  
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return videoItemView(_dataArr[index], (HomeVideo videoItem) {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return VideoDetailsHome(videoUrl: videoItem.videos[0].playUrl,);
              }));
              print(videoItem.title);
            });
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1,);
          },
          itemCount: _dataArr.length),
    );
  }

  @override
  bool get wantKeepAlive => true;

}