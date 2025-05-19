import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
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

String mapFailureToMessage(BuildContext context, FirebaseFailure failure) {
  return failure.when(
    unexpected: () => context.l10n.smthWentWrong,
    permissionDenied: () => context.l10n.doNotHavePermission,
    notFound: () => context.l10n.requestedItemNotFound,
    networkError: () => context.l10n.networkError,
    userNotFound: () => context.l10n.userNotFound,
    custom: (msg) => msg,
  );
  // failure.maybeMap(
  //   insufficientPermission: (_) => 'Insufficient permissions',
  //   orElse: () => 'Unexpected error. \nPlease, contact support.',
  // );
}
