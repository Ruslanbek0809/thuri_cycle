// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      uid: json['uid'] as String,
      title: json['title'] as String,
      titleDe: json['title_de'] as String,
      summary: json['summary'] as String,
      summaryDe: json['summary_de'] as String,
      imageUrl: json['imageUrl'] as String,
      tagDe: json['tag_de'] as String,
      tag: json['tag'] as String,
      content: json['content'] as String,
      contentDe: json['content_de'] as String,
      date: dateTimeFromTimestamp(json['date']),
      featured: json['featured'] as bool? ?? false,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'title_de': instance.titleDe,
      'summary': instance.summary,
      'summary_de': instance.summaryDe,
      'imageUrl': instance.imageUrl,
      'tag_de': instance.tagDe,
      'tag': instance.tag,
      'content': instance.content,
      'content_de': instance.contentDe,
      'date': dateTimeToTimestamp(instance.date),
      'featured': instance.featured,
    };
