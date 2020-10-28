import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news/models/news_knowlege_model.dart';
import 'package:flutter_news/Share/share_view.dart';

class NewsKnowledge extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsKnowledge();
  }
}

class _NewsKnowledge extends State<NewsKnowledge> with AutomaticKeepAliveClientMixin {
  Widget _itemCell(NewsKnowledgeModel model) {
    return Container(
      margin: EdgeInsets.only(left: 13, right: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 276,
            child: Image.network(
              model.coverImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child:  Text(
                model.title,
                style: TextStyle(
                    color: Color(0xff191919),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
          ),
          Container(
            margin: EdgeInsets.only(top: 14),
            child: Text(
              model.sources.first.introduction != null ? model.sources.first.introduction : "",
              style: TextStyle(
                  color: Color(0xffb2b2b2),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20,left: 2, right: 2, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: SizedBox(
                      width: 90,
                      child: Text(
                        model.onlineAt.toIso8601String(),
                        maxLines: 1,
                        style:
                            TextStyle(fontSize: 14, color: Color(0xffb2b2b2)),
                      )
                  ),
                ),
                Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: IconButton(icon: Icon(Icons.face), iconSize: 25 ,onPressed: (){
                          print("点击了一个按钮");
                        })
                      ),
                      Container(
                        child: IconButton(
                            icon: Icon(Icons.share),
                            iconSize: 25,
                            onPressed: () {
                             /* Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return ShareView();
                                  }
                                  )
                              );*/

                             showModalBottomSheet(context: context, builder: (BuildContext context) {
                               return ShareView();
                             });
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _requestData() async {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    var response = await dio
        .get("https://guokrapp-apis.guokr.com/hawking/v1/articles?limit=20");
    String content = response.data.toString();
    var arr = newsKnowledgeModelFromJson(content);
    listModel = arr;
    if (mounted) {
      setState(() {
      });
    }
  }

  List<NewsKnowledgeModel> listModel = [];

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _itemCell(listModel[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: listModel.length),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
