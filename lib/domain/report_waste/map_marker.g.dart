// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_marker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapMarkerModelImpl _$$MapMarkerModelImplFromJson(Map<String, dynamic> json) =>
    _$MapMarkerModelImpl(
      id: json['id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      type: $enumDecode(_$MarkerTypeEnumMap, json['type']),
      creationDate: DateTime.parse(json['creationDate'] as String),
      reportedBy: json['reportedBy'] as String,
      resolutionDate: json['resolutionDate'] == null
          ? null
          : DateTime.parse(json['resolutionDate'] as String),
      resolvedBy: json['resolvedBy'] as String?,
    );

Map<String, dynamic> _$$MapMarkerModelImplToJson(
        _$MapMarkerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'type': _$MarkerTypeEnumMap[instance.type]!,
      'creationDate': instance.creationDate.toIso8601String(),
      'reportedBy': instance.reportedBy,
      'resolutionDate': instance.resolutionDate?.toIso8601String(),
      'resolvedBy': instance.resolvedBy,
    };

const _$MarkerTypeEnumMap = {
  MarkerType.unknown: 'unknown',
  MarkerType.plastic: 'plastic',
  MarkerType.paper: 'paper',
  MarkerType.undifferentiated: 'undifferentiated',
  MarkerType.glass: 'glass',
  MarkerType.compost: 'compost',
  MarkerType.electronics: 'electronics',
};
