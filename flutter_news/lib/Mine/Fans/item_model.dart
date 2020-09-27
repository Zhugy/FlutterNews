import 'package:sprintf/sprintf.dart';

class FansItemModel {
  var no = 0;
  var avatarPic = "";
  var nickname = "";
  var currentRoomFanCardLevel = 1;
  var integral = 0;
  var username = "";

  String integralShort() {
    if (this.integral > 10000) {
      return sprintf("%.1f万", [this.integral/10000.0]);
    } else {
      return this.integral.toString();
    }
  }

}