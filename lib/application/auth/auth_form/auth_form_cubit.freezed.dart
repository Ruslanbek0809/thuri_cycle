// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthFormState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  int? get forceResendingToken => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, SignInMethod>> get optionOfSuccessOrFailure =>
      throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>>
      get fbPhoneAuthLoginOptionOfSuccessOrFailure =>
          throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>>
      get fbPhoneAuthOtpOptionOfSuccessOrFailure =>
          throw _privateConstructorUsedError;
  Option<Either<AuthFailure, SignInMethod>>
      get otpVerificationOptionOfSuccessOrFailure =>
          throw _privateConstructorUsedError;

  /// Create a copy of AuthFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthFormStateCopyWith<AuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFormStateCopyWith<$Res> {
  factory $AuthFormStateCopyWith(
          AuthFormState value, $Res Function(AuthFormState) then) =
      _$AuthFormStateCopyWithImpl<$Res, AuthFormState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? verificationId,
      int? forceResendingToken,
      Option<Either<AuthFailure, SignInMethod>> optionOfSuccessOrFailure,
      Option<Either<AuthFailure, Unit>>
          fbPhoneAuthLoginOptionOfSuccessOrFailure,
      Option<Either<AuthFailure, Unit>> fbPhoneAuthOtpOptionOfSuccessOrFailure,
      Option<Either<AuthFailure, SignInMethod>>
          otpVerificationOptionOfSuccessOrFailure});
}

/// @nodoc
class _$AuthFormStateCopyWithImpl<$Res, $Val extends AuthFormState>
    implements $AuthFormStateCopyWith<$Res> {
  _$AuthFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? otpVerificationOptionOfSuccessOrFailure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      forceResendingToken: freezed == forceResendingToken
          ? _value.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
      optionOfSuccessOrFailure: null == optionOfSuccessOrFailure
          ? _value.optionOfSuccessOrFailure
          : optionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, SignInMethod>>,
      fbPhoneAuthLoginOptionOfSuccessOrFailure: null ==
              fbPhoneAuthLoginOptionOfSuccessOrFailure
          ? _value.fbPhoneAuthLoginOptionOfSuccessOrFailure
          : fbPhoneAuthLoginOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      fbPhoneAuthOtpOptionOfSuccessOrFailure: null ==
              fbPhoneAuthOtpOptionOfSuccessOrFailure
          ? _value.fbPhoneAuthOtpOptionOfSuccessOrFailure
          : fbPhoneAuthOtpOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      otpVerificationOptionOfSuccessOrFailure: null ==
              otpVerificationOptionOfSuccessOrFailure
          ? _value.otpVerificationOptionOfSuccessOrFailure
          : otpVerificationOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, SignInMethod>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? verificationId,
      int? forceResendingToken,
      Option<Either<AuthFailure, SignInMethod>> optionOfSuccessOrFailure,
      Option<Either<AuthFailure, Unit>>
          fbPhoneAuthLoginOptionOfSuccessOrFailure,
      Option<Either<AuthFailure, Unit>> fbPhoneAuthOtpOptionOfSuccessOrFailure,
      Option<Either<AuthFailure, SignInMethod>>
          otpVerificationOptionOfSuccessOrFailure});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthFormStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

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
    Object? otpVerificationOptionOfSuccessOrFailure = null,
  }) {
    return _then(_$AuthStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      forceResendingToken: freezed == forceResendingToken
          ? _value.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
      optionOfSuccessOrFailure: null == optionOfSuccessOrFailure
          ? _value.optionOfSuccessOrFailure
          : optionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, SignInMethod>>,
      fbPhoneAuthLoginOptionOfSuccessOrFailure: null ==
              fbPhoneAuthLoginOptionOfSuccessOrFailure
          ? _value.fbPhoneAuthLoginOptionOfSuccessOrFailure
          : fbPhoneAuthLoginOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      fbPhoneAuthOtpOptionOfSuccessOrFailure: null ==
              fbPhoneAuthOtpOptionOfSuccessOrFailure
          ? _value.fbPhoneAuthOtpOptionOfSuccessOrFailure
          : fbPhoneAuthOtpOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      otpVerificationOptionOfSuccessOrFailure: null ==
              otpVerificationOptionOfSuccessOrFailure
          ? _value.otpVerificationOptionOfSuccessOrFailure
          : otpVerificationOptionOfSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, SignInMethod>>,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  _$AuthStateImpl(
      {required this.isLoading,
      required this.verificationId,
      required this.forceResendingToken,
      required this.optionOfSuccessOrFailure,
      required this.fbPhoneAuthLoginOptionOfSuccessOrFailure,
      required this.fbPhoneAuthOtpOptionOfSuccessOrFailure,
      required this.otpVerificationOptionOfSuccessOrFailure});

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
  @override
  final Option<Either<AuthFailure, SignInMethod>>
      otpVerificationOptionOfSuccessOrFailure;

  @override
  String toString() {
    return 'AuthFormState(isLoading: $isLoading, verificationId: $verificationId, forceResendingToken: $forceResendingToken, optionOfSuccessOrFailure: $optionOfSuccessOrFailure, fbPhoneAuthLoginOptionOfSuccessOrFailure: $fbPhoneAuthLoginOptionOfSuccessOrFailure, fbPhoneAuthOtpOptionOfSuccessOrFailure: $fbPhoneAuthOtpOptionOfSuccessOrFailure, otpVerificationOptionOfSuccessOrFailure: $otpVerificationOptionOfSuccessOrFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
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
                    fbPhoneAuthOtpOptionOfSuccessOrFailure) &&
            (identical(other.otpVerificationOptionOfSuccessOrFailure,
                    otpVerificationOptionOfSuccessOrFailure) ||
                other.otpVerificationOptionOfSuccessOrFailure ==
                    otpVerificationOptionOfSuccessOrFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      verificationId,
      forceResendingToken,
      optionOfSuccessOrFailure,
      fbPhoneAuthLoginOptionOfSuccessOrFailure,
      fbPhoneAuthOtpOptionOfSuccessOrFailure,
      otpVerificationOptionOfSuccessOrFailure);

  /// Create a copy of AuthFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthFormState {
  factory _AuthState(
      {required final bool isLoading,
      required final String? verificationId,
      required final int? forceResendingToken,
      required final Option<Either<AuthFailure, SignInMethod>>
          optionOfSuccessOrFailure,
      required final Option<Either<AuthFailure, Unit>>
          fbPhoneAuthLoginOptionOfSuccessOrFailure,
      required final Option<Either<AuthFailure, Unit>>
          fbPhoneAuthOtpOptionOfSuccessOrFailure,
      required final Option<Either<AuthFailure, SignInMethod>>
          otpVerificationOptionOfSuccessOrFailure}) = _$AuthStateImpl;

  @override
  bool get isLoading;
  @override
  String? get verificationId;
  @override
  int? get forceResendingToken;
  @override
  Option<Either<AuthFailure, SignInMethod>> get optionOfSuccessOrFailure;
  @override
  Option<Either<AuthFailure, Unit>>
      get fbPhoneAuthLoginOptionOfSuccessOrFailure;
  @override
  Option<Either<AuthFailure, Unit>> get fbPhoneAuthOtpOptionOfSuccessOrFailure;
  @override
  Option<Either<AuthFailure, SignInMethod>>
      get otpVerificationOptionOfSuccessOrFailure;

  /// Create a copy of AuthFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInMethod {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) google,
    required TResult Function(String name) apple,
    required TResult Function() firebaseOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? google,
    TResult? Function(String name)? apple,
    TResult? Function()? firebaseOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? google,
    TResult Function(String name)? apple,
    TResult Function()? firebaseOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleSignInMethod value) google,
    required TResult Function(_AppleSignInMethod value) apple,
    required TResult Function(_FirebaseOtpSignInMethod value) firebaseOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleSignInMethod value)? google,
    TResult? Function(_AppleSignInMethod value)? apple,
    TResult? Function(_FirebaseOtpSignInMethod value)? firebaseOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleSignInMethod value)? google,
    TResult Function(_AppleSignInMethod value)? apple,
    TResult Function(_FirebaseOtpSignInMethod value)? firebaseOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInMethodCopyWith<$Res> {
  factory $SignInMethodCopyWith(
          SignInMethod value, $Res Function(SignInMethod) then) =
      _$SignInMethodCopyWithImpl<$Res, SignInMethod>;
}

/// @nodoc
class _$SignInMethodCopyWithImpl<$Res, $Val extends SignInMethod>
    implements $SignInMethodCopyWith<$Res> {
  _$SignInMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GoogleSignInMethodImplCopyWith<$Res> {
  factory _$$GoogleSignInMethodImplCopyWith(_$GoogleSignInMethodImpl value,
          $Res Function(_$GoogleSignInMethodImpl) then) =
      __$$GoogleSignInMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$GoogleSignInMethodImplCopyWithImpl<$Res>
    extends _$SignInMethodCopyWithImpl<$Res, _$GoogleSignInMethodImpl>
    implements _$$GoogleSignInMethodImplCopyWith<$Res> {
  __$$GoogleSignInMethodImplCopyWithImpl(_$GoogleSignInMethodImpl _value,
      $Res Function(_$GoogleSignInMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$GoogleSignInMethodImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GoogleSignInMethodImpl implements _GoogleSignInMethod {
  const _$GoogleSignInMethodImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'SignInMethod.google(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInMethodImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSignInMethodImplCopyWith<_$GoogleSignInMethodImpl> get copyWith =>
      __$$GoogleSignInMethodImplCopyWithImpl<_$GoogleSignInMethodImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) google,
    required TResult Function(String name) apple,
    required TResult Function() firebaseOtp,
  }) {
    return google(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? google,
    TResult? Function(String name)? apple,
    TResult? Function()? firebaseOtp,
  }) {
    return google?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? google,
    TResult Function(String name)? apple,
    TResult Function()? firebaseOtp,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleSignInMethod value) google,
    required TResult Function(_AppleSignInMethod value) apple,
    required TResult Function(_FirebaseOtpSignInMethod value) firebaseOtp,
  }) {
    return google(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleSignInMethod value)? google,
    TResult? Function(_AppleSignInMethod value)? apple,
    TResult? Function(_FirebaseOtpSignInMethod value)? firebaseOtp,
  }) {
    return google?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleSignInMethod value)? google,
    TResult Function(_AppleSignInMethod value)? apple,
    TResult Function(_FirebaseOtpSignInMethod value)? firebaseOtp,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(this);
    }
    return orElse();
  }
}

abstract class _GoogleSignInMethod implements SignInMethod {
  const factory _GoogleSignInMethod(final String name) =
      _$GoogleSignInMethodImpl;

  String get name;

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleSignInMethodImplCopyWith<_$GoogleSignInMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppleSignInMethodImplCopyWith<$Res> {
  factory _$$AppleSignInMethodImplCopyWith(_$AppleSignInMethodImpl value,
          $Res Function(_$AppleSignInMethodImpl) then) =
      __$$AppleSignInMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$AppleSignInMethodImplCopyWithImpl<$Res>
    extends _$SignInMethodCopyWithImpl<$Res, _$AppleSignInMethodImpl>
    implements _$$AppleSignInMethodImplCopyWith<$Res> {
  __$$AppleSignInMethodImplCopyWithImpl(_$AppleSignInMethodImpl _value,
      $Res Function(_$AppleSignInMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$AppleSignInMethodImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppleSignInMethodImpl implements _AppleSignInMethod {
  const _$AppleSignInMethodImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'SignInMethod.apple(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleSignInMethodImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleSignInMethodImplCopyWith<_$AppleSignInMethodImpl> get copyWith =>
      __$$AppleSignInMethodImplCopyWithImpl<_$AppleSignInMethodImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) google,
    required TResult Function(String name) apple,
    required TResult Function() firebaseOtp,
  }) {
    return apple(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? google,
    TResult? Function(String name)? apple,
    TResult? Function()? firebaseOtp,
  }) {
    return apple?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? google,
    TResult Function(String name)? apple,
    TResult Function()? firebaseOtp,
    required TResult orElse(),
  }) {
    if (apple != null) {
      return apple(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleSignInMethod value) google,
    required TResult Function(_AppleSignInMethod value) apple,
    required TResult Function(_FirebaseOtpSignInMethod value) firebaseOtp,
  }) {
    return apple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleSignInMethod value)? google,
    TResult? Function(_AppleSignInMethod value)? apple,
    TResult? Function(_FirebaseOtpSignInMethod value)? firebaseOtp,
  }) {
    return apple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleSignInMethod value)? google,
    TResult Function(_AppleSignInMethod value)? apple,
    TResult Function(_FirebaseOtpSignInMethod value)? firebaseOtp,
    required TResult orElse(),
  }) {
    if (apple != null) {
      return apple(this);
    }
    return orElse();
  }
}

abstract class _AppleSignInMethod implements SignInMethod {
  const factory _AppleSignInMethod(final String name) = _$AppleSignInMethodImpl;

  String get name;

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppleSignInMethodImplCopyWith<_$AppleSignInMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseOtpSignInMethodImplCopyWith<$Res> {
  factory _$$FirebaseOtpSignInMethodImplCopyWith(
          _$FirebaseOtpSignInMethodImpl value,
          $Res Function(_$FirebaseOtpSignInMethodImpl) then) =
      __$$FirebaseOtpSignInMethodImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FirebaseOtpSignInMethodImplCopyWithImpl<$Res>
    extends _$SignInMethodCopyWithImpl<$Res, _$FirebaseOtpSignInMethodImpl>
    implements _$$FirebaseOtpSignInMethodImplCopyWith<$Res> {
  __$$FirebaseOtpSignInMethodImplCopyWithImpl(
      _$FirebaseOtpSignInMethodImpl _value,
      $Res Function(_$FirebaseOtpSignInMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInMethod
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FirebaseOtpSignInMethodImpl implements _FirebaseOtpSignInMethod {
  const _$FirebaseOtpSignInMethodImpl();

  @override
  String toString() {
    return 'SignInMethod.firebaseOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseOtpSignInMethodImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) google,
    required TResult Function(String name) apple,
    required TResult Function() firebaseOtp,
  }) {
    return firebaseOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? google,
    TResult? Function(String name)? apple,
    TResult? Function()? firebaseOtp,
  }) {
    return firebaseOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? google,
    TResult Function(String name)? apple,
    TResult Function()? firebaseOtp,
    required TResult orElse(),
  }) {
    if (firebaseOtp != null) {
      return firebaseOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleSignInMethod value) google,
    required TResult Function(_AppleSignInMethod value) apple,
    required TResult Function(_FirebaseOtpSignInMethod value) firebaseOtp,
  }) {
    return firebaseOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleSignInMethod value)? google,
    TResult? Function(_AppleSignInMethod value)? apple,
    TResult? Function(_FirebaseOtpSignInMethod value)? firebaseOtp,
  }) {
    return firebaseOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleSignInMethod value)? google,
    TResult Function(_AppleSignInMethod value)? apple,
    TResult Function(_FirebaseOtpSignInMethod value)? firebaseOtp,
    required TResult orElse(),
  }) {
    if (firebaseOtp != null) {
      return firebaseOtp(this);
    }
    return orElse();
  }
}

abstract class _FirebaseOtpSignInMethod implements SignInMethod {
  const factory _FirebaseOtpSignInMethod() = _$FirebaseOtpSignInMethodImpl;
}
