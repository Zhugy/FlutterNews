// To parse this JSON data, do
//
//     final detailsListModel = detailsListModelFromJson(jsonString);

import 'dart:convert';

List<DetailsListModel> detailsListModelFromJson(String str) => List<DetailsListModel>.from(json.decode(str).map((x) => DetailsListModel.fromJson(x)));

String detailsListModelToJson(List<DetailsListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailsListModel {
  DetailsListModel({
    this.articleType,
    this.artificialTag,
    this.coverImage,
    this.coverStatus,
    this.createdAt,
    this.id,
    this.onlineAt,
    this.publishedAt,
    this.sources,
    this.title,
    this.unionAt,
    this.updatedAt,
    this.videoArtificialTag,
    this.videos,
    this.wordCount,
  });

  ArticleType articleType;
  ArtificialTag artificialTag;
  String coverImage;
  int coverStatus;
  DateTime createdAt;
  int id;
  DateTime onlineAt;
  DateTime publishedAt;
  List<Source> sources;
  String title;
  DateTime unionAt;
  DateTime updatedAt;
  dynamic videoArtificialTag;
  List<Video> videos;
  int wordCount;

  factory DetailsListModel.fromJson(Map<String, dynamic> json) => DetailsListModel(
    articleType: articleTypeValues.map[json["article_type"]],
    artificialTag: artificialTagValues.map[json["artificial_tag"]],
    coverImage: json["cover_image"],
    coverStatus: json["cover_status"],
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    onlineAt: DateTime.parse(json["online_at"]),
    publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
    sources: List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
    title: json["title"],
    unionAt: DateTime.parse(json["union_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    videoArtificialTag: json["video_artificial_tag"],
    videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
    wordCount: json["word_count"] == null ? null : json["word_count"],
  );

  Map<String, dynamic> toJson() => {
    "article_type": articleTypeValues.reverse[articleType],
    "artificial_tag": artificialTagValues.reverse[artificialTag],
    "cover_image": coverImage,
    "cover_status": coverStatus,
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "online_at": onlineAt.toIso8601String(),
    "published_at": publishedAt == null ? null : publishedAt.toIso8601String(),
    "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
    "title": title,
    "union_at": unionAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "video_artificial_tag": videoArtificialTag,
    "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
    "word_count": wordCount == null ? null : wordCount,
  };
}

enum ArticleType { VIDEO }

final articleTypeValues = EnumValues({
  "video": ArticleType.VIDEO
});

enum ArtificialTag { EMPTY, ARTIFICIAL_TAG }

final artificialTagValues = EnumValues({
  "用户吐梦君投稿": ArtificialTag.ARTIFICIAL_TAG,
  "": ArtificialTag.EMPTY
});

class Source {
  Source({
    this.articleCount,
    this.avatar,
    this.id,
    this.introduction,
    this.isSubscribed,
    this.isThirdParty,
    this.name,
    this.newsArticleCount,
    this.videoArticleCount,
    this.withRecommendations,
  });

  int articleCount;
  String avatar;
  int id;
  String introduction;
  bool isSubscribed;
  bool isThirdParty;
  String name;
  int newsArticleCount;
  int videoArticleCount;
  bool withRecommendations;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    articleCount: json["article_count"],
    avatar: json["avatar"],
    id: json["id"],
    introduction: json["introduction"],
    isSubscribed: json["is_subscribed"],
    isThirdParty: json["is_third_party"],
    name: json["name"],
    newsArticleCount: json["news_article_count"],
    videoArticleCount: json["video_article_count"],
    withRecommendations: json["with_recommendations"] == null ? null : json["with_recommendations"],
  );

  Map<String, dynamic> toJson() => {
    "article_count": articleCount,
    "avatar": avatar,
    "id": id,
    "introduction": introduction,
    "is_subscribed": isSubscribed,
    "is_third_party": isThirdParty,
    "name": name,
    "news_article_count": newsArticleCount,
    "video_article_count": videoArticleCount,
    "with_recommendations": withRecommendations == null ? null : withRecommendations,
  };
}

class Video {
  Video({
    this.captions,
    this.description,
    this.duration,
    this.id,
    this.playUrl,
    this.resolutionType,
    this.snapshotImage,
  });

  List<dynamic> captions;
  String description;
  double duration;
  int id;
  String playUrl;
  int resolutionType;
  String snapshotImage;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    captions: List<dynamic>.from(json["captions"].map((x) => x)),
    description: json["description"],
    duration: json["duration"].toDouble(),
    id: json["id"],
    playUrl: json["play_url"],
    resolutionType: json["resolution_type"],
    snapshotImage: json["snapshot_image"],
  );

  Map<String, dynamic> toJson() => {
    "captions": List<dynamic>.from(captions.map((x) => x)),
    "description": description,
    "duration": duration,
    "id": id,
    "play_url": playUrl,
    "resolution_type": resolutionType,
    "snapshot_image": snapshotImage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
