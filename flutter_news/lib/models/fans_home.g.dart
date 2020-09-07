// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fans_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FansHome _$FansHomeFromJson(Map<String, dynamic> json) {
  return FansHome()
    ..sources = (json['sources'] as List).map((e) => SourcesItem.fromJson(e as Map<String, dynamic>)).toList()
    ..tags = (json['tags'] as List).map((e) => TagsItem.fromJson(e as Map<String, dynamic>)).toList();
}

Map<String, dynamic> _$FansHomeToJson(FansHome instance) => <String, dynamic>{
      'sources': instance.sources,
      'tags': instance.tags,
    };

TagsItem _$TagsItemFromJson(Map<String, dynamic> json) {
  return TagsItem()
    ..articleCount = json['article_count'] as num
    ..avatar = json['avatar'] as String
    ..id = json['id'] as num
    ..introduction = json['introduction'] as String
    ..name = json['name'] as String
    ..newsArticleCount = json['news_article_count'] as num
    ..videoArticleCount = json['video_article_count'] as num;
}

Map<String, dynamic> _$TagsItemToJson(TagsItem instance) => <String, dynamic>{
  'article_count': instance.articleCount,
  'avatar': instance.avatar,
  'id': instance.id,
  'introduction': instance.introduction,
  'name': instance.name,
  'news_article_count': instance.newsArticleCount,
  'video_article_count': instance.videoArticleCount,
};

SourcesItem _$SourcesItemFromJson(Map<String, dynamic> json) {
  return SourcesItem()
    ..articleCount = json['article_count'] as num
    ..avatar = json['avatar'] as String
    ..id = json['id'] as num
    ..introduction = json['introduction'] as String
    ..isSubscribed = json['is_subscribed'] as bool
    ..isThirdParty = json['is_third_party'] as bool
    ..name = json['name'] as String
    ..newsArticleCount = json['news_article_count'] as num
    ..videoArticleCount = json['video_article_count'] as num;
}

Map<String, dynamic> _$SourcesItemToJson(SourcesItem instance) =>
    <String, dynamic>{
      'article_count': instance.articleCount,
      'avatar': instance.avatar,
      'id': instance.id,
      'introduction': instance.introduction,
      'is_subscribed': instance.isSubscribed,
      'is_third_party': instance.isThirdParty,
      'name': instance.name,
      'news_article_count': instance.newsArticleCount,
      'video_article_count': instance.videoArticleCount,
    };
