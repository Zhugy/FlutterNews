import 'package:flutter/material.dart';

class PlayListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlayListView();
  }
}

class _PlayListView extends State<PlayListView> {
  get onPressed => null;

  Widget _titleView() {
    return Container(
      height: 85,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          "啥都不吃金黄色的",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
          IconButton(icon: Icon(Icons.arrow_upward), onPressed: (){

          },),

          ],)
    );
  }

  Widget _authorView() {
    return Container(
      height: 68,
      child: Row(
        children: [
          Container(
            child: Image.network(
                "https://guokrapp-static.guokr.com/FrAgqNynqHiPGcBJNXgVIJG4Tspz"),
          ),
          Container(
            child: Column(
              children: [
                Text("大魔术师"),
                Text("频道共收录1200篇内容"),
              ],
            ),
          ),
          Container(
            child: FlatButton(onPressed: () {}, child: Text("订阅")),
          ),
        ],
      ),
    );
  }

  Widget _contenteItemView() {
    return Container(
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Text("教你怎么欺负五颜六色的软萌水宝宝"),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Text("教你"),
                      ),
                      Container(
                        child: Text("00`11"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  "https://guokrapp-static.guokr.com/4SGhqEYOAGV8CJkIbzaQcMp7vhdSsyTNeICaeIrNV-ThrB8f-OpXipzcGruI8bRCUQFl-EuBrzx-rMdD815TEYI-kL6BvqmLZ1hRLNRQkPU=.jpg",
                  height: 90,
                  width: 90,
                ),
                SizedBox(
                  width: 45,
                  height: 45,
                  child: Icon(Icons.play_circle_fill),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _titleView();
            }
            if (index == 1) {
              return _authorView();
            }
            return _contenteItemView();
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
            );
          },
          itemCount: 10),
    );
  }
}
