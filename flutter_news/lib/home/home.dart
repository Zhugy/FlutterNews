import 'package:flutter/material.dart';
import '../home/depth/depth.dart';
import '../home/news/news_knowledge.dart';
import '../home/video/video_home.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {

  final _tabsName = ["深度","新知", "视频"];
  final _tabControlleArr = [HomeDepth(), NewsKnowledge(), VideoHome()];
  TabController _tabController;

  Widget _tabBar() {
    return TabBar(
        isScrollable: true,
        controller: _tabController,
        labelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          insets: EdgeInsets.only(left: 10,right: 10,bottom: 0),
            borderSide: BorderSide(color: Colors.yellow, width: 2, style: BorderStyle.solid)),
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            fontSize: 16),
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Color(0x33333333),
            fontSize: 14),
        tabs: _tabsName
            .map((e) => Tab(
                  text: e,
                ))
            .toList());
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabsName.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _tabBar(),),
      body: TabBarView(
          controller: _tabController,
          children:_tabControlleArr,
      )
    );
  }
}