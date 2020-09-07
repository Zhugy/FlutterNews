import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../models/fans_home.dart';

class Fans extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Fans();
  }
}

class _Fans extends State<Fans> with AutomaticKeepAliveClientMixin {
  var _screenWidth = 1.0;
  var _fansModel = FansHome();
  var _showMoreData = false;

  Widget _firstSectionWidget() {
    // itemView
    Widget _itemWidget(SourcesItem item) {
      return Container(
        color: Color(0xf7f7f7f7),
        margin: EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 0, top: 0),
                width: 60,
                height: 60,
                child: ClipOval(
                  child: Image.network(item.avatar),
                )),
            Container(
              margin: EdgeInsets.only(top: 14),
              child: Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            )
          ],
        ),
      );
    }

    double _contentHeight() {
      var _count = 4;
      if (!_showMoreData) {
        _count = 8;
      }
      return ((_screenWidth - 56.0) / 4) * (100.0 / 70.0) * (_fansModel.sources.length/_count);
    }
    List <Widget> _sourceArr(){
      return _fansModel.sources.map((e) => _itemWidget(e)).toList();
    }

    return Container(
      height: _contentHeight(),
      color: Color(0xf7f7f7f7),
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.only(left: 28, right: 28),
      child: GridView.count(
        controller: ScrollController(),
        crossAxisCount: 4,
        scrollDirection: Axis.vertical,
        childAspectRatio: 70.0 / 100.0,
        physics: NeverScrollableScrollPhysics(),
        children: _sourceArr(),
      ),
    );
  }

  Widget _firstSectionBottomWidth() {
    return Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.only(top: 2),
        color: Color(0xf7f7f7f7),
        child: FlatButton(
              onPressed: () {
                setState(() {
                  _showMoreData = !_showMoreData;
                });
              },
            // splashColor: Colors.transparent,
            // highlightColor: Colors.transparent,
              child: Text(
                _showMoreData ? "展开8个频道" : "展开更多8个频道",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0x74747474)),
              )),
        );
  }

  Widget _otherHeadWidth() {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(top: 33, left: 14),
      color: Colors.white,
      child: Text(
        "学科分类",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xb2b2b2b2)),
      ),
    );
  }

  Widget _otherSectionWidget() {
    var _contentHeight = ((_screenWidth - 36.0) / 2) * (130.0 / 340.0);

    // itemView
    Widget _itemWidget(TagsItem item) {
      return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(offset: Offset(5, 0), color: Colors.white)
              ]),
          margin: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 5),
                    child: Text(
                      item.name,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      "收录${item.articleCount}篇",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: Color(0xdadadada)),
                    ),
                  ),
                ],
              ),
              Container(
                width: 85,
                height: _contentHeight,
                child: Image.network(
                    item.avatar),
              )
            ],
          ));
    }

    List <Widget> _itemArr() {
      return _fansModel.tags.map((e) => _itemWidget(e)).toList();
    }

    return Container(
      height: (_contentHeight + 16)* _fansModel.tags.length/2,
      color: Colors.white,
      margin: EdgeInsets.only(top: 22),
      padding: EdgeInsets.only(left: 12, right: 12),
      child: GridView.count(
        controller: ScrollController(),
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 340.0 / 130.0,
        physics: NeverScrollableScrollPhysics(),
        children: _itemArr(),
      ),
    );
  }


  void _requestData() async {
        Dio dio = Dio();
        dio.options.responseType = ResponseType.plain;
        var response = await dio.get("https://guokrapp-apis.guokr.com/hawking/v1/catalogues?limit=40&page=1");
        String content = response.data.toString();
        Map  dict = json.decode(content);
        FansHome model = FansHome.fromJson(dict);
        _fansModel = model;
        setState(() {
        });
  }

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("社区"),
        ),
        body: Container(
          margin: EdgeInsets.all(0),
          color: Colors.white,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return _firstSectionWidget();
              } else if (index == 1) {
                return _firstSectionBottomWidth();
              } else if (index == 2) {
                return _otherHeadWidth();
              } else {
                return _otherSectionWidget();
              }
            },
            itemCount: _fansModel.sources != null ? 4 : 0,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 33),
          ),
        ));
  }
}
