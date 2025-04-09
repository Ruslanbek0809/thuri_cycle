// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertModel {
  String get message;
  AlertType get type;
  bool get translatable;
  int? get code;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AlertModelCopyWith<AlertModel> get copyWith =>
      _$AlertModelCopyWithImpl<AlertModel>(this as AlertModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlertModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.translatable, translatable) ||
                other.translatable == translatable) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, type, translatable, code);

  @override
  String toString() {
    return 'AlertModel(message: $message, type: $type, translatable: $translatable, code: $code)';
  }
}

/// @nodoc
abstract mixin class $AlertModelCopyWith<$Res> {
  factory $AlertModelCopyWith(
          AlertModel value, $Res Function(AlertModel) _then) =
      _$AlertModelCopyWithImpl;
  @useResult
  $Res call({String message, AlertType type, bool translatable, int? code});
}

/// @nodoc
class _$AlertModelCopyWithImpl<$Res> implements $AlertModelCopyWith<$Res> {
  _$AlertModelCopyWithImpl(this._self, this._then);

  final AlertModel _self;
  final $Res Function(AlertModel) _then;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? translatable = null,
    Object? code = freezed,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      translatable: null == translatable
          ? _self.translatable
          : translatable // ignore: cast_nullable_to_non_nullable
              as bool,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _AlertModel implements AlertModel {
  const _AlertModel(
      {required this.message,
      required this.type,
      this.translatable = false,
      this.code});

  @override
  final String message;
  @override
  final AlertType type;
  @override
  @JsonKey()
  final bool translatable;
  @override
  final int? code;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AlertModelCopyWith<_AlertModel> get copyWith =>
      __$AlertModelCopyWithImpl<_AlertModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlertModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.translatable, translatable) ||
                other.translatable == translatable) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, type, translatable, code);

  @override
  String toString() {
    return 'AlertModel(message: $message, type: $type, translatable: $translatable, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$AlertModelCopyWith<$Res>
    implements $AlertModelCopyWith<$Res> {
  factory _$AlertModelCopyWith(
          _AlertModel value, $Res Function(_AlertModel) _then) =
      __$AlertModelCopyWithImpl;
  @override
  @useResult
  $Res call({String message, AlertType type, bool translatable, int? code});
}

/// @nodoc
class __$AlertModelCopyWithImpl<$Res> implements _$AlertModelCopyWith<$Res> {
  __$AlertModelCopyWithImpl(this._self, this._then);

  final _AlertModel _self;
  final $Res Function(_AlertModel) _then;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? translatable = null,
    Object? code = freezed,
  }) {
    return _then(_AlertModel(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      translatable: null == translatable
          ? _self.translatable
          : translatable // ignore: cast_nullable_to_non_nullable
              as bool,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
