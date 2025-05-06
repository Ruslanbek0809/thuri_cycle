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
  UserModel get userModelForEditing => throw _privateConstructorUsedError;
  ImageWithFileModel? get userImageWithFileModel =>
      throw _privateConstructorUsedError;
  bool get isDeleteUserImageTriggered => throw _privateConstructorUsedError;
  PhoneController? get userPhone => throw _privateConstructorUsedError;
  bool get isGettingPhoneVerificationCode => throw _privateConstructorUsedError;
  bool get isPhoneVerifying => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
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
      UserModel userModelForEditing,
      ImageWithFileModel? userImageWithFileModel,
      bool isDeleteUserImageTriggered,
      PhoneController? userPhone,
      bool isGettingPhoneVerificationCode,
      bool isPhoneVerifying,
      bool isLoading,
      bool isSubmitting,
      Option<Either<FirebaseFailure, Unit>> failureOrSuccessOption});

  $UserModelCopyWith<$Res> get userModel;
  $UserModelCopyWith<$Res> get userModelForEditing;
  $ImageWithFileModelCopyWith<$Res>? get userImageWithFileModel;
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
    Object? userModelForEditing = null,
    Object? userImageWithFileModel = freezed,
    Object? isDeleteUserImageTriggered = null,
    Object? userPhone = freezed,
    Object? isGettingPhoneVerificationCode = null,
    Object? isPhoneVerifying = null,
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      userModelForEditing: null == userModelForEditing
          ? _value.userModelForEditing
          : userModelForEditing // ignore: cast_nullable_to_non_nullable
              as UserModel,
      userImageWithFileModel: freezed == userImageWithFileModel
          ? _value.userImageWithFileModel
          : userImageWithFileModel // ignore: cast_nullable_to_non_nullable
              as ImageWithFileModel?,
      isDeleteUserImageTriggered: null == isDeleteUserImageTriggered
          ? _value.isDeleteUserImageTriggered
          : isDeleteUserImageTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as PhoneController?,
      isGettingPhoneVerificationCode: null == isGettingPhoneVerificationCode
          ? _value.isGettingPhoneVerificationCode
          : isGettingPhoneVerificationCode // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneVerifying: null == isPhoneVerifying
          ? _value.isPhoneVerifying
          : isPhoneVerifying // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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

  /// Create a copy of ProfileUserFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get userModelForEditing {
    return $UserModelCopyWith<$Res>(_value.userModelForEditing, (value) {
      return _then(_value.copyWith(userModelForEditing: value) as $Val);
    });
  }

  /// Create a copy of ProfileUserFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageWithFileModelCopyWith<$Res>? get userImageWithFileModel {
    if (_value.userImageWithFileModel == null) {
      return null;
    }

    return $ImageWithFileModelCopyWith<$Res>(_value.userImageWithFileModel!,
        (value) {
      return _then(_value.copyWith(userImageWithFileModel: value) as $Val);
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
      UserModel userModelForEditing,
      ImageWithFileModel? userImageWithFileModel,
      bool isDeleteUserImageTriggered,
      PhoneController? userPhone,
      bool isGettingPhoneVerificationCode,
      bool isPhoneVerifying,
      bool isLoading,
      bool isSubmitting,
      Option<Either<FirebaseFailure, Unit>> failureOrSuccessOption});

  @override
  $UserModelCopyWith<$Res> get userModel;
  @override
  $UserModelCopyWith<$Res> get userModelForEditing;
  @override
  $ImageWithFileModelCopyWith<$Res>? get userImageWithFileModel;
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
    Object? userModelForEditing = null,
    Object? userImageWithFileModel = freezed,
    Object? isDeleteUserImageTriggered = null,
    Object? userPhone = freezed,
    Object? isGettingPhoneVerificationCode = null,
    Object? isPhoneVerifying = null,
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$ProfileUserFormStateImpl(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      userModelForEditing: null == userModelForEditing
          ? _value.userModelForEditing
          : userModelForEditing // ignore: cast_nullable_to_non_nullable
              as UserModel,
      userImageWithFileModel: freezed == userImageWithFileModel
          ? _value.userImageWithFileModel
          : userImageWithFileModel // ignore: cast_nullable_to_non_nullable
              as ImageWithFileModel?,
      isDeleteUserImageTriggered: null == isDeleteUserImageTriggered
          ? _value.isDeleteUserImageTriggered
          : isDeleteUserImageTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as PhoneController?,
      isGettingPhoneVerificationCode: null == isGettingPhoneVerificationCode
          ? _value.isGettingPhoneVerificationCode
          : isGettingPhoneVerificationCode // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneVerifying: null == isPhoneVerifying
          ? _value.isPhoneVerifying
          : isPhoneVerifying // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
      required this.userModelForEditing,
      required this.userImageWithFileModel,
      required this.isDeleteUserImageTriggered,
      required this.userPhone,
      required this.isGettingPhoneVerificationCode,
      required this.isPhoneVerifying,
      required this.isLoading,
      required this.isSubmitting,
      required this.failureOrSuccessOption});

  @override
  final UserModel userModel;
  @override
  final UserModel userModelForEditing;
  @override
  final ImageWithFileModel? userImageWithFileModel;
  @override
  final bool isDeleteUserImageTriggered;
  @override
  final PhoneController? userPhone;
  @override
  final bool isGettingPhoneVerificationCode;
  @override
  final bool isPhoneVerifying;
  @override
  final bool isLoading;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<FirebaseFailure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ProfileUserFormState(userModel: $userModel, userModelForEditing: $userModelForEditing, userImageWithFileModel: $userImageWithFileModel, isDeleteUserImageTriggered: $isDeleteUserImageTriggered, userPhone: $userPhone, isGettingPhoneVerificationCode: $isGettingPhoneVerificationCode, isPhoneVerifying: $isPhoneVerifying, isLoading: $isLoading, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUserFormStateImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.userModelForEditing, userModelForEditing) ||
                other.userModelForEditing == userModelForEditing) &&
            (identical(other.userImageWithFileModel, userImageWithFileModel) ||
                other.userImageWithFileModel == userImageWithFileModel) &&
            (identical(other.isDeleteUserImageTriggered,
                    isDeleteUserImageTriggered) ||
                other.isDeleteUserImageTriggered ==
                    isDeleteUserImageTriggered) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.isGettingPhoneVerificationCode,
                    isGettingPhoneVerificationCode) ||
                other.isGettingPhoneVerificationCode ==
                    isGettingPhoneVerificationCode) &&
            (identical(other.isPhoneVerifying, isPhoneVerifying) ||
                other.isPhoneVerifying == isPhoneVerifying) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userModel,
      userModelForEditing,
      userImageWithFileModel,
      isDeleteUserImageTriggered,
      userPhone,
      isGettingPhoneVerificationCode,
      isPhoneVerifying,
      isLoading,
      isSubmitting,
      failureOrSuccessOption);

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
      required final UserModel userModelForEditing,
      required final ImageWithFileModel? userImageWithFileModel,
      required final bool isDeleteUserImageTriggered,
      required final PhoneController? userPhone,
      required final bool isGettingPhoneVerificationCode,
      required final bool isPhoneVerifying,
      required final bool isLoading,
      required final bool isSubmitting,
      required final Option<Either<FirebaseFailure, Unit>>
          failureOrSuccessOption}) = _$ProfileUserFormStateImpl;

  @override
  UserModel get userModel;
  @override
  UserModel get userModelForEditing;
  @override
  ImageWithFileModel? get userImageWithFileModel;
  @override
  bool get isDeleteUserImageTriggered;
  @override
  PhoneController? get userPhone;
  @override
  bool get isGettingPhoneVerificationCode;
  @override
  bool get isPhoneVerifying;
  @override
  bool get isLoading;
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
