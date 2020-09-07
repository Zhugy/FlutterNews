// To parse this JSON data, do
//
//     final historyTodayModel = historyTodayModelFromJson(jsonString);

import 'dart:convert';

HistoryTodayModel historyTodayModelFromJson(String str) => HistoryTodayModel.fromJson(json.decode(str));

String historyTodayModelToJson(HistoryTodayModel data) => json.encode(data.toJson());

class HistoryTodayModel {
  HistoryTodayModel({
    this.content,
    this.dateInfo,
    this.images,
    this.relatedArticle,
    this.title,
  });

  String content;
  DateInfo dateInfo;
  List<ImageModel> images;
  RelatedArticle relatedArticle;
  String title;

  factory HistoryTodayModel.fromJson(Map<String, dynamic> json) => HistoryTodayModel(
    content: json["content"],
    dateInfo: DateInfo.fromJson(json["date_info"]),
    images: List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
    relatedArticle: RelatedArticle.fromJson(json["related_article"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "date_info": dateInfo.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "related_article": relatedArticle.toJson(),
    "title": title,
  };
}

class DateInfo {
  DateInfo({
    this.day,
    this.month,
    this.monthShort,
    this.year,
  });

  String day;
  String month;
  String monthShort;
  String year;

  factory DateInfo.fromJson(Map<String, dynamic> json) => DateInfo(
    day: json["day"],
    month: json["month"],
    monthShort: json["month_short"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "month": month,
    "month_short": monthShort,
    "year": year,
  };
}

class ImageModel {
  ImageModel({
    this.image,
  });

  String image;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}

class RelatedArticle {
  RelatedArticle();

  factory RelatedArticle.fromJson(Map<String, dynamic> json) => RelatedArticle(
  );

  Map<String, dynamic> toJson() => {
  };
}
