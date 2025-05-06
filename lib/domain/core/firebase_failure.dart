import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_failure.freezed.dart';

@freezed
class FirebaseFailure with _$FirebaseFailure {
  const factory FirebaseFailure.unexpected() = _Unexpected;
  const factory FirebaseFailure.permissionDenied() = _PermissionDenied;
  const factory FirebaseFailure.notFound() = _NotFound;
  const factory FirebaseFailure.networkError() = _NetworkError;
  const factory FirebaseFailure.userNotFound() = _UserNotFound;
  const factory FirebaseFailure.custom(String message) = _Custom;
}
