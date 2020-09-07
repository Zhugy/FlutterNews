import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news/models/news_knowlege_model.dart';

class NewsKnowledge extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsKnowledge();
  }
}

class _NewsKnowledge extends State<NewsKnowledge> {
  Widget _itemCell(NewsKnowledgeModel model) {
    return Container(
      margin: EdgeInsets.only(left: 13, right: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 276,
            child: Image.network(
              model.coverImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 45, left: 25, right: 25),
            child:  Text(
                model.title,
                style: TextStyle(
                    color: Color(0xff191919),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
          ),
          Container(
            margin: EdgeInsets.only(top: 34, left: 25, right: 25),
            child: Text(
              model.description,
              style: TextStyle(
                  color: Color(0xffb2b2b2),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50,left: 25, right: 25, bottom: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(model.onlineAt.toIso8601String(), style: TextStyle(fontSize: 14,color: Color(0xffb2b2b2)),),
                ),
                Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(Icons.face,size: 25,),
                      ),
                      Container(
                        child: Icon(Icons.share,size: 25,),
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
    setState(() {
    });
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
}
