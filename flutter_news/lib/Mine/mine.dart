import 'package:flutter/material.dart';

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
      body: Center(child: Text("我的"),),
    );
  }
}