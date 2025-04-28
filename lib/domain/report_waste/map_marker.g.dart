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
      markerType: $enumDecode(_$MarkerTypeEnumMap, json['markerType']),
      creationDate: DateTime.parse(json['creationDate'] as String),
      reportedBy: json['reportedBy'] as String,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
      'markerType': _$MarkerTypeEnumMap[instance.markerType]!,
      'creationDate': instance.creationDate.toIso8601String(),
      'reportedBy': instance.reportedBy,
      'images': instance.images,
      'resolutionDate': instance.resolutionDate?.toIso8601String(),
      'resolvedBy': instance.resolvedBy,
    };

const _$MarkerTypeEnumMap = {
  MarkerType.unknown: 'unknown',
  MarkerType.plasticAndPackaging: 'plasticAndPackaging',
  MarkerType.paper: 'paper',
  MarkerType.glass: 'glass',
  MarkerType.organic: 'organic',
  MarkerType.residual: 'residual',
  MarkerType.electronics: 'electronics',
  MarkerType.hazardous: 'hazardous',
  MarkerType.bulky: 'bulky',
  MarkerType.textiles: 'textiles',
  MarkerType.batteries: 'batteries',
};
