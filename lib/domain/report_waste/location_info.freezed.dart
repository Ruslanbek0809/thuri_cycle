// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationInfoModel {
  bool get servicesEnabled => throw _privateConstructorUsedError;
  bool get permissionGranted => throw _privateConstructorUsedError;
  Position? get position => throw _privateConstructorUsedError;

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationInfoModelCopyWith<LocationInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationInfoModelCopyWith<$Res> {
  factory $LocationInfoModelCopyWith(
          LocationInfoModel value, $Res Function(LocationInfoModel) then) =
      _$LocationInfoModelCopyWithImpl<$Res, LocationInfoModel>;
  @useResult
  $Res call({bool servicesEnabled, bool permissionGranted, Position? position});
}

/// @nodoc
class _$LocationInfoModelCopyWithImpl<$Res, $Val extends LocationInfoModel>
    implements $LocationInfoModelCopyWith<$Res> {
  _$LocationInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicesEnabled = null,
    Object? permissionGranted = null,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      servicesEnabled: null == servicesEnabled
          ? _value.servicesEnabled
          : servicesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionGranted: null == permissionGranted
          ? _value.permissionGranted
          : permissionGranted // ignore: cast_nullable_to_non_nullable
              as bool,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationInfoModelImplCopyWith<$Res>
    implements $LocationInfoModelCopyWith<$Res> {
  factory _$$LocationInfoModelImplCopyWith(_$LocationInfoModelImpl value,
          $Res Function(_$LocationInfoModelImpl) then) =
      __$$LocationInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool servicesEnabled, bool permissionGranted, Position? position});
}

/// @nodoc
class __$$LocationInfoModelImplCopyWithImpl<$Res>
    extends _$LocationInfoModelCopyWithImpl<$Res, _$LocationInfoModelImpl>
    implements _$$LocationInfoModelImplCopyWith<$Res> {
  __$$LocationInfoModelImplCopyWithImpl(_$LocationInfoModelImpl _value,
      $Res Function(_$LocationInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicesEnabled = null,
    Object? permissionGranted = null,
    Object? position = freezed,
  }) {
    return _then(_$LocationInfoModelImpl(
      servicesEnabled: null == servicesEnabled
          ? _value.servicesEnabled
          : servicesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionGranted: null == permissionGranted
          ? _value.permissionGranted
          : permissionGranted // ignore: cast_nullable_to_non_nullable
              as bool,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position?,
    ));
  }
}

/// @nodoc

class _$LocationInfoModelImpl implements _LocationInfoModel {
  const _$LocationInfoModelImpl(
      {required this.servicesEnabled,
      required this.permissionGranted,
      this.position});

  @override
  final bool servicesEnabled;
  @override
  final bool permissionGranted;
  @override
  final Position? position;

  @override
  String toString() {
    return 'LocationInfoModel(servicesEnabled: $servicesEnabled, permissionGranted: $permissionGranted, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationInfoModelImpl &&
            (identical(other.servicesEnabled, servicesEnabled) ||
                other.servicesEnabled == servicesEnabled) &&
            (identical(other.permissionGranted, permissionGranted) ||
                other.permissionGranted == permissionGranted) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, servicesEnabled, permissionGranted, position);

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationInfoModelImplCopyWith<_$LocationInfoModelImpl> get copyWith =>
      __$$LocationInfoModelImplCopyWithImpl<_$LocationInfoModelImpl>(
          this, _$identity);
}

abstract class _LocationInfoModel implements LocationInfoModel {
  const factory _LocationInfoModel(
      {required final bool servicesEnabled,
      required final bool permissionGranted,
      final Position? position}) = _$LocationInfoModelImpl;

  @override
  bool get servicesEnabled;
  @override
  bool get permissionGranted;
  @override
  Position? get position;

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationInfoModelImplCopyWith<_$LocationInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
