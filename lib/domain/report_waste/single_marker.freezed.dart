// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_marker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SingleMarkerModel _$SingleMarkerModelFromJson(Map<String, dynamic> json) {
  return _SingleMarkerModel.fromJson(json);
}

/// @nodoc
mixin _$SingleMarkerModel {
  MapMarkerModel get marker => throw _privateConstructorUsedError;
  UserModel get reportedByUser => throw _privateConstructorUsedError;
  UserModel? get resolvedByUser => throw _privateConstructorUsedError;
  bool get canBeReported => throw _privateConstructorUsedError;

  /// Serializes this SingleMarkerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SingleMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SingleMarkerModelCopyWith<SingleMarkerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleMarkerModelCopyWith<$Res> {
  factory $SingleMarkerModelCopyWith(
          SingleMarkerModel value, $Res Function(SingleMarkerModel) then) =
      _$SingleMarkerModelCopyWithImpl<$Res, SingleMarkerModel>;
  @useResult
  $Res call(
      {MapMarkerModel marker,
      UserModel reportedByUser,
      UserModel? resolvedByUser,
      bool canBeReported});

  $MapMarkerModelCopyWith<$Res> get marker;
  $UserModelCopyWith<$Res> get reportedByUser;
  $UserModelCopyWith<$Res>? get resolvedByUser;
}

/// @nodoc
class _$SingleMarkerModelCopyWithImpl<$Res, $Val extends SingleMarkerModel>
    implements $SingleMarkerModelCopyWith<$Res> {
  _$SingleMarkerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marker = null,
    Object? reportedByUser = null,
    Object? resolvedByUser = freezed,
    Object? canBeReported = null,
  }) {
    return _then(_value.copyWith(
      marker: null == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as MapMarkerModel,
      reportedByUser: null == reportedByUser
          ? _value.reportedByUser
          : reportedByUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
      resolvedByUser: freezed == resolvedByUser
          ? _value.resolvedByUser
          : resolvedByUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      canBeReported: null == canBeReported
          ? _value.canBeReported
          : canBeReported // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of SingleMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MapMarkerModelCopyWith<$Res> get marker {
    return $MapMarkerModelCopyWith<$Res>(_value.marker, (value) {
      return _then(_value.copyWith(marker: value) as $Val);
    });
  }

  /// Create a copy of SingleMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get reportedByUser {
    return $UserModelCopyWith<$Res>(_value.reportedByUser, (value) {
      return _then(_value.copyWith(reportedByUser: value) as $Val);
    });
  }

  /// Create a copy of SingleMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get resolvedByUser {
    if (_value.resolvedByUser == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.resolvedByUser!, (value) {
      return _then(_value.copyWith(resolvedByUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SingleMarkerModelImplCopyWith<$Res>
    implements $SingleMarkerModelCopyWith<$Res> {
  factory _$$SingleMarkerModelImplCopyWith(_$SingleMarkerModelImpl value,
          $Res Function(_$SingleMarkerModelImpl) then) =
      __$$SingleMarkerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MapMarkerModel marker,
      UserModel reportedByUser,
      UserModel? resolvedByUser,
      bool canBeReported});

  @override
  $MapMarkerModelCopyWith<$Res> get marker;
  @override
  $UserModelCopyWith<$Res> get reportedByUser;
  @override
  $UserModelCopyWith<$Res>? get resolvedByUser;
}

/// @nodoc
class __$$SingleMarkerModelImplCopyWithImpl<$Res>
    extends _$SingleMarkerModelCopyWithImpl<$Res, _$SingleMarkerModelImpl>
    implements _$$SingleMarkerModelImplCopyWith<$Res> {
  __$$SingleMarkerModelImplCopyWithImpl(_$SingleMarkerModelImpl _value,
      $Res Function(_$SingleMarkerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marker = null,
    Object? reportedByUser = null,
    Object? resolvedByUser = freezed,
    Object? canBeReported = null,
  }) {
    return _then(_$SingleMarkerModelImpl(
      marker: null == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as MapMarkerModel,
      reportedByUser: null == reportedByUser
          ? _value.reportedByUser
          : reportedByUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
      resolvedByUser: freezed == resolvedByUser
          ? _value.resolvedByUser
          : resolvedByUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      canBeReported: null == canBeReported
          ? _value.canBeReported
          : canBeReported // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleMarkerModelImpl implements _SingleMarkerModel {
  const _$SingleMarkerModelImpl(
      {required this.marker,
      required this.reportedByUser,
      this.resolvedByUser,
      required this.canBeReported});

  factory _$SingleMarkerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleMarkerModelImplFromJson(json);

  @override
  final MapMarkerModel marker;
  @override
  final UserModel reportedByUser;
  @override
  final UserModel? resolvedByUser;
  @override
  final bool canBeReported;

  @override
  String toString() {
    return 'SingleMarkerModel(marker: $marker, reportedByUser: $reportedByUser, resolvedByUser: $resolvedByUser, canBeReported: $canBeReported)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleMarkerModelImpl &&
            (identical(other.marker, marker) || other.marker == marker) &&
            (identical(other.reportedByUser, reportedByUser) ||
                other.reportedByUser == reportedByUser) &&
            (identical(other.resolvedByUser, resolvedByUser) ||
                other.resolvedByUser == resolvedByUser) &&
            (identical(other.canBeReported, canBeReported) ||
                other.canBeReported == canBeReported));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, marker, reportedByUser, resolvedByUser, canBeReported);

  /// Create a copy of SingleMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleMarkerModelImplCopyWith<_$SingleMarkerModelImpl> get copyWith =>
      __$$SingleMarkerModelImplCopyWithImpl<_$SingleMarkerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleMarkerModelImplToJson(
      this,
    );
  }
}

abstract class _SingleMarkerModel implements SingleMarkerModel {
  const factory _SingleMarkerModel(
      {required final MapMarkerModel marker,
      required final UserModel reportedByUser,
      final UserModel? resolvedByUser,
      required final bool canBeReported}) = _$SingleMarkerModelImpl;

  factory _SingleMarkerModel.fromJson(Map<String, dynamic> json) =
      _$SingleMarkerModelImpl.fromJson;

  @override
  MapMarkerModel get marker;
  @override
  UserModel get reportedByUser;
  @override
  UserModel? get resolvedByUser;
  @override
  bool get canBeReported;

  /// Create a copy of SingleMarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleMarkerModelImplCopyWith<_$SingleMarkerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
