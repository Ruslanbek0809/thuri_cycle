import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart';
import 'package:thuri_cycle/domain/auth/auth_failure.dart';

abstract class IAuth {
  // Future<Option<FirebaseUser>> getSignedInUser();

  Future<String?> getStoredAuthToken({bool forceRefresh = false});
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, String?>> getSignedInUserIdToken(
    User firebaseUser,
  );

  Future<Either<AuthFailure, SignInMethod>> signInWithGoogle();
  Future<Either<AuthFailure, SignInMethod>> signInWithApple();

  // Future<void> verifyPhone({
  //   required String phoneNumber,
  //   required void Function(PhoneAuthCredential) verificationCompleted,
  //   required void Function(FirebaseAuthException) verificationFailed,
  //   required void Function(String, int?) codeSent,
  //   required void Function(String) codeAutoRetrievalTimeout,
  //   int? forceResendingToken,
  // });

  Future<void> signOut();

  // Future<Either<AlertModel, UserModel>> updateUserImageFile(
  //   UserModel userModel,
  //   XFile? userImageFile,
  // );
  // Future<Either<AlertModel, UserModel>> getProfileUser();
  // Future<Either<AlertModel, UploadedImageModel>> uploadBusinessImage(
  //   CroppedFile? croppedFile,
  // );
  // Future<Either<UploadImageErrorModel, Map<String, dynamic>>>
  //     uploadBusinessImages(
  //   List<CroppedFile?> croppedImageFiles,
  // );
  // Future<Either<AlertModel, UserModel>> updateProfileUser(
  //   UserModel userModel,
  //   // XFile? userImageFile,
  //   // bool isDeleteUserImageTriggered,
  //   // XFile? backgroundImageFile,
  //   // bool isDeleteUserBackgroundImageTriggered,
  // );

  // Future<Either<AlertModel, Unit>> deleteUser();
}
