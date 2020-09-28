import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Offset offset; //位置
  final Color widgetColor; //颜色
  const DraggableWidget({Key key, this.offset, this.widgetColor}):super(key:key);

  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0,0.0);
  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top:offset.dy,
      child: Draggable( //拖拽组件
        data:widget.widgetColor,
        child:Container(
          width: 100.0,
          height:100.0,
          color: widget.widgetColor,
        ),
        feedback:Container( //feedback：拖动控件时子元素的样子
          width: 100.0,
          height:100.0,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled:(Velocity velocity,Offset offset){  //松手的时候
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}