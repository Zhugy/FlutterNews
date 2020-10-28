import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/Mine/mine.dart';
import 'package:flutter_news/fans/fans.dart';
import 'package:flutter_news/home/home.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var _selectIndex = 0;

  var _vcArr = <Widget>[];

  var _bottomItemArr = <BottomNavigationBarItem>[];

  @override
  void initState() {
    super.initState();
    _vcArr = <Widget>[Home(), Fans(), Mine()];
    _bottomItemArr = [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
      BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("发现")),
      BottomNavigationBarItem(
          icon: Icon(Icons.alternate_email), title: Text("我的")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectIndex, children: _vcArr,),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItemArr,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.brown,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectIndex,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}
