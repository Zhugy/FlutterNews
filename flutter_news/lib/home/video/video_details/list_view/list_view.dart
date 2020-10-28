import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news/home/video/video_details/list_view/list_item_model.dart';
import 'package:flutter_news/home/video/video_model.dart';


typedef ClickTapActionBlok = void Function(String videoUrl);

class PlayListView extends StatefulWidget {
  final HomeVideo homeVideo;
  final ClickTapActionBlok onClick;

  PlayListView({
    Key key,
    @required this.homeVideo,
    @required this.onClick,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayListView();
  }
}

class _PlayListView extends State<PlayListView> {
  List<DetailsListModel> _listArr = [];
  String _title ;
  String _avatar;
  int _articleCount;
  String _name;

  Widget _titleView() {
    return Container(
        height: 85,
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                _title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              color: Colors.white,
              margin: EdgeInsets.all(0),
              child: IconButton(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                iconSize: 30,
                color: Colors.red,
                icon: Icon(Icons.arrow_upward),
                onPressed: () {
                  print("点击了按钮");
                },
              ),
            )
          ],
        ));
  }

  Widget _authorView() {
    return Container(
      height: 68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Image.network(_avatar),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "频道共收录${_articleCount.toString()}篇内容",
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 12),
            child: FlatButton(
                color: Colors.red, onPressed: () {}, child: Text("订阅")),
          ),
        ],
      ),
    );
  }

  Widget _contenteItemView(DetailsListModel itemModel) {
    return GestureDetector(
        onTap: () {
          widget.onClick(itemModel.videos.first.playUrl);
          _setupData(itemModel);
        },
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  margin: EdgeInsets.only(left: 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          itemModel.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                itemModel.sources.isNotEmpty
                                    ? itemModel.sources.first.name
                                    : "这是空的",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Container(
                              child: Text(
                                itemModel.videos[0].duration.toString() ?? "",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 90,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      itemModel.coverImage,
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.play_circle_fill),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _requestData() async {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    var response = await dio.request(
        "https://guokrapp-apis.guokr.com/hawking/v1/recommend/videos?limit=20&page=1&video_id=${widget.homeVideo.id.toString()}");
    String content = response.data.toString();
    List<DetailsListModel> dataArr = detailsListModelFromJson(content);
    _listArr.addAll(dataArr);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _title = widget.homeVideo.title;
    _name = widget.homeVideo.sources.isNotEmpty ? widget.homeVideo.sources.first.name : "";
    _avatar = widget.homeVideo.sources.isNotEmpty ? widget.homeVideo.sources.first.avatar : "";
    _articleCount = widget.homeVideo.sources.first.articleCount;

    _listArr = [DetailsListModel(), DetailsListModel()];
    _requestData();
  }

  void _setupData(DetailsListModel model) {
    _title = model.title;
    _name = model.sources.first.name;
    _avatar = model.sources.isNotEmpty ? model.sources.first.avatar : "";
    _articleCount = model.sources.first.articleCount;

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            DetailsListModel model = _listArr[index];
            if (index == 0) {
              return _titleView();
            }
            if (index == 1) {
              return _authorView();
            }
            return _contenteItemView(model);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
            );
          },
          itemCount: _listArr.length),
    );
  }
}
