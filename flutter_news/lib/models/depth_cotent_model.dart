// To parse this JSON data, do
//
//     final depthContentModel = depthContentModelFromJson(jsonString);

import 'dart:convert';

List<DepthContentModel> depthContentModelFromJson(String str) => List<DepthContentModel>.from(json.decode(str).map((x) => DepthContentModel.fromJson(x)));

String depthContentModelToJson(List<DepthContentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepthContentModel {
  DepthContentModel({
    this.articleType,
    this.artificialTag,
    this.authors,
    this.coverImage,
    this.coverStatus,
    this.createdAt,
    this.description,
    this.id,
    this.liking,
    this.onlineAt,
    this.publishedAt,
    this.sources,
    this.statistics,
    this.title,
    this.unionAt,
    this.updatedAt,
    this.videos,
    this.wordCount,
  });

  ArticleType articleType;
  String artificialTag;
  List<Author> authors;
  String coverImage;
  int coverStatus;
  DateTime createdAt;
  String description;
  int id;
  bool liking;
  DateTime onlineAt;
  DateTime publishedAt;
  List<Source> sources;
  Statistics statistics;
  String title;
  DateTime unionAt;
  DateTime updatedAt;
  List<dynamic> videos;
  int wordCount;

  factory DepthContentModel.fromJson(Map<String, dynamic> json) => DepthContentModel(
    articleType: articleTypeValues.map[json["article_type"]],
    artificialTag: json["artificial_tag"],
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    coverImage: json["cover_image"],
    coverStatus: json["cover_status"],
    createdAt: DateTime.parse(json["created_at"]),
    description: json["description"],
    id: json["id"],
    liking: json["liking"],
    onlineAt: DateTime.parse(json["online_at"]),
    publishedAt: DateTime.parse(json["published_at"]),
    sources: List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
    statistics: Statistics.fromJson(json["statistics"]),
    title: json["title"],
    unionAt: DateTime.parse(json["union_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    wordCount: json["word_count"],
  );

  Map<String, dynamic> toJson() => {
    "article_type": articleTypeValues.reverse[articleType],
    "artificial_tag": artificialTag,
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "cover_image": coverImage,
    "cover_status": coverStatus,
    "created_at": createdAt.toIso8601String(),
    "description": description,
    "id": id,
    "liking": liking,
    "online_at": onlineAt.toIso8601String(),
    "published_at": publishedAt.toIso8601String(),
    "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
    "statistics": statistics.toJson(),
    "title": title,
    "union_at": unionAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "videos": List<dynamic>.from(videos.map((x) => x)),
    "word_count": wordCount,
  };
}

enum ArticleType { NEWS }

final articleTypeValues = EnumValues({
  "news": ArticleType.NEWS
});

class Author {
  Author({
    this.avatar,
    this.introduction,
    this.name,
  });

  String avatar;
  dynamic introduction;
  String name;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    avatar: json["avatar"],
    introduction: json["introduction"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "introduction": introduction,
    "name": name,
  };
}

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
  };
}

class Statistics {
  Statistics({
    this.attitudeCount,
    this.likeCount,
    this.readCount,
    this.replyCount,
  });

  int attitudeCount;
  int likeCount;
  int readCount;
  int replyCount;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    attitudeCount: json["attitude_count"],
    likeCount: json["like_count"],
    readCount: json["read_count"],
    replyCount: json["reply_count"],
  );

  Map<String, dynamic> toJson() => {
    "attitude_count": attitudeCount,
    "like_count": likeCount,
    "read_count": readCount,
    "reply_count": replyCount,
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
