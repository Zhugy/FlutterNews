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
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: 30,
              height: 30,
              color: Colors.white,
              margin: EdgeInsets.all(0),
              child: IconButton(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                iconSize: 30,
                color: Colors.red,
                icon: Icon(Icons.arrow_upward),
                onPressed: () {
                  print("点击了按钮");
                },
              ),
            )
          ],
        ));
  }

  Widget _authorView() {
    return Container(
      height: 68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Image.network(
                    "https://guokrapp-static.guokr.com/FrAgqNynqHiPGcBJNXgVIJG4Tspz"),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "大魔术师",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "频道共收录1200篇内容",
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 12),
            child: FlatButton(
                color: Colors.red, onPressed: () {}, child: Text("订阅")),
          ),
        ],
      ),
    );
  }

  Widget _contenteItemView() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 90,
              margin: EdgeInsets.only(left: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "教你怎么欺负五颜六色的市的从软萌水宝宝",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "教你",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          child: Text(
                            "00`11",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            height: 90,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  "https://guokrapp-static.guokr.com/4SGhqEYOAGV8CJkIbzaQcMp7vhdSsyTNeICaeIrNV-ThrB8f-OpXipzcGruI8bRCUQFl-EuBrzx-rMdD815TEYI-kL6BvqmLZ1hRLNRQkPU=.jpg",
                  height: 90,
                  width: 90,
                  fit: BoxFit.fitHeight,
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
