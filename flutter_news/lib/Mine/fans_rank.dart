import 'package:flutter/material.dart';
import '../Mine/Fans/item_model.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

class FansRank extends StatefulWidget {
  @override
  createState() => _FansRank();
}

class _FansRank extends State <FansRank> {

  var itemArr  = [];

  void initState() {
    super.initState();

    var headArr = <FansItemModel>[];

    for (int index = 1; index < 200; index++) {
      var item = FansItemModel();
      item.no = index;
      item.avatarPic = "";
      item.nickname = WordPair.random().asPascalCase;
      item.currentRoomFanCardLevel = Random().nextInt(29) + 1;
      item.integral = Random().nextInt(900000);

      if (index < 4) {
         headArr.add(item);
         continue;
      } else if (index == 4) {
        itemArr.add(headArr);
      }
      itemArr.add(item);
    }
  }

  Widget _mark_iton(int lvCount) {
    if (lvCount < 1) lvCount = 1;
    if (lvCount > 30) lvCount = 30;

    var bgImage = "bg1-10.png";
    if (lvCount >= 1 && lvCount <= 10) {
      bgImage = "bg1-10.png";
    } else if (lvCount >= 11 && lvCount <= 20) {
      bgImage = "bg11-20.png";
    } else {
      bgImage = "bg21-30.png";
    }

    return Container(
      width: 45,
      height: 16,
      child: Stack(
        alignment: Alignment(-1, 0),
        overflow: Overflow.visible,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Container(
            width: 45,
            height: 14,
            padding: EdgeInsets.only(left: 13),
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  width: 36,
                  height: 14,
                  child: Image.asset("images/lv/$bgImage"),
                ),
                Text("皮球",style: TextStyle(color: Colors.white, fontSize: 10),)
              ],
            ),
          ),
          Container(
            width: 19,
            height: 16,
            child: Image.asset("images/lv/aplive_fans_Lv$lvCount.png"),)

        ],
      ),
    );
  }

  Column _headItem(Size headSize, Size size, double top, String fileName, FansItemModel item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height+top,
          padding: EdgeInsets.only(top: top),
          child: Stack(
            alignment: Alignment(0, 0),
            children: <Widget>[
              Container(
                width: headSize.width,
                height: headSize.height,
                padding: EdgeInsets.all(0),
                child: ClipOval(child: Image.asset('images/girlHead.jpg'),),
              ),
              Container(
                width: size.width,
                height: size.height,
                child: Image.asset("images/$fileName"),
              ),

            ],

          ),
        ),
        Text(item.nickname,style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.bold),),
        Text(item.integralShort(),style: TextStyle(color: Colors.white,fontSize: 12),),
        _mark_iton(item.currentRoomFanCardLevel),
      ],
    );
  }

  Row _headView(List itemArr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _headItem(Size(52, 52), Size(80, 80), 29.0 ,"aplive_fans_rank_2.png", itemArr[0]),
        _headItem(Size(72, 72), Size(112, 112), 0.0,"aplive_fans_rank_1.png", itemArr[1]),
        _headItem(Size(52, 52), Size(80, 80), 29.0,"aplive_fans_rank_3.png", itemArr[2])
      ],);
  }

  Widget _subCell(FansItemModel item) {
    Widget _leftRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(padding: EdgeInsets.only(left: 20,right: 11), child:  Text(item.no.toString(), style: TextStyle(color: Colors.white,fontSize: 12),),),
        Container(width: 34, height: 34,child: ClipOval(child: Image.asset('images/girlHead.jpg'),)),
        Container(padding: EdgeInsets.only(left: 10),child: Text(item.nickname, style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.bold)),),
        Container(padding: EdgeInsets.only(left: 6), child: _mark_iton(item.currentRoomFanCardLevel),)
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _leftRow,
        Container(padding: EdgeInsets.only(right: 20),child: Text(item.integralShort(), style: TextStyle(color: Colors.white,fontSize: 12)),)
      ],
    );
  }

  ListView _listView() {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          Object item = itemArr[index];
          if (item is FansItemModel) {
            return Container(
              child: _subCell(item),
              color: Color.fromRGBO(34, 34, 34, 1),
              height: 55,
              padding: EdgeInsets.only(top: 10),
            );
          }

          return Container(
              child: _headView(item),
              color: Color.fromRGBO(34, 34, 34, 1)
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 0,);

        },
        itemCount: itemArr.length);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("粉丝榜"),
        ),
        backgroundColor: Color.fromRGBO(34, 34, 34, 1),
        body: _listView(),
      );
  }
}