import 'package:flutter/material.dart';

class ShareView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShareView();
  }
}

// class _ShareView extends State<ShareView> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         drawerEnableOpenDragGesture: true,
//         endDrawerEnableOpenDragGesture: true,
//         backgroundColor: Colors.black12,
//         body: GestureDetector(
//           onTap: () {
//             print("object");
//             Navigator.of(context).pop();
//           },
//           child: BottomSheet(onClosing: (){}, builder: (BuildContext context) {
//             return SizedBox(height: 100, child: Container(color: Colors.red,),);
//           })
//         ));
//   }
// }



enum ShareType {
  QQ,
  Wechar,
  Copy,
  More,
}

class _ShareView extends State<ShareView> {



  Widget _itemIcon(ShareType type){
    IconData _icon;
    String _name;
    switch (type) {
      case ShareType.QQ:
        _icon = Icons.insert_chart_outlined;
        _name = "微信好友";
        break;
      case ShareType.Wechar:
        _icon = Icons.star_half;
        _name = "朋友圈";
        break;
      case ShareType.Copy:
        _icon = Icons.copy;
        _name = "复制链接";
        break;
      case ShareType.More:
        _icon = Icons.more_horiz;
        _name = "更多";
        break;
    }

    return Container(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Icon(_icon,size: 40,),
          ),
          Container(child: Text(_name),)
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _itemIcon(ShareType.QQ),
                _itemIcon(ShareType.Wechar),
                _itemIcon(ShareType.Copy),
                _itemIcon(ShareType.More),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: FlatButton(
              child: Text("取消"),
              minWidth: double.infinity,
              color: Colors.black12,
              height: 35,
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }
}