import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

typedef FirebaseRepoFunction<T> = Future<T> Function();

Future<Either<FirebaseFailure, T>> firebaseFailureHandler<T>(
  FirebaseRepoFunction<T> repoFunction,
) async {
  try {
    final result = await repoFunction();
    return right(result);
  } on FirebaseException catch (e, _) {
    // reportException(e);

    switch (e.code) {
      case 'permission-denied':
        return left(const FirebaseFailure.permissionDenied());
      case 'not-found':
        return left(const FirebaseFailure.notFound());
      case 'unavailable':
        return left(const FirebaseFailure.networkError());
      default:
        talker.handle('FirebaseException FirebaseFailure.custom: $e');
        return left(FirebaseFailure.custom(e.message ?? 'Unexpected error'));
    }
  } catch (e, stackTrace) {
    // reportException(e);
    talker.handle('FirebaseFailure.unexpected: $e', stackTrace);

    return left(const FirebaseFailure.unexpected());
  }
}

String mapFailureToMessage(FirebaseFailure failure) {
  return failure.when(
    unexpected: () => 'Something went wrong.',
    permissionDenied: () => 'You do not have permission.',
    notFound: () => 'Requested item not found.',
    networkError: () => 'Network error. Please try again later.',
    custom: (msg) => msg,
  );
  // failure.maybeMap(
  //   insufficientPermission: (_) => 'Insufficient permissions',
  //   orElse: () => 'Unexpected error. \nPlease, contact support.',
  // );
}
