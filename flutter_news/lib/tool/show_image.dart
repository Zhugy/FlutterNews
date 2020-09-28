import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
  ShowImage({Key key, @required this.imageArr}) : super(key: key);
  final List<String> imageArr;

  @override
  State<StatefulWidget> createState() {
    return _ShowImage(imageArr: imageArr);
  }
}

class _ShowImage extends State<ShowImage> {
  _ShowImage({Key key, @required this.imageArr});

  final List<String> imageArr;
  PageController _pageController;
  int _selectIndex = 0;

  double _top = 0.0;

  double _left = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(
                  left: _left,
                  top: _top,
                  child: GestureDetector(
                    onPanUpdate: (e) {
                      print(e.delta.dx.toString() + "----\n---" + e.delta.dy.toString());
                      setState(() {
                        _left = _left + e.delta.dx;
                        _top = _top + e.delta.dy;
                      });
                    },
                    child: Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                    ),
                  ))
            ],
          );
        },
        itemCount: imageArr.length,
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        pageSnapping: true,
      ),
    );
  }
}
