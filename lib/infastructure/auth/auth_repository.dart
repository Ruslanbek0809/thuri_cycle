import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart';
import 'package:thuri_cycle/domain/auth/auth_failure.dart';
import 'package:thuri_cycle/domain/auth/i_auth_facade.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/collections.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

// void reportExceptionToSentry(Object e) {
//   Sentry.captureException(e);
// }

//TODO: Allow read/write access to a document keyed by the user's UID
//TODO: https://firebase.google.com/docs/auth/flutter/start#authstatechanges
@LazySingleton(as: IAuth)
class AuthRepository implements IAuth {
  AuthRepository(
    this._firebaseAuth,
    this._userCollection,
    this._googleSignIn,
    // this._secureStorage,
  );

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final UserCollection _userCollection;
  final GoogleSignIn _googleSignIn;
  // final FlutterSecureStorage _secureStorage;

  //*----------------- FIREBASE ---------------------//

  @override
  Stream<Option<UserModel>> watchUserProfileFromFB() async* {
    final uid = _firebaseAuth.currentUser?.uid;

    if (uid == null) {
      yield none();
      return;
    }

    yield* _userCollection.streamSingle(uid).map(optionOf).distinct();
  }

  // @override
  // Future<void> updateProfile(UserModel user) async {
  //   await _userCollection.doc(user.uid).update(user.toJson());
  // }

  // @override
  // Future<void> createUserIfNotExists(UserModel user) async {
  //   final docRef = _userCollection.doc(user.uid);
  //   final doc = await docRef.get();
  //   if (!doc.exists) {
  //     await docRef.set(user.toJson());
  //   }
  // }

  // @override
  // Future<Option<FirebaseUser>> getSignedInUser() async =>
  //     optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<Option<firebase_auth.User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser);

  @override
  Future<Either<AuthFailure, String?>> getSignedInUserIdToken(
    firebase_auth.User firebaseUser,
  ) async {
    try {
      return firebaseUser.getIdToken().then(right);
    } on firebase_auth.FirebaseAuthException catch (error) {
      talker.error('[AuthRepository] getSignedInUser() error: $error');
      // reportExceptionToSentry(error);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, SignInMethod>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      //* Cancels by user
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      //* Obtains the auth details from the request
      final googleAuth = await googleUser.authentication;

      //* Creates a new credential
      final authCredential = firebase_auth.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      talker.warning(
        '[AuthRepository] SUCCESS signInWithGoogle() => authCredential.idToken: ${authCredential.idToken}',
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);

      final userName =
          userCredential.user?.displayName ?? ''; //* Get the display name

      talker.warning(
        '[AuthRepository] SUCCESS signInWithGoogle() => userCredential userName: $userName',
      );

      return right(SignInMethod.google(userName));
    } on firebase_auth.FirebaseAuthException catch (error) {
      talker.error('[AuthRepository] signInWithGoogle() error: $error');
      // reportExceptionToSentry(error);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, SignInMethod>> signInWithApple() async {
    try {
      // final appleProvider = AppleAuthProvider()..addScope('name');

      // talker.warning(
      //   '[AuthRepository] SUCCESS signInWithApple() => appleProvider.providerId: ${appleProvider.providerId}',
      // );

      // final userCredential =
      //     await _firebaseAuth.signInWithProvider(appleProvider);

      // final displayName =
      //     userCredential.user?.displayName ?? ''; //* Get the display name

      // talker
      //   ..warning(
      //     '[AuthRepository] SUCCESS signInWithApple() => userCredential userName: ${userName ?? ''}',
      //   )
      //   ..warning(
      //     '[AuthRepository] SUCCESS signInWithApple() => userCredential displayName: $displayName',
      //   );

      //* Retrieve the Apple credentials
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      if (appleCredential.userIdentifier != null) {
        talker.warning(
          '[AuthRepository] signInWithApple() FIRST TIME Apple ID: ${appleCredential.userIdentifier}',
        );
      }
      if (appleCredential.email != null) {
        talker.warning(
          '[AuthRepository] signInWithApple() FIRST TIME Email: ${appleCredential.email}',
        );
      }
      if (appleCredential.givenName != null ||
          appleCredential.familyName != null) {
        final displayNameFromApple = [
          appleCredential.givenName ?? '',
          appleCredential.familyName ?? '',
        ].join(' ').trim();
        talker.warning(
          '[AuthRepository] signInWithApple() FIRST TIME displayNameFromApple containing both givenName and familyName: $displayNameFromApple',
        );
      }

      //* Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential =
          firebase_auth.OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      //* Sign in with the OAuthCredential
      final userCredential =
          await _firebaseAuth.signInWithCredential(oauthCredential);

      //* Update display name if it's missing or empty
      final displayNameFromApple = [
        appleCredential.givenName ?? '',
        appleCredential.familyName ?? '',
      ].join(' ').trim();

      if (userCredential.user?.displayName == null ||
          userCredential.user!.displayName!.isEmpty) {
        if (displayNameFromApple.isNotEmpty) {
          await userCredential.user?.updateDisplayName(displayNameFromApple);
          talker.warning(
            '[AuthRepository] signInWithApple() Display name updated to: $displayNameFromApple',
          );
        } else {
          talker.warning(
            '[AuthRepository] signInWithApple() No display name provided from Apple ID',
          );
        }
      }

      //* Update email if it's missing or empty and valid
      if (userCredential.user?.email == null ||
          userCredential.user!.email!.isEmpty) {
        if (appleCredential.email != null && isEmail(appleCredential.email!)) {
          try {
            await userCredential.user?.updateEmail(appleCredential.email!);
            talker.warning(
              '[AuthRepository] signInWithApple() Email updated to: ${appleCredential.email}',
            );
          } on firebase_auth.FirebaseAuthException catch (e) {
            if (e.code == 'email-already-in-use') {
              talker.error(
                '[AuthRepository] signInWithApple() Email already in use: ${appleCredential.email}',
              );
            } else {
              talker.error(
                '[AuthRepository] signInWithApple() Failed to update email: ${e.code} - ${e.message}',
              );
            }
          }
        } else {
          talker.error(
            '[AuthRepository] signInWithApple() Invalid or missing email from Apple ID',
          );
        }
      }

      //* Log final user details from Firebase
      talker
        ..warning(
          '[AuthRepository] signInWithApple() Firebase User UID: ${userCredential.user?.uid}',
        )
        ..warning(
          '[AuthRepository] signInWithApple() Firebase User Email: ${userCredential.user?.email}',
        )
        ..warning(
          '[AuthRepository] signInWithApple() Firebase User Display Name: ${userCredential.user?.displayName}',
        );

      return right(SignInMethod.apple(displayNameFromApple));
    } on SignInWithAppleAuthorizationException catch (error) {
      //* Handle the SignInWithAppleAuthorizationException
      talker.error(
        'SignInWithAppleAuthorizationException: ${error.code} - ${error.message}',
      );

      //* You might want to handle different authorization error codes differently
      switch (error.code) {
        case AuthorizationErrorCode.canceled:
          //* Handle the case where the user cancelled the sign-in process
          //* Handle the SignInWithAppleAuthorizationException
          talker.error('AuthorizationErrorCode.canceled');
        case AuthorizationErrorCode.failed:
          //* Handle a generic failure in the authorization process
          talker.error('AuthorizationErrorCode.canceled');
        case AuthorizationErrorCode.invalidResponse:
          //* Handle an invalid response in the authorization
          talker.error('AuthorizationErrorCode.canceled');
        case AuthorizationErrorCode.notHandled:
          //* Handle a case where the authorization request was not handled
          talker.error('AuthorizationErrorCode.canceled');
        case AuthorizationErrorCode.unknown:
          //* Handle an unknown authorization error
          talker.error('AuthorizationErrorCode.canceled');
        //* Add any other specific cases you want to handle
        case AuthorizationErrorCode.notInteractive:
          talker.error('AuthorizationErrorCode.canceled');
        case AuthorizationErrorCode.credentialExport:
          talker.error('AuthorizationErrorCode.credentialExport');
        case AuthorizationErrorCode.credentialImport:
          talker.error('AuthorizationErrorCode.credentialImport');
        case AuthorizationErrorCode.matchedExcludedCredential:
          talker.error('AuthorizationErrorCode.matchedExcludedCredential');
      }

      // reportExceptionToSentry(error);
      return left(const AuthFailure.serverError());
    } on firebase_auth.FirebaseAuthException catch (error) {
      //* Handle the FirebaseAuthException
      talker.error('FirebaseAuthException: ${error.code} - ${error.message}');

      // reportExceptionToSentry(error);
      return left(const AuthFailure.serverError());
    }
  }

  //*----------------- PHONE ---------------------//

  @override
  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(firebase_auth.PhoneAuthCredential)
        verificationCompleted,
    required void Function(firebase_auth.FirebaseAuthException)
        verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
    int? forceResendingToken,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      forceResendingToken: forceResendingToken,
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future<Either<AuthFailure, SignInMethod>> verifyFbOtp({
    required String verificationId,
    required String otpCode,
  }) async {
    talker.verbose('[AuthRepository] verifyFbOtp()');
    try {
      //* Creates a new credential
      final authCredential = firebase_auth.PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );

      await _firebaseAuth.signInWithCredential(authCredential);

      talker.verbose('[AuthRepository] verifyFbOtp() success');

      return right(const SignInMethod.firebaseOtp());
    } catch (error) {
      // reportException(error);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() {
    return Future.wait([
      // dioExceptionHandler<Unit>(() async {
      //   final queryParams = <String, dynamic>{};

      //   if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      //     queryParams['type'] = UniversalPlatform.isAndroid ? 'android' : 'ios';
      //   }

      //   final prefs = await SharedPreferences.getInstance();
      //   final fcmToken = prefs.getString($constants.fcmToken);
      //   if (fcmToken != null) {
      //     talker.warning('getProfileUser() fcmToken != null: $fcmToken');
      //     queryParams['registration_id'] = fcmToken;
      //   }

      //   talker.log(
      //     '[AuthRepository] signOut() => queryParams at the END: $queryParams',
      //   );

      //   return dioExceptionHandler<Unit>(() async {
      //     await _dioService.dio.post<Map<String, dynamic>>(
      //       'user/logout',
      //       data: queryParams,
      //     );

      //     return right(unit);
      //   });
      // }),
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }
}
