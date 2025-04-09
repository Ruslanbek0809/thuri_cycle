// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:thuri_cycle/domain/core/errors.dart';
// import 'package:thuri_cycle/domain/core/failures.dart';
// import 'package:uuid/uuid.dart';

// // NOT USED ValueObject YET
// @immutable
// abstract class ValueObject<T> {
//   const ValueObject();
//   Either<ValueFailure<T>, T> get value;

//   /// Throws [UnexpectedValueError] containing the [ValueFailure]
//   T getOrCrash() {
//     // id = identitiy - same as writing (r) => r
//     return value.fold(
//       (l) => throw UnexpectedValueError(l),
//       id,
//     );
//   }

//   Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
//     return value.fold(
//       left,
//       (r) => right(unit),
//     );
//   }

//   bool isValid() => value.isRight();

//   @override
//   bool operator ==(covariant ValueObject other) {
//     if (identical(this, other)) return true;

//     return other.value == value;
//   }

//   @override
//   int get hashCode => value.hashCode;

//   @override
//   String toString() => 'ValueObject(value: $value)';
// }

// class UniqueId extends ValueObject<String> {
//   factory UniqueId() {
//     return UniqueId._(
//       right(const Uuid().v1()),
//     );
//   }

//   const UniqueId._(this.value);

//   factory UniqueId.fromUniqueString(String? uniqueId) {
//     assert(uniqueId != null);
//     return UniqueId._(
//       right(uniqueId!),
//     );
//   }

//   @override
//   final Either<ValueFailure<String>, String> value;
// }
