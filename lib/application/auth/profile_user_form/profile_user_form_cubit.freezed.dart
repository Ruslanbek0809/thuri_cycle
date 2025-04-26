// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_user_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileUserFormState {
  UserModel get userModel => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<FirebaseFailure, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProfileUserFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileUserFormStateCopyWith<ProfileUserFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileUserFormStateCopyWith<$Res> {
  factory $ProfileUserFormStateCopyWith(ProfileUserFormState value,
          $Res Function(ProfileUserFormState) then) =
      _$ProfileUserFormStateCopyWithImpl<$Res, ProfileUserFormState>;
  @useResult
  $Res call(
      {UserModel userModel,
      bool isSubmitting,
      Option<Either<FirebaseFailure, Unit>> failureOrSuccessOption});

  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class _$ProfileUserFormStateCopyWithImpl<$Res,
        $Val extends ProfileUserFormState>
    implements $ProfileUserFormStateCopyWith<$Res> {
  _$ProfileUserFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileUserFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FirebaseFailure, Unit>>,
    ) as $Val);
  }

  /// Create a copy of ProfileUserFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get userModel {
    return $UserModelCopyWith<$Res>(_value.userModel, (value) {
      return _then(_value.copyWith(userModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileUserFormStateImplCopyWith<$Res>
    implements $ProfileUserFormStateCopyWith<$Res> {
  factory _$$ProfileUserFormStateImplCopyWith(_$ProfileUserFormStateImpl value,
          $Res Function(_$ProfileUserFormStateImpl) then) =
      __$$ProfileUserFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel userModel,
      bool isSubmitting,
      Option<Either<FirebaseFailure, Unit>> failureOrSuccessOption});

  @override
  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class __$$ProfileUserFormStateImplCopyWithImpl<$Res>
    extends _$ProfileUserFormStateCopyWithImpl<$Res, _$ProfileUserFormStateImpl>
    implements _$$ProfileUserFormStateImplCopyWith<$Res> {
  __$$ProfileUserFormStateImplCopyWithImpl(_$ProfileUserFormStateImpl _value,
      $Res Function(_$ProfileUserFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileUserFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$ProfileUserFormStateImpl(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FirebaseFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$ProfileUserFormStateImpl implements _ProfileUserFormState {
  _$ProfileUserFormStateImpl(
      {required this.userModel,
      required this.isSubmitting,
      required this.failureOrSuccessOption});

  @override
  final UserModel userModel;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<FirebaseFailure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ProfileUserFormState(userModel: $userModel, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUserFormStateImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userModel, isSubmitting, failureOrSuccessOption);

  /// Create a copy of ProfileUserFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUserFormStateImplCopyWith<_$ProfileUserFormStateImpl>
      get copyWith =>
          __$$ProfileUserFormStateImplCopyWithImpl<_$ProfileUserFormStateImpl>(
              this, _$identity);
}

abstract class _ProfileUserFormState implements ProfileUserFormState {
  factory _ProfileUserFormState(
      {required final UserModel userModel,
      required final bool isSubmitting,
      required final Option<Either<FirebaseFailure, Unit>>
          failureOrSuccessOption}) = _$ProfileUserFormStateImpl;

  @override
  UserModel get userModel;
  @override
  bool get isSubmitting;
  @override
  Option<Either<FirebaseFailure, Unit>> get failureOrSuccessOption;

  /// Create a copy of ProfileUserFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileUserFormStateImplCopyWith<_$ProfileUserFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
