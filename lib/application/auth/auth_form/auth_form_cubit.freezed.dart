// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthFormState {
  bool get isLoading;
  String? get verificationId;
  int? get forceResendingToken;
  Option<Either<AuthFailure, SignInMethod>> get optionOfSuccessOrFailure;
  Option<Either<AuthFailure, Unit>>
      get fbPhoneAuthLoginOptionOfSuccessOrFailure;
  Option<Either<AuthFailure, Unit>> get fbPhoneAuthOtpOptionOfSuccessOrFailure;

  /// Create a copy of AuthFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthFormStateCopyWith<AuthFormState> get copyWith =>
      _$AuthFormStateCopyWithImpl<AuthFormState>(
          this as AuthFormState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthFormState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.forceResendingToken, forceResendingToken) ||
                other.forceResendingToken == forceResendingToken) &&
            (identical(
                    other.optionOfSuccessOrFailure, optionOfSuccessOrFailure) ||
                other.optionOfSuccessOrFailure == optionOfSuccessOrFailure) &&
            (identical(other.fbPhoneAuthLoginOptionOfSuccessOrFailure,
                    fbPhoneAuthLoginOptionOfSuccessOrFailure) ||
                other.fbPhoneAuthLoginOptionOfSuccessOrFailure ==
                    fbPhoneAuthLoginOptionOfSuccessOrFailure) &&
            (identical(other.fbPhoneAuthOtpOptionOfSuccessOrFailure,
                    fbPhoneAuthOtpOptionOfSuccessOrFailure) ||
                other.fbPhoneAuthOtpOptionOfSuccessOrFailure ==
                    fbPhoneAuthOtpOptionOfSuccessOrFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      verificationId,
      forceResendingToken,
      optionOfSuccessOrFailure,
      fbPhoneAuthLoginOptionOfSuccessOrFailure,
      fbPhoneAuthOtpOptionOfSuccessOrFailure);

  @override
  String toString() {
    return 'AuthFormState(isLoading: $isLoading, verificationId: $verificationId, forceResendingToken: $forceResendingToken, optionOfSuccessOrFailure: $optionOfSuccessOrFailure, fbPhoneAuthLoginOptionOfSuccessOrFailure: $fbPhoneAuthLoginOptionOfSuccessOrFailure, fbPhoneAuthOtpOptionOfSuccessOrFailure: $fbPhoneAuthOtpOptionOfSuccessOrFailure)';
  }
}

/// @nodoc
abstract mixin class $AuthFormStateCopyWith<$Res> {
  factory $AuthFormStateCopyWith(
          AuthFormState value, $Res Function(AuthFormState) _then) =
      _$AuthFormStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String? verificationId,
      int? forceResendingToken,
      Option<Either<AuthFailure, SignInMethod>> optionOfSuccessOrFailure,
      Option<Either<AuthFailure, Unit>>
          fbPhoneAuthLoginOptionOfSuccessOrFailure,
      Option<Either<AuthFailure, Unit>>
          fbPhoneAuthOtpOptionOfSuccessOrFailure});
}

/// @nodoc
class _$AuthFormStateCopyWithImpl<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  _$AuthFormStateCopyWithImpl(this._self, this._then);

  final AuthFormState _self;
  final $Res Function(AuthFormState) _then;

  /// Create a copy of AuthFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? verificationId = freezed,
    Object? forceResendingToken = freezed,
    Object? optionOfSuccessOrFailure = null,
    Object? fbPhoneAuthLoginOptionOfSuccessOrFailure = null,
    Object? fbPhoneAuthOtpOptionOfSuccessOrFailure = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationId: freezed == verificationId
          ? _self.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      forceResendingToken: freezed == forceResendingToken
          ? _self.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
      optionOfSuccessOrFailure: null == optionOfSuccessOrFailure
          ? _self.optionOfSuccessOrFailure
          : optionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, SignInMethod>>,
      fbPhoneAuthLoginOptionOfSuccessOrFailure: null ==
              fbPhoneAuthLoginOptionOfSuccessOrFailure
          ? _self.fbPhoneAuthLoginOptionOfSuccessOrFailure
          : fbPhoneAuthLoginOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      fbPhoneAuthOtpOptionOfSuccessOrFailure: null ==
              fbPhoneAuthOtpOptionOfSuccessOrFailure
          ? _self.fbPhoneAuthOtpOptionOfSuccessOrFailure
          : fbPhoneAuthOtpOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _AuthState implements AuthFormState {
  _AuthState(
      {required this.isLoading,
      required this.verificationId,
      required this.forceResendingToken,
      required this.optionOfSuccessOrFailure,
      required this.fbPhoneAuthLoginOptionOfSuccessOrFailure,
      required this.fbPhoneAuthOtpOptionOfSuccessOrFailure});

  @override
  final bool isLoading;
  @override
  final String? verificationId;
  @override
  final int? forceResendingToken;
  @override
  final Option<Either<AuthFailure, SignInMethod>> optionOfSuccessOrFailure;
  @override
  final Option<Either<AuthFailure, Unit>>
      fbPhoneAuthLoginOptionOfSuccessOrFailure;
  @override
  final Option<Either<AuthFailure, Unit>>
      fbPhoneAuthOtpOptionOfSuccessOrFailure;

  /// Create a copy of AuthFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.forceResendingToken, forceResendingToken) ||
                other.forceResendingToken == forceResendingToken) &&
            (identical(
                    other.optionOfSuccessOrFailure, optionOfSuccessOrFailure) ||
                other.optionOfSuccessOrFailure == optionOfSuccessOrFailure) &&
            (identical(other.fbPhoneAuthLoginOptionOfSuccessOrFailure,
                    fbPhoneAuthLoginOptionOfSuccessOrFailure) ||
                other.fbPhoneAuthLoginOptionOfSuccessOrFailure ==
                    fbPhoneAuthLoginOptionOfSuccessOrFailure) &&
            (identical(other.fbPhoneAuthOtpOptionOfSuccessOrFailure,
                    fbPhoneAuthOtpOptionOfSuccessOrFailure) ||
                other.fbPhoneAuthOtpOptionOfSuccessOrFailure ==
                    fbPhoneAuthOtpOptionOfSuccessOrFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      verificationId,
      forceResendingToken,
      optionOfSuccessOrFailure,
      fbPhoneAuthLoginOptionOfSuccessOrFailure,
      fbPhoneAuthOtpOptionOfSuccessOrFailure);

  @override
  String toString() {
    return 'AuthFormState(isLoading: $isLoading, verificationId: $verificationId, forceResendingToken: $forceResendingToken, optionOfSuccessOrFailure: $optionOfSuccessOrFailure, fbPhoneAuthLoginOptionOfSuccessOrFailure: $fbPhoneAuthLoginOptionOfSuccessOrFailure, fbPhoneAuthOtpOptionOfSuccessOrFailure: $fbPhoneAuthOtpOptionOfSuccessOrFailure)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) _then) =
      __$AuthStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? verificationId,
      int? forceResendingToken,
      Option<Either<AuthFailure, SignInMethod>> optionOfSuccessOrFailure,
      Option<Either<AuthFailure, Unit>>
          fbPhoneAuthLoginOptionOfSuccessOrFailure,
      Option<Either<AuthFailure, Unit>>
          fbPhoneAuthOtpOptionOfSuccessOrFailure});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

  /// Create a copy of AuthFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? verificationId = freezed,
    Object? forceResendingToken = freezed,
    Object? optionOfSuccessOrFailure = null,
    Object? fbPhoneAuthLoginOptionOfSuccessOrFailure = null,
    Object? fbPhoneAuthOtpOptionOfSuccessOrFailure = null,
  }) {
    return _then(_AuthState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationId: freezed == verificationId
          ? _self.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      forceResendingToken: freezed == forceResendingToken
          ? _self.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
      optionOfSuccessOrFailure: null == optionOfSuccessOrFailure
          ? _self.optionOfSuccessOrFailure
          : optionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, SignInMethod>>,
      fbPhoneAuthLoginOptionOfSuccessOrFailure: null ==
              fbPhoneAuthLoginOptionOfSuccessOrFailure
          ? _self.fbPhoneAuthLoginOptionOfSuccessOrFailure
          : fbPhoneAuthLoginOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      fbPhoneAuthOtpOptionOfSuccessOrFailure: null ==
              fbPhoneAuthOtpOptionOfSuccessOrFailure
          ? _self.fbPhoneAuthOtpOptionOfSuccessOrFailure
          : fbPhoneAuthOtpOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
mixin _$SignInMethod {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInMethod);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInMethod()';
  }
}

/// @nodoc
class $SignInMethodCopyWith<$Res> {
  $SignInMethodCopyWith(SignInMethod _, $Res Function(SignInMethod) __);
}

/// @nodoc

class _GoogleSignInMethod implements SignInMethod {
  const _GoogleSignInMethod(this.name);

  final String name;

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GoogleSignInMethodCopyWith<_GoogleSignInMethod> get copyWith =>
      __$GoogleSignInMethodCopyWithImpl<_GoogleSignInMethod>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoogleSignInMethod &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @override
  String toString() {
    return 'SignInMethod.google(name: $name)';
  }
}

/// @nodoc
abstract mixin class _$GoogleSignInMethodCopyWith<$Res>
    implements $SignInMethodCopyWith<$Res> {
  factory _$GoogleSignInMethodCopyWith(
          _GoogleSignInMethod value, $Res Function(_GoogleSignInMethod) _then) =
      __$GoogleSignInMethodCopyWithImpl;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$GoogleSignInMethodCopyWithImpl<$Res>
    implements _$GoogleSignInMethodCopyWith<$Res> {
  __$GoogleSignInMethodCopyWithImpl(this._self, this._then);

  final _GoogleSignInMethod _self;
  final $Res Function(_GoogleSignInMethod) _then;

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
  }) {
    return _then(_GoogleSignInMethod(
      null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AppleSignInMethod implements SignInMethod {
  const _AppleSignInMethod(this.name);

  final String name;

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppleSignInMethodCopyWith<_AppleSignInMethod> get copyWith =>
      __$AppleSignInMethodCopyWithImpl<_AppleSignInMethod>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppleSignInMethod &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @override
  String toString() {
    return 'SignInMethod.apple(name: $name)';
  }
}

/// @nodoc
abstract mixin class _$AppleSignInMethodCopyWith<$Res>
    implements $SignInMethodCopyWith<$Res> {
  factory _$AppleSignInMethodCopyWith(
          _AppleSignInMethod value, $Res Function(_AppleSignInMethod) _then) =
      __$AppleSignInMethodCopyWithImpl;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$AppleSignInMethodCopyWithImpl<$Res>
    implements _$AppleSignInMethodCopyWith<$Res> {
  __$AppleSignInMethodCopyWithImpl(this._self, this._then);

  final _AppleSignInMethod _self;
  final $Res Function(_AppleSignInMethod) _then;

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
  }) {
    return _then(_AppleSignInMethod(
      null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _FirebaseOtpSignInMethod implements SignInMethod {
  const _FirebaseOtpSignInMethod();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FirebaseOtpSignInMethod);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInMethod.firebaseOtp()';
  }
}

// dart format on
