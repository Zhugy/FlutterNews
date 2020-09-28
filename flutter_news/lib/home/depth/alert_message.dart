import 'package:flutter/material.dart';
import 'package:flutter_news/models/history_today.dart';
import 'package:flutter_news/tool/show_image.dart';

class HistoryAlert extends StatefulWidget {

  HistoryAlert({Key key,@required this.historyTodayModel}):super(key: key);
  final HistoryTodayModel historyTodayModel;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HistoryAlert(historyTodayModel: historyTodayModel);
  }
}

class _HistoryAlert extends State<HistoryAlert> {

  _HistoryAlert({@required this.historyTodayModel}):super();
  final HistoryTodayModel historyTodayModel;

  Widget _timeWidget(DateInfo info) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(
            info.day,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color(0xff191919)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 13, right: 13),
          width: 5,
          height: 40,
          color: Color(0xffb2b2b2),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                info.monthShort,
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff7f7f7f),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                info.year,
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff191919),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _contentWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: _timeWidget(historyTodayModel.dateInfo),
            margin: EdgeInsets.only(left: 17, top: 20),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 20),
            width: 170,
            height: 128,
            child: Stack(
              children: <Widget>[
                Image.network(
              historyTodayModel.images.first.image,
              fit: BoxFit.cover,
            ),
                GestureDetector(onTap: (){
                  Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    return ShowImage(imageArr: [historyTodayModel.images.first.image,historyTodayModel.images.first.image,historyTodayModel.images.first.image]);
                  }));
                },),
              ],),
          ),
          Container(
            margin: EdgeInsets.only(left: 17, right: 17, top: 20),
            child: Text(
              historyTodayModel.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff191919)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 17, right: 17, top: 26),
            child: Text(
                historyTodayModel.content,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xff7f7f7f))),
          ),
          Container(
            color: Color(0xff84bf54),
            height: 44,
            width: double.infinity,
            margin: EdgeInsets.only(left: 16, right: 16, top: 36, bottom: 40),
            child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Get", style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Colors.black26,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 300),
            color: Colors.white,
            child: SingleChildScrollView(child: _contentWidget(),scrollDirection: Axis.vertical,),
          )
        ],
      ),
    );
  }
}
