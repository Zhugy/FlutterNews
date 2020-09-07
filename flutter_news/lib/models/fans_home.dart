import 'package:json_annotation/json_annotation.dart';

part 'fans_home.g.dart';

@JsonSerializable()
class FansHome {
  FansHome();

  List<SourcesItem> sources;

  List<TagsItem> tags;

  factory FansHome.fromJson(Map<String, dynamic> json) => _$FansHomeFromJson(json);

  Map<String, dynamic> toJson() => _$FansHomeToJson(this);
}

@JsonSerializable()
class SourcesItem {
  SourcesItem();

  @JsonKey(name: "article_count")
  num articleCount;

  String avatar;

  num id;

  String introduction;

  @JsonKey(name: "is_subscribed")
  bool isSubscribed;

  @JsonKey(name: "is_third_party")
  bool isThirdParty;

  String name;

  @JsonKey(name: "news_article_count")
  num newsArticleCount;

  @JsonKey(name: "video_article_count")
  num videoArticleCount;

  factory SourcesItem.fromJson(Map<String, dynamic> json) => _$SourcesItemFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesItemToJson(this);
}

@JsonSerializable()
class TagsItem {
  TagsItem();

  @JsonKey(name: "article_count")
  num articleCount;

  String avatar;

  num id;

  String introduction;

  String name;

  @JsonKey(name: "news_article_count")
  num newsArticleCount;

  @JsonKey(name: "video_article_count")
  num videoArticleCount;

  factory TagsItem.fromJson(Map<String, dynamic> json) => _$TagsItemFromJson(json);

  Map<String, dynamic> toJson() => _$TagsItemToJson(this);
}
