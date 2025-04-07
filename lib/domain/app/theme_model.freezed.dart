// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThemeModel {
  ThemeMode get mode;
  ThemeData get light;
  ThemeData get dark;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThemeModelCopyWith<ThemeModel> get copyWith =>
      _$ThemeModelCopyWithImpl<ThemeModel>(this as ThemeModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeModel &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.dark, dark) || other.dark == dark));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, light, dark);

  @override
  String toString() {
    return 'ThemeModel(mode: $mode, light: $light, dark: $dark)';
  }
}

/// @nodoc
abstract mixin class $ThemeModelCopyWith<$Res> {
  factory $ThemeModelCopyWith(
          ThemeModel value, $Res Function(ThemeModel) _then) =
      _$ThemeModelCopyWithImpl;
  @useResult
  $Res call({ThemeMode mode, ThemeData light, ThemeData dark});
}

/// @nodoc
class _$ThemeModelCopyWithImpl<$Res> implements $ThemeModelCopyWith<$Res> {
  _$ThemeModelCopyWithImpl(this._self, this._then);

  final ThemeModel _self;
  final $Res Function(ThemeModel) _then;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? light = null,
    Object? dark = null,
  }) {
    return _then(_self.copyWith(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      light: null == light
          ? _self.light
          : light // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      dark: null == dark
          ? _self.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _ThemeModel extends ThemeModel {
  _ThemeModel({required this.mode, required this.light, required this.dark})
      : super._();

  @override
  final ThemeMode mode;
  @override
  final ThemeData light;
  @override
  final ThemeData dark;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ThemeModelCopyWith<_ThemeModel> get copyWith =>
      __$ThemeModelCopyWithImpl<_ThemeModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeModel &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.dark, dark) || other.dark == dark));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, light, dark);

  @override
  String toString() {
    return 'ThemeModel(mode: $mode, light: $light, dark: $dark)';
  }
}

/// @nodoc
abstract mixin class _$ThemeModelCopyWith<$Res>
    implements $ThemeModelCopyWith<$Res> {
  factory _$ThemeModelCopyWith(
          _ThemeModel value, $Res Function(_ThemeModel) _then) =
      __$ThemeModelCopyWithImpl;
  @override
  @useResult
  $Res call({ThemeMode mode, ThemeData light, ThemeData dark});
}

/// @nodoc
class __$ThemeModelCopyWithImpl<$Res> implements _$ThemeModelCopyWith<$Res> {
  __$ThemeModelCopyWithImpl(this._self, this._then);

  final _ThemeModel _self;
  final $Res Function(_ThemeModel) _then;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mode = null,
    Object? light = null,
    Object? dark = null,
  }) {
    return _then(_ThemeModel(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      light: null == light
          ? _self.light
          : light // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      dark: null == dark
          ? _self.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

// dart format on
