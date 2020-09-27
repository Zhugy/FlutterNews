import 'package:flutter/material.dart';
import '../Mine/fans_rank.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Mine();
  }
}

class _Mine extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("我的"),),
      body: Center(child: ListView.separated(
          itemBuilder: (context, index) {
            return Divider();
          },
          separatorBuilder: (context, index){
            return ListTile(title: Text("排行榜单"),onTap: (){
              Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                return FansRank();
              }));
            },);
          },
          itemCount: 10),
      ),
    );
  }
}