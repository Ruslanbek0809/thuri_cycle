// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_featured_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunityFeaturedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AlertModel alert) failed,
    required TResult Function(Article article) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AlertModel alert)? failed,
    TResult? Function(Article article)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AlertModel alert)? failed,
    TResult Function(Article article)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommunityFeaturedStateInitial value) initial,
    required TResult Function(_CommunityFeaturedStateLoading value) loading,
    required TResult Function(_CommunityFeaturedStateFailed value) failed,
    required TResult Function(_CommunityFeaturedStateSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommunityFeaturedStateInitial value)? initial,
    TResult? Function(_CommunityFeaturedStateLoading value)? loading,
    TResult? Function(_CommunityFeaturedStateFailed value)? failed,
    TResult? Function(_CommunityFeaturedStateSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommunityFeaturedStateInitial value)? initial,
    TResult Function(_CommunityFeaturedStateLoading value)? loading,
    TResult Function(_CommunityFeaturedStateFailed value)? failed,
    TResult Function(_CommunityFeaturedStateSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityFeaturedStateCopyWith<$Res> {
  factory $CommunityFeaturedStateCopyWith(CommunityFeaturedState value,
          $Res Function(CommunityFeaturedState) then) =
      _$CommunityFeaturedStateCopyWithImpl<$Res, CommunityFeaturedState>;
}

/// @nodoc
class _$CommunityFeaturedStateCopyWithImpl<$Res,
        $Val extends CommunityFeaturedState>
    implements $CommunityFeaturedStateCopyWith<$Res> {
  _$CommunityFeaturedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CommunityFeaturedStateInitialImplCopyWith<$Res> {
  factory _$$CommunityFeaturedStateInitialImplCopyWith(
          _$CommunityFeaturedStateInitialImpl value,
          $Res Function(_$CommunityFeaturedStateInitialImpl) then) =
      __$$CommunityFeaturedStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CommunityFeaturedStateInitialImplCopyWithImpl<$Res>
    extends _$CommunityFeaturedStateCopyWithImpl<$Res,
        _$CommunityFeaturedStateInitialImpl>
    implements _$$CommunityFeaturedStateInitialImplCopyWith<$Res> {
  __$$CommunityFeaturedStateInitialImplCopyWithImpl(
      _$CommunityFeaturedStateInitialImpl _value,
      $Res Function(_$CommunityFeaturedStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CommunityFeaturedStateInitialImpl
    with DiagnosticableTreeMixin
    implements _CommunityFeaturedStateInitial {
  const _$CommunityFeaturedStateInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommunityFeaturedState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommunityFeaturedState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityFeaturedStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AlertModel alert) failed,
    required TResult Function(Article article) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AlertModel alert)? failed,
    TResult? Function(Article article)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AlertModel alert)? failed,
    TResult Function(Article article)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommunityFeaturedStateInitial value) initial,
    required TResult Function(_CommunityFeaturedStateLoading value) loading,
    required TResult Function(_CommunityFeaturedStateFailed value) failed,
    required TResult Function(_CommunityFeaturedStateSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommunityFeaturedStateInitial value)? initial,
    TResult? Function(_CommunityFeaturedStateLoading value)? loading,
    TResult? Function(_CommunityFeaturedStateFailed value)? failed,
    TResult? Function(_CommunityFeaturedStateSuccess value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommunityFeaturedStateInitial value)? initial,
    TResult Function(_CommunityFeaturedStateLoading value)? loading,
    TResult Function(_CommunityFeaturedStateFailed value)? failed,
    TResult Function(_CommunityFeaturedStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _CommunityFeaturedStateInitial
    implements CommunityFeaturedState {
  const factory _CommunityFeaturedStateInitial() =
      _$CommunityFeaturedStateInitialImpl;
}

/// @nodoc
abstract class _$$CommunityFeaturedStateLoadingImplCopyWith<$Res> {
  factory _$$CommunityFeaturedStateLoadingImplCopyWith(
          _$CommunityFeaturedStateLoadingImpl value,
          $Res Function(_$CommunityFeaturedStateLoadingImpl) then) =
      __$$CommunityFeaturedStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CommunityFeaturedStateLoadingImplCopyWithImpl<$Res>
    extends _$CommunityFeaturedStateCopyWithImpl<$Res,
        _$CommunityFeaturedStateLoadingImpl>
    implements _$$CommunityFeaturedStateLoadingImplCopyWith<$Res> {
  __$$CommunityFeaturedStateLoadingImplCopyWithImpl(
      _$CommunityFeaturedStateLoadingImpl _value,
      $Res Function(_$CommunityFeaturedStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CommunityFeaturedStateLoadingImpl
    with DiagnosticableTreeMixin
    implements _CommunityFeaturedStateLoading {
  const _$CommunityFeaturedStateLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommunityFeaturedState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommunityFeaturedState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityFeaturedStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AlertModel alert) failed,
    required TResult Function(Article article) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AlertModel alert)? failed,
    TResult? Function(Article article)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AlertModel alert)? failed,
    TResult Function(Article article)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommunityFeaturedStateInitial value) initial,
    required TResult Function(_CommunityFeaturedStateLoading value) loading,
    required TResult Function(_CommunityFeaturedStateFailed value) failed,
    required TResult Function(_CommunityFeaturedStateSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommunityFeaturedStateInitial value)? initial,
    TResult? Function(_CommunityFeaturedStateLoading value)? loading,
    TResult? Function(_CommunityFeaturedStateFailed value)? failed,
    TResult? Function(_CommunityFeaturedStateSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommunityFeaturedStateInitial value)? initial,
    TResult Function(_CommunityFeaturedStateLoading value)? loading,
    TResult Function(_CommunityFeaturedStateFailed value)? failed,
    TResult Function(_CommunityFeaturedStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CommunityFeaturedStateLoading
    implements CommunityFeaturedState {
  const factory _CommunityFeaturedStateLoading() =
      _$CommunityFeaturedStateLoadingImpl;
}

/// @nodoc
abstract class _$$CommunityFeaturedStateFailedImplCopyWith<$Res> {
  factory _$$CommunityFeaturedStateFailedImplCopyWith(
          _$CommunityFeaturedStateFailedImpl value,
          $Res Function(_$CommunityFeaturedStateFailedImpl) then) =
      __$$CommunityFeaturedStateFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AlertModel alert});

  $AlertModelCopyWith<$Res> get alert;
}

/// @nodoc
class __$$CommunityFeaturedStateFailedImplCopyWithImpl<$Res>
    extends _$CommunityFeaturedStateCopyWithImpl<$Res,
        _$CommunityFeaturedStateFailedImpl>
    implements _$$CommunityFeaturedStateFailedImplCopyWith<$Res> {
  __$$CommunityFeaturedStateFailedImplCopyWithImpl(
      _$CommunityFeaturedStateFailedImpl _value,
      $Res Function(_$CommunityFeaturedStateFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alert = null,
  }) {
    return _then(_$CommunityFeaturedStateFailedImpl(
      alert: null == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as AlertModel,
    ));
  }

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AlertModelCopyWith<$Res> get alert {
    return $AlertModelCopyWith<$Res>(_value.alert, (value) {
      return _then(_value.copyWith(alert: value));
    });
  }
}

/// @nodoc

class _$CommunityFeaturedStateFailedImpl
    with DiagnosticableTreeMixin
    implements _CommunityFeaturedStateFailed {
  const _$CommunityFeaturedStateFailedImpl({required this.alert});

  @override
  final AlertModel alert;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommunityFeaturedState.failed(alert: $alert)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommunityFeaturedState.failed'))
      ..add(DiagnosticsProperty('alert', alert));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityFeaturedStateFailedImpl &&
            (identical(other.alert, alert) || other.alert == alert));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alert);

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityFeaturedStateFailedImplCopyWith<
          _$CommunityFeaturedStateFailedImpl>
      get copyWith => __$$CommunityFeaturedStateFailedImplCopyWithImpl<
          _$CommunityFeaturedStateFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AlertModel alert) failed,
    required TResult Function(Article article) success,
  }) {
    return failed(alert);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AlertModel alert)? failed,
    TResult? Function(Article article)? success,
  }) {
    return failed?.call(alert);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AlertModel alert)? failed,
    TResult Function(Article article)? success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(alert);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommunityFeaturedStateInitial value) initial,
    required TResult Function(_CommunityFeaturedStateLoading value) loading,
    required TResult Function(_CommunityFeaturedStateFailed value) failed,
    required TResult Function(_CommunityFeaturedStateSuccess value) success,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommunityFeaturedStateInitial value)? initial,
    TResult? Function(_CommunityFeaturedStateLoading value)? loading,
    TResult? Function(_CommunityFeaturedStateFailed value)? failed,
    TResult? Function(_CommunityFeaturedStateSuccess value)? success,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommunityFeaturedStateInitial value)? initial,
    TResult Function(_CommunityFeaturedStateLoading value)? loading,
    TResult Function(_CommunityFeaturedStateFailed value)? failed,
    TResult Function(_CommunityFeaturedStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _CommunityFeaturedStateFailed implements CommunityFeaturedState {
  const factory _CommunityFeaturedStateFailed(
      {required final AlertModel alert}) = _$CommunityFeaturedStateFailedImpl;

  AlertModel get alert;

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityFeaturedStateFailedImplCopyWith<
          _$CommunityFeaturedStateFailedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommunityFeaturedStateSuccessImplCopyWith<$Res> {
  factory _$$CommunityFeaturedStateSuccessImplCopyWith(
          _$CommunityFeaturedStateSuccessImpl value,
          $Res Function(_$CommunityFeaturedStateSuccessImpl) then) =
      __$$CommunityFeaturedStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Article article});

  $ArticleCopyWith<$Res> get article;
}

/// @nodoc
class __$$CommunityFeaturedStateSuccessImplCopyWithImpl<$Res>
    extends _$CommunityFeaturedStateCopyWithImpl<$Res,
        _$CommunityFeaturedStateSuccessImpl>
    implements _$$CommunityFeaturedStateSuccessImplCopyWith<$Res> {
  __$$CommunityFeaturedStateSuccessImplCopyWithImpl(
      _$CommunityFeaturedStateSuccessImpl _value,
      $Res Function(_$CommunityFeaturedStateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = null,
  }) {
    return _then(_$CommunityFeaturedStateSuccessImpl(
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
    ));
  }

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArticleCopyWith<$Res> get article {
    return $ArticleCopyWith<$Res>(_value.article, (value) {
      return _then(_value.copyWith(article: value));
    });
  }
}

/// @nodoc

class _$CommunityFeaturedStateSuccessImpl
    with DiagnosticableTreeMixin
    implements _CommunityFeaturedStateSuccess {
  const _$CommunityFeaturedStateSuccessImpl({required this.article});

  @override
  final Article article;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommunityFeaturedState.success(article: $article)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommunityFeaturedState.success'))
      ..add(DiagnosticsProperty('article', article));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityFeaturedStateSuccessImpl &&
            (identical(other.article, article) || other.article == article));
  }

  @override
  int get hashCode => Object.hash(runtimeType, article);

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityFeaturedStateSuccessImplCopyWith<
          _$CommunityFeaturedStateSuccessImpl>
      get copyWith => __$$CommunityFeaturedStateSuccessImplCopyWithImpl<
          _$CommunityFeaturedStateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AlertModel alert) failed,
    required TResult Function(Article article) success,
  }) {
    return success(article);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AlertModel alert)? failed,
    TResult? Function(Article article)? success,
  }) {
    return success?.call(article);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AlertModel alert)? failed,
    TResult Function(Article article)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(article);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommunityFeaturedStateInitial value) initial,
    required TResult Function(_CommunityFeaturedStateLoading value) loading,
    required TResult Function(_CommunityFeaturedStateFailed value) failed,
    required TResult Function(_CommunityFeaturedStateSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommunityFeaturedStateInitial value)? initial,
    TResult? Function(_CommunityFeaturedStateLoading value)? loading,
    TResult? Function(_CommunityFeaturedStateFailed value)? failed,
    TResult? Function(_CommunityFeaturedStateSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommunityFeaturedStateInitial value)? initial,
    TResult Function(_CommunityFeaturedStateLoading value)? loading,
    TResult Function(_CommunityFeaturedStateFailed value)? failed,
    TResult Function(_CommunityFeaturedStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _CommunityFeaturedStateSuccess
    implements CommunityFeaturedState {
  const factory _CommunityFeaturedStateSuccess(
      {required final Article article}) = _$CommunityFeaturedStateSuccessImpl;

  Article get article;

  /// Create a copy of CommunityFeaturedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityFeaturedStateSuccessImplCopyWith<
          _$CommunityFeaturedStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
