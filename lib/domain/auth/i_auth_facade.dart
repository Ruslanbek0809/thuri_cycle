import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart';
import 'package:thuri_cycle/domain/auth/auth_failure.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';

abstract class IAuth {
  Stream<Option<UserModel>> watchUserProfileFromFB();
  Future<Either<FirebaseFailure, UserModel>> updateProfileUser(
    UserModel user,
    ImageWithFileModel? newImage, {
    bool deleteImageTriggered = false,
  });
  Future<Option<UserModel>> getUserModelByID(String uid);
  // Future<Option<UserModel>> getUserModelFromFB();

  // Future<Option<FirebaseUser>> getSignedInUser();
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, String?>> getSignedInUserIdToken(
    User firebaseUser,
  );
  Future<Either<AuthFailure, SignInMethod>> signInWithGoogle();
  Future<Either<AuthFailure, SignInMethod>> signInWithApple();

  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
    int? forceResendingToken,
  });

  Future<Either<AuthFailure, SignInMethod>> verifyFbOtp({
    required String verificationId,
    required String otpCode,
  });

  Future<void> signOut();
}
