// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_marker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MapMarkerModel _$MapMarkerModelFromJson(Map<String, dynamic> json) {
  return _MapMarkerModel.fromJson(json);
}

/// @nodoc
mixin _$MapMarkerModel {
  String get id => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  MarkerType get type => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  String get reportedBy => throw _privateConstructorUsedError;
  DateTime? get resolutionDate => throw _privateConstructorUsedError;
  String? get resolvedBy => throw _privateConstructorUsedError;

  /// Serializes this MapMarkerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MapMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapMarkerModelCopyWith<MapMarkerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapMarkerModelCopyWith<$Res> {
  factory $MapMarkerModelCopyWith(
          MapMarkerModel value, $Res Function(MapMarkerModel) then) =
      _$MapMarkerModelCopyWithImpl<$Res, MapMarkerModel>;
  @useResult
  $Res call(
      {String id,
      double latitude,
      double longitude,
      MarkerType type,
      DateTime creationDate,
      String reportedBy,
      DateTime? resolutionDate,
      String? resolvedBy});
}

/// @nodoc
class _$MapMarkerModelCopyWithImpl<$Res, $Val extends MapMarkerModel>
    implements $MapMarkerModelCopyWith<$Res> {
  _$MapMarkerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? type = null,
    Object? creationDate = null,
    Object? reportedBy = null,
    Object? resolutionDate = freezed,
    Object? resolvedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MarkerType,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reportedBy: null == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String,
      resolutionDate: freezed == resolutionDate
          ? _value.resolutionDate
          : resolutionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapMarkerModelImplCopyWith<$Res>
    implements $MapMarkerModelCopyWith<$Res> {
  factory _$$MapMarkerModelImplCopyWith(_$MapMarkerModelImpl value,
          $Res Function(_$MapMarkerModelImpl) then) =
      __$$MapMarkerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double latitude,
      double longitude,
      MarkerType type,
      DateTime creationDate,
      String reportedBy,
      DateTime? resolutionDate,
      String? resolvedBy});
}

/// @nodoc
class __$$MapMarkerModelImplCopyWithImpl<$Res>
    extends _$MapMarkerModelCopyWithImpl<$Res, _$MapMarkerModelImpl>
    implements _$$MapMarkerModelImplCopyWith<$Res> {
  __$$MapMarkerModelImplCopyWithImpl(
      _$MapMarkerModelImpl _value, $Res Function(_$MapMarkerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? type = null,
    Object? creationDate = null,
    Object? reportedBy = null,
    Object? resolutionDate = freezed,
    Object? resolvedBy = freezed,
  }) {
    return _then(_$MapMarkerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MarkerType,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reportedBy: null == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String,
      resolutionDate: freezed == resolutionDate
          ? _value.resolutionDate
          : resolutionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapMarkerModelImpl implements _MapMarkerModel {
  const _$MapMarkerModelImpl(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.type,
      required this.creationDate,
      required this.reportedBy,
      this.resolutionDate,
      this.resolvedBy});

  factory _$MapMarkerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapMarkerModelImplFromJson(json);

  @override
  final String id;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final MarkerType type;
  @override
  final DateTime creationDate;
  @override
  final String reportedBy;
  @override
  final DateTime? resolutionDate;
  @override
  final String? resolvedBy;

  @override
  String toString() {
    return 'MapMarkerModel(id: $id, latitude: $latitude, longitude: $longitude, type: $type, creationDate: $creationDate, reportedBy: $reportedBy, resolutionDate: $resolutionDate, resolvedBy: $resolvedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapMarkerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.reportedBy, reportedBy) ||
                other.reportedBy == reportedBy) &&
            (identical(other.resolutionDate, resolutionDate) ||
                other.resolutionDate == resolutionDate) &&
            (identical(other.resolvedBy, resolvedBy) ||
                other.resolvedBy == resolvedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, latitude, longitude, type,
      creationDate, reportedBy, resolutionDate, resolvedBy);

  /// Create a copy of MapMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapMarkerModelImplCopyWith<_$MapMarkerModelImpl> get copyWith =>
      __$$MapMarkerModelImplCopyWithImpl<_$MapMarkerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapMarkerModelImplToJson(
      this,
    );
  }
}

abstract class _MapMarkerModel implements MapMarkerModel {
  const factory _MapMarkerModel(
      {required final String id,
      required final double latitude,
      required final double longitude,
      required final MarkerType type,
      required final DateTime creationDate,
      required final String reportedBy,
      final DateTime? resolutionDate,
      final String? resolvedBy}) = _$MapMarkerModelImpl;

  factory _MapMarkerModel.fromJson(Map<String, dynamic> json) =
      _$MapMarkerModelImpl.fromJson;

  @override
  String get id;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  MarkerType get type;
  @override
  DateTime get creationDate;
  @override
  String get reportedBy;
  @override
  DateTime? get resolutionDate;
  @override
  String? get resolvedBy;

  /// Create a copy of MapMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapMarkerModelImplCopyWith<_$MapMarkerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
