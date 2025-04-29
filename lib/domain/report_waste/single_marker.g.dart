// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_marker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingleMarkerModelImpl _$$SingleMarkerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SingleMarkerModelImpl(
      marker: MapMarkerModel.fromJson(json['marker'] as Map<String, dynamic>),
      reportedByUser:
          UserModel.fromJson(json['reportedByUser'] as Map<String, dynamic>),
      resolvedByUser: json['resolvedByUser'] == null
          ? null
          : UserModel.fromJson(json['resolvedByUser'] as Map<String, dynamic>),
      canBeReported: json['canBeReported'] as bool,
    );

Map<String, dynamic> _$$SingleMarkerModelImplToJson(
        _$SingleMarkerModelImpl instance) =>
    <String, dynamic>{
      'marker': instance.marker,
      'reportedByUser': instance.reportedByUser,
      'resolvedByUser': instance.resolvedByUser,
      'canBeReported': instance.canBeReported,
    };
