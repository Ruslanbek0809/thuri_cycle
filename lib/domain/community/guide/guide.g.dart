// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuideImpl _$$GuideImplFromJson(Map<String, dynamic> json) => _$GuideImpl(
      uid: json['uid'] as String,
      material: json['material'] as String,
      materialDe: json['material_de'] as String,
      imageUrl: json['imageUrl'] as String,
      iconUrl: json['iconUrl'] as String,
      color: json['color'] as String,
      content: json['content'] as String,
      contentDe: json['content_de'] as String,
      tip: json['tip'] as String,
      tipDe: json['tip_de'] as String,
    );

Map<String, dynamic> _$$GuideImplToJson(_$GuideImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'material': instance.material,
      'material_de': instance.materialDe,
      'imageUrl': instance.imageUrl,
      'iconUrl': instance.iconUrl,
      'color': instance.color,
      'content': instance.content,
      'content_de': instance.contentDe,
      'tip': instance.tip,
      'tip_de': instance.tipDe,
    };
