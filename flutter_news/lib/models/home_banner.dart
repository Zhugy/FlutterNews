// To parse this JSON data, do
//
//     final homeBannerModel = homeBannerModelFromJson(jsonString);

import 'dart:convert';

List<HomeBannerModel> homeBannerModelFromJson(String str) =>
    List<HomeBannerModel>.from(
        json.decode(str).map((x) => HomeBannerModel.fromJson(x)));

String homeBannerModelToJson(List<HomeBannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeBannerModel {
  HomeBannerModel({
    this.coverImage,
    this.id,
    this.linkedId,
    this.linkedTitle,
    this.linkedType,
    this.position,
  });

  String coverImage;
  int id;
  String linkedId;
  String linkedTitle;
  String linkedType;
  int position;

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) =>
      HomeBannerModel(
        coverImage: json["cover_image"],
        id: json["id"],
        linkedId: json["linked_id"],
        linkedTitle: json["linked_title"],
        linkedType: json["linked_type"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "cover_image": coverImage,
        "id": id,
        "linked_id": linkedId,
        "linked_title": linkedTitle,
        "linked_type": linkedType,
        "position": position,
      };
}
