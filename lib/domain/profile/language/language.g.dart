// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageModelImpl _$$LanguageModelImplFromJson(Map<String, dynamic> json) =>
    _$LanguageModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      shortName: json['shortName'] as String?,
    );

Map<String, dynamic> _$$LanguageModelImplToJson(_$LanguageModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.shortName case final value?) 'shortName': value,
    };
