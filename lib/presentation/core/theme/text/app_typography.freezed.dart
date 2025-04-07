// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_typography.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppTypography {
  AppTextTheme get black;
  AppTextTheme get white;

  /// Create a copy of AppTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppTypographyCopyWith<AppTypography> get copyWith =>
      _$AppTypographyCopyWithImpl<AppTypography>(
          this as AppTypography, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTypography &&
            (identical(other.black, black) || other.black == black) &&
            (identical(other.white, white) || other.white == white));
  }

  @override
  int get hashCode => Object.hash(runtimeType, black, white);

  @override
  String toString() {
    return 'AppTypography(black: $black, white: $white)';
  }
}

/// @nodoc
abstract mixin class $AppTypographyCopyWith<$Res> {
  factory $AppTypographyCopyWith(
          AppTypography value, $Res Function(AppTypography) _then) =
      _$AppTypographyCopyWithImpl;
  @useResult
  $Res call({AppTextTheme black, AppTextTheme white});

  $AppTextThemeCopyWith<$Res> get black;
  $AppTextThemeCopyWith<$Res> get white;
}

/// @nodoc
class _$AppTypographyCopyWithImpl<$Res>
    implements $AppTypographyCopyWith<$Res> {
  _$AppTypographyCopyWithImpl(this._self, this._then);

  final AppTypography _self;
  final $Res Function(AppTypography) _then;

  /// Create a copy of AppTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? black = null,
    Object? white = null,
  }) {
    return _then(_self.copyWith(
      black: null == black
          ? _self.black
          : black // ignore: cast_nullable_to_non_nullable
              as AppTextTheme,
      white: null == white
          ? _self.white
          : white // ignore: cast_nullable_to_non_nullable
              as AppTextTheme,
    ));
  }

  /// Create a copy of AppTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppTextThemeCopyWith<$Res> get black {
    return $AppTextThemeCopyWith<$Res>(_self.black, (value) {
      return _then(_self.copyWith(black: value));
    });
  }

  /// Create a copy of AppTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppTextThemeCopyWith<$Res> get white {
    return $AppTextThemeCopyWith<$Res>(_self.white, (value) {
      return _then(_self.copyWith(white: value));
    });
  }
}

/// @nodoc

class _AppTypography extends AppTypography {
  _AppTypography({required this.black, required this.white}) : super._();

  @override
  final AppTextTheme black;
  @override
  final AppTextTheme white;

  /// Create a copy of AppTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppTypographyCopyWith<_AppTypography> get copyWith =>
      __$AppTypographyCopyWithImpl<_AppTypography>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppTypography &&
            (identical(other.black, black) || other.black == black) &&
            (identical(other.white, white) || other.white == white));
  }

  @override
  int get hashCode => Object.hash(runtimeType, black, white);

  @override
  String toString() {
    return 'AppTypography(black: $black, white: $white)';
  }
}

/// @nodoc
abstract mixin class _$AppTypographyCopyWith<$Res>
    implements $AppTypographyCopyWith<$Res> {
  factory _$AppTypographyCopyWith(
          _AppTypography value, $Res Function(_AppTypography) _then) =
      __$AppTypographyCopyWithImpl;
  @override
  @useResult
  $Res call({AppTextTheme black, AppTextTheme white});

  @override
  $AppTextThemeCopyWith<$Res> get black;
  @override
  $AppTextThemeCopyWith<$Res> get white;
}

/// @nodoc
class __$AppTypographyCopyWithImpl<$Res>
    implements _$AppTypographyCopyWith<$Res> {
  __$AppTypographyCopyWithImpl(this._self, this._then);

  final _AppTypography _self;
  final $Res Function(_AppTypography) _then;

  /// Create a copy of AppTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? black = null,
    Object? white = null,
  }) {
    return _then(_AppTypography(
      black: null == black
          ? _self.black
          : black // ignore: cast_nullable_to_non_nullable
              as AppTextTheme,
      white: null == white
          ? _self.white
          : white // ignore: cast_nullable_to_non_nullable
              as AppTextTheme,
    ));
  }

  /// Create a copy of AppTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppTextThemeCopyWith<$Res> get black {
    return $AppTextThemeCopyWith<$Res>(_self.black, (value) {
      return _then(_self.copyWith(black: value));
    });
  }

  /// Create a copy of AppTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppTextThemeCopyWith<$Res> get white {
    return $AppTextThemeCopyWith<$Res>(_self.white, (value) {
      return _then(_self.copyWith(white: value));
    });
  }
}

// dart format on
