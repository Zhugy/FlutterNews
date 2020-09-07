import 'package:flutter/cupertino.dart';
import 'package:flutter_news/models/home_banner.dart';
import 'package:flutter_news/models/history_today.dart';
import 'package:flutter_news/models/depth_cotent_model.dart';

enum DepthContentType {
  banner,
  historyToday,
  content,
}

typedef DepthUpdataHandle = void Function();


class DepthService {
  DepthService({Key key, this.update});

  final DepthUpdataHandle update;

  var modelArr = [];

  DepthBaseViewModel _bannerModel;
  DepthBaseViewModel _historyModel;
  List<DepthBaseViewModel> _contentArr;

  void addBannerModel(List<HomeBannerModel> bannerArr) {
    DepthBaseViewModel model = DepthBaseViewModel(contentType: DepthContentType.banner,model: bannerArr);
    _bannerModel = model;
    appendModel();
  }

  void addHistoryTodayModel(HistoryTodayModel hisoryModel) {
    DepthBaseViewModel model = DepthBaseViewModel(contentType: DepthContentType.historyToday,model: hisoryModel);
    _historyModel = model;
    appendModel();
  }

  void addContentModel(List<DepthContentModel> contentModel) {
    var arr = <DepthBaseViewModel>[];
    contentModel.forEach((itemModel) {
      var model = DepthBaseViewModel(contentType: DepthContentType.content, model: itemModel);
      arr.add(model);
    });
    _contentArr = arr;
    appendModel();
  }

  void appendModel() {
    modelArr = [];
    if (_bannerModel != null) {
      modelArr.add(_bannerModel);
    }
    if (_historyModel != null) {
      modelArr.add(_historyModel);
    }
    if (_contentArr != null) {
      modelArr.addAll(_contentArr);
    }
    update();
  }

}


class DepthBaseViewModel {
  DepthBaseViewModel({Key key, @required this.contentType, @required this.model});
  DepthContentType contentType;
  Object model;
}
