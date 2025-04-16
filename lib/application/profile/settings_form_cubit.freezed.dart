// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsFormState {
// required LanguageModel? languageModel,
// required bool isLanguagesLoading,
// required List<LanguageModel> languages,
  PackageInfo? get packageInfo => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get showError => throw _privateConstructorUsedError;
  Option<Either<AlertModel, Unit>> get optionOfSuccessOrFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of SettingsFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsFormStateCopyWith<SettingsFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsFormStateCopyWith<$Res> {
  factory $SettingsFormStateCopyWith(
          SettingsFormState value, $Res Function(SettingsFormState) then) =
      _$SettingsFormStateCopyWithImpl<$Res, SettingsFormState>;
  @useResult
  $Res call(
      {PackageInfo? packageInfo,
      bool isLoading,
      bool showError,
      Option<Either<AlertModel, Unit>> optionOfSuccessOrFailure});
}

/// @nodoc
class _$SettingsFormStateCopyWithImpl<$Res, $Val extends SettingsFormState>
    implements $SettingsFormStateCopyWith<$Res> {
  _$SettingsFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageInfo = freezed,
    Object? isLoading = null,
    Object? showError = null,
    Object? optionOfSuccessOrFailure = null,
  }) {
    return _then(_value.copyWith(
      packageInfo: freezed == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showError: null == showError
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      optionOfSuccessOrFailure: null == optionOfSuccessOrFailure
          ? _value.optionOfSuccessOrFailure
          : optionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AlertModel, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsFormStateImplCopyWith<$Res>
    implements $SettingsFormStateCopyWith<$Res> {
  factory _$$SettingsFormStateImplCopyWith(_$SettingsFormStateImpl value,
          $Res Function(_$SettingsFormStateImpl) then) =
      __$$SettingsFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PackageInfo? packageInfo,
      bool isLoading,
      bool showError,
      Option<Either<AlertModel, Unit>> optionOfSuccessOrFailure});
}

/// @nodoc
class __$$SettingsFormStateImplCopyWithImpl<$Res>
    extends _$SettingsFormStateCopyWithImpl<$Res, _$SettingsFormStateImpl>
    implements _$$SettingsFormStateImplCopyWith<$Res> {
  __$$SettingsFormStateImplCopyWithImpl(_$SettingsFormStateImpl _value,
      $Res Function(_$SettingsFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageInfo = freezed,
    Object? isLoading = null,
    Object? showError = null,
    Object? optionOfSuccessOrFailure = null,
  }) {
    return _then(_$SettingsFormStateImpl(
      packageInfo: freezed == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showError: null == showError
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      optionOfSuccessOrFailure: null == optionOfSuccessOrFailure
          ? _value.optionOfSuccessOrFailure
          : optionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AlertModel, Unit>>,
    ));
  }
}

/// @nodoc

class _$SettingsFormStateImpl implements _SettingsFormState {
  _$SettingsFormStateImpl(
      {required this.packageInfo,
      required this.isLoading,
      required this.showError,
      required this.optionOfSuccessOrFailure});

// required LanguageModel? languageModel,
// required bool isLanguagesLoading,
// required List<LanguageModel> languages,
  @override
  final PackageInfo? packageInfo;
  @override
  final bool isLoading;
  @override
  final bool showError;
  @override
  final Option<Either<AlertModel, Unit>> optionOfSuccessOrFailure;

  @override
  String toString() {
    return 'SettingsFormState(packageInfo: $packageInfo, isLoading: $isLoading, showError: $showError, optionOfSuccessOrFailure: $optionOfSuccessOrFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsFormStateImpl &&
            (identical(other.packageInfo, packageInfo) ||
                other.packageInfo == packageInfo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.showError, showError) ||
                other.showError == showError) &&
            (identical(
                    other.optionOfSuccessOrFailure, optionOfSuccessOrFailure) ||
                other.optionOfSuccessOrFailure == optionOfSuccessOrFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, packageInfo, isLoading, showError, optionOfSuccessOrFailure);

  /// Create a copy of SettingsFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsFormStateImplCopyWith<_$SettingsFormStateImpl> get copyWith =>
      __$$SettingsFormStateImplCopyWithImpl<_$SettingsFormStateImpl>(
          this, _$identity);
}

abstract class _SettingsFormState implements SettingsFormState {
  factory _SettingsFormState(
      {required final PackageInfo? packageInfo,
      required final bool isLoading,
      required final bool showError,
      required final Option<Either<AlertModel, Unit>>
          optionOfSuccessOrFailure}) = _$SettingsFormStateImpl;

// required LanguageModel? languageModel,
// required bool isLanguagesLoading,
// required List<LanguageModel> languages,
  @override
  PackageInfo? get packageInfo;
  @override
  bool get isLoading;
  @override
  bool get showError;
  @override
  Option<Either<AlertModel, Unit>> get optionOfSuccessOrFailure;

  /// Create a copy of SettingsFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsFormStateImplCopyWith<_$SettingsFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
