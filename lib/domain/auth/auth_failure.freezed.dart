// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthFailure {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthFailure()';
  }
}

/// @nodoc
class $AuthFailureCopyWith<$Res> {
  $AuthFailureCopyWith(AuthFailure _, $Res Function(AuthFailure) __);
}

/// @nodoc

class CancelledByUser implements AuthFailure {
  const CancelledByUser();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CancelledByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthFailure.cancelledByUser()';
  }
}

/// @nodoc

class ServerError implements AuthFailure {
  const ServerError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }
}

/// @nodoc

class EmailAlreadyInUse implements AuthFailure {
  const EmailAlreadyInUse();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthFailure.emailAlreadyInUse()';
  }
}

/// @nodoc

class InvalidEmailAndPasswordCombination implements AuthFailure {
  const InvalidEmailAndPasswordCombination();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidEmailAndPasswordCombination);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthFailure.invalidEmailAndPasswordCombination()';
  }
}

/// @nodoc

class InvalidPhoneNumber implements AuthFailure {
  const InvalidPhoneNumber();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InvalidPhoneNumber);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthFailure.invalidPhoneNumber()';
  }
}

/// @nodoc

class TooManyRequests implements AuthFailure {
  const TooManyRequests();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TooManyRequests);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthFailure.tooManyRequests()';
  }
}

// dart format on
