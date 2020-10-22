import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news/models/home_banner.dart';
import 'package:flutter_news/home/depth/depth_service.dart';
import 'package:flutter_news/models/history_today.dart';
import 'package:flutter_news/models/depth_cotent_model.dart';
import '../depth/alert_message.dart';

class HomeDepth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeDepth();
  }
}

class _HomeDepth extends State<HomeDepth> with AutomaticKeepAliveClientMixin {
  double _screenWidth;

  // 轮播图
  Widget _banner(List<HomeBannerModel> bannerArr) {
    var _bannerHeight = 3.0 / 7.0 * (_screenWidth - 25.0);

    return Container(
        height: _bannerHeight + 34.0,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Container(
              height: _bannerHeight,
              padding: EdgeInsets.only(left: 13, right: 13),
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.network(
                    bannerArr[index].coverImage,
                    fit: BoxFit.fill,
                  );
                },
                itemCount: bannerArr.length,
                autoplay: true,
                loop: true,
                viewportFraction: 1,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(bottom: 0)),
              ),
            ),
            Container(margin: EdgeInsets.only(top: 15, left: 13)),
          ],
        ));
  }

  //基础Cell
  Widget _contentListTitle(DepthContentModel model) {
    return Container(
      height: 118,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: Container(
            margin: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    model.title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Color(0xFF191919),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  margin: EdgeInsets.only(top: 20, left: 13, right: 17),
                ),
                Container(
                  margin: EdgeInsets.only(left: 13, bottom: 17, right: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Text(model.sources.first.name,
                            style: TextStyle(
                                color: Color(0xFFb2b2b2),
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                      ),
                      Container(
                        child: Text("${model.wordCount}字",
                            style: TextStyle(
                                color: Color(0xFFb2b2b2),
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
          Container(
            width: 90,
            height: 90,
            margin: EdgeInsets.only(right: 13),
            child: Image.network(
              model.coverImage,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  //消息
  Widget _message(HistoryTodayModel model) {
    return Container(
      height: 83,
      margin: EdgeInsets.only(left: 13, right: 13, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 1,
              color: Colors.grey)
        ],
      ),
      child: Stack(children: <Widget>[
        Center(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                  model.dateInfo.day,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff191919)),
                ),
              ),
              Container(
                width: 4,
                height: 27,
                margin: EdgeInsets.only(left: 15, right: 13),
                color: Colors.grey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    model.dateInfo.monthShort,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7f7f7f)),
                  ),
                  Text(model.dateInfo.year,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff191919)))
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 33, right: 36),
                  child: Text(model.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffb1b1b1))),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(PageRouteBuilder(barrierColor: Colors.white10,opaque: false,  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return HistoryAlert(historyTodayModel: model);
            }));
          },
        ),
      ],)
    );
  }

  void _requestBannerData() async {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    var response =
        await dio.get("https://guokrapp-apis.guokr.com/hawking/v1/slide-shows");
    String content = response.data.toString();
    var arr = homeBannerModelFromJson(content);
    service.addBannerModel(arr);
  }

  void _requestHistoryData() async {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    var response = await dio.get(
        "https://guokrapp-apis.guokr.com/hawking/v1/historical-today?tz_seconds=28800");
    String content = response.data.toString();
    var model = historyTodayModelFromJson(content);
    service.addHistoryTodayModel(model);
  }

  void _requestContentData() async {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    var response = await dio
        .get("https://guokrapp-apis.guokr.com/hawking/v1/articles?limit=20");
    String content = response.data.toString();
    var arr = depthContentModelFromJson(content);
    service.addContentModel(arr);
  }

  DepthService service;

  @override
  void initState() {
    super.initState();
    service = DepthService(update: () {
      setState(() {});
    });
    _requestBannerData();
    _requestHistoryData();
    _requestContentData();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            DepthBaseViewModel model = service.modelArr[index];
            if (model.contentType == DepthContentType.banner) {
              return _banner(model.model);
            } else if (model.contentType == DepthContentType.historyToday) {
              return _message(model.model);
            } else if (model.contentType == DepthContentType.content) {
              return _contentListTitle(model.model);
            } else {
              return Divider();
            }
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
            );
          },
          itemCount: service.modelArr.length),
    );
  }

  // 重写

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;



}
