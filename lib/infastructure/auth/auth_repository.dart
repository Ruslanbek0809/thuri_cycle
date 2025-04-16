import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart';
import 'package:thuri_cycle/domain/auth/auth_failure.dart';
import 'package:thuri_cycle/domain/auth/i_auth_facade.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
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
    this._secureStorage,
    this._googleSignIn,
    // this._dioService,
    // this.iHive,
  );

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FlutterSecureStorage _secureStorage;
  final GoogleSignIn _googleSignIn;
  // final IHive iHive;

  // //* CONFIGURED based on initDioClient()
  // final Dio _dioClient;

  // //* TEMPORARY SOLUTION instead of dio integrated with generation initDioClient
  // final DioService _dioService;

  //*----------------- DIO TOKEN ---------------------//

  @override
  Future<String?> getStoredAuthToken({bool forceRefresh = false}) async {
    talker.warning(
      '[AuthRepository] getStoredAuthToken() => forceRefresh: $forceRefresh',
    );
    final tokenExpireTimeString =
        await _secureStorage.read(key: $constants.authTokenExpireTime);

    //* Check if the token expiration time exists or if force refresh is requested
    DateTime tokenExpireTimeDateTime;
    if (tokenExpireTimeString != null) {
      tokenExpireTimeDateTime = DateTime.parse(tokenExpireTimeString);
    } else {
      //* If the expiration time is not available, set it to a past date to force refresh
      tokenExpireTimeDateTime = DateTime.fromMillisecondsSinceEpoch(0);
    }

    if (DateTime.now().isAfter(tokenExpireTimeDateTime) || forceRefresh) {
      final firebaseCurrentUser = _firebaseAuth.currentUser;
      if (firebaseCurrentUser != null) {
        await _refreshAndStoreNewAuthToken(
          firebaseCurrentUser,
          forceRefresh: forceRefresh,
        );
        final storedAccessToken =
            await _secureStorage.read(key: $constants.authTokenStorage);
        return storedAccessToken;
      } else {
        return null;
      }
    } else {
      final storedAccessToken =
          await _secureStorage.read(key: $constants.authTokenStorage);
      return storedAccessToken;
    }
  }

  Future<void> _refreshAndStoreNewAuthToken(
    User user, {
    bool forceRefresh = false,
  }) async {
    talker.warning(
      '[AuthRepository] _refreshAndStoreNewAuthToken() => user.uid: ${user.uid}, forceRefresh: ${forceRefresh}',
    );
    final newAuthToken = await user.getIdToken(forceRefresh);
    await _secureStorage.write(
      key: $constants.authTokenStorage,
      value: newAuthToken,
    );
    talker.warning(
      '[AuthRepository] _refreshAndStoreNewAuthToken() => newAuthToken: $newAuthToken',
    );
    //* Optionally store the expiration timestamp
    final tokenExpireTimeDateTime =
        DateTime.now().add(const Duration(hours: 1));
    await _secureStorage.write(
      key: $constants.authTokenExpireTime,
      value: tokenExpireTimeDateTime.toIso8601String(),
    );
  }

  //*----------------- FIREBASE ---------------------//

  // @override
  // Future<Option<FirebaseUser>> getSignedInUser() async =>
  //     optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<Option<User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser);

  @override
  Future<Either<AuthFailure, String?>> getSignedInUserIdToken(
    User firebaseUser,
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
      final oauthCredential = OAuthProvider('apple.com').credential(
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
          } on FirebaseAuthException catch (e) {
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

  //*----------------- SERVER ---------------------//

  // @override
  // Future<Either<AlertModel, UserModel>> getProfileUser() async {
  //   return dioExceptionHandler<UserModel>(() async {
  //     final queryParams = <String, dynamic>{};

  //     if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
  //       queryParams['type'] = UniversalPlatform.isAndroid ? 'android' : 'ios';
  //     }

  //     final prefs = await SharedPreferences.getInstance();
  //     final fcmToken = prefs.getString($constants.fcmToken);
  //     if (fcmToken != null) {
  //       talker.warning('getProfileUser() fcmToken != null: $fcmToken');
  //       queryParams['registration_id'] = fcmToken;
  //     }

  //     final profileUserFormData = FormData.fromMap(queryParams);

  //     talker.log(
  //       '[AuthRepository] getProfileUser() => queryParams at the END: $queryParams',
  //     );

  //     return dioExceptionHandler<UserModel>(() async {
  //       final response = await _dioService.dio.get<Map<String, dynamic>>(
  //         'user/',
  //         data: profileUserFormData,
  //       );

  //       talker.log(
  //         '[AuthRepository] SUCCESS getProfileUser() => response.data: ${response.data}',
  //       );

  //       final user = UserModel.fromJson(response.data!);
  //       await iHive.addOrUpdateUserModelToHive(userModel: user);

  //       return right(user);
  //     });
  //   });
  // }

  // @override
  // Future<Either<AlertModel, UserModel>> updateProfileUser(
  //   UserModel userModel,
  //   // XFile? userImageFile,
  //   // bool isDeleteUserImageTriggered,
  //   // XFile? backgroundImageFile,
  //   // bool isDeleteUserBackgroundImageTriggered,
  // ) async {
  //   talker.warning(
  //     '[AuthRepository] updateProfileUser() => userModel: $userModel'
  //     // userImageFile: $userImageFile, backgroundImageFile: $backgroundImageFile',
  //   );
  //   return dioExceptionHandler<UserModel>(() async {
  //     final queryParams = <String, dynamic>{};
  //     if (userModel.firstName != null) {
  //       if (userModel.firstName!.isNotEmpty) {
  //         queryParams['first_name'] = userModel.firstName;
  //       } else {
  //         queryParams['first_name'] = '';
  //       }
  //     }
  //     if (userModel.lastName != null) {
  //       queryParams['last_name'] = userModel.lastName;
  //       if (userModel.lastName!.isNotEmpty) {
  //         queryParams['last_name'] = userModel.lastName;
  //       } else {
  //         queryParams['last_name'] = '';
  //       }
  //     }
  //     if (userModel.bio != null) {
  //       queryParams['bio'] = userModel.bio;
  //       if (userModel.bio!.isNotEmpty) {
  //         queryParams['bio'] = userModel.bio;
  //       } else {
  //         queryParams['bio'] = '';
  //       }
  //     }
  //     if (userModel.gender != null) {
  //       queryParams['gender'] = userModel.gender!.id;
  //     }
  //     if (userModel.birthday != null) {
  //       queryParams['birthday'] = userModel.birthday;
  //     }
  //     if (userImageFile != null) {
  //       final fileName = userImageFile.path.split('/').last;
  //       queryParams['avatar'] = await MultipartFile.fromFile(
  //         userImageFile.path,
  //         filename: fileName,
  //       );
  //     } else if (isDeleteUserImageTriggered) {
  //       queryParams['avatar'] = null;
  //     }
  //     if (backgroundImageFile != null) {
  //       final fileName = backgroundImageFile.path.split('/').last;
  //       queryParams['wallpaper'] = await MultipartFile.fromFile(
  //         backgroundImageFile.path,
  //         filename: fileName,
  //       );
  //     } else if (isDeleteUserBackgroundImageTriggered) {
  //       queryParams['wallpaper'] = null;
  //     }

  //     if (userModel.mobile != null && userModel.mobile!.isNotEmpty) {
  //       queryParams['mobile'] = userModel.mobile;
  //       queryParams['mobile_iso_code'] = userModel.mobileIsoCode;
  //     }

  //     if (userModel.email != null) {
  //       if (userModel.email!.isNotEmpty) {
  //         queryParams['email'] = userModel.email;
  //       } else {
  //         queryParams['email'] = '';
  //       }
  //     }

  //     if (userModel.emailHidden != null) {
  //       queryParams['email_hidden'] = userModel.emailHidden;
  //     }
  //     if (userModel.mobileHidden != null) {
  //       queryParams['mobile_hidden'] = userModel.mobileHidden;
  //     }

  //     if ((userModel.isSelectedFromMap ?? false) &&
  //         (userModel.location != null && userModel.location!.isNotEmpty)) {
  //       queryParams['address_extra'] = null;
  //       queryParams['location'] = userModel.location;
  //       queryParams['latitude'] = userModel.latitude;
  //       queryParams['longitude'] = userModel.longitude;
  //     } else {
  //       if (userModel.addressText != null &&
  //           userModel.addressText!.isNotEmpty) {
  //         queryParams['address_extra'] = userModel.addressText;
  //         queryParams['location'] = null;
  //         queryParams['latitude'] = null;
  //         queryParams['longitude'] = null;
  //       }
  //     }

  //     talker.log(
  //       '[AuthRepository] updateProfileUser() => queryParams at the END: $queryParams',
  //     );

  //     final profileUserFormData = FormData.fromMap(queryParams);

  //     final response = await _dioService.dio.patch<Map<String, dynamic>>(
  //       'user/',
  //       data: profileUserFormData,
  //     );
  //     // final response = await _dioClient.patch<Map<String, dynamic>>(
  //     //   'user/',
  //     //   data: updateUserFormData,
  //     // );

  //     talker.log(
  //       '[AuthRepository] SUCCESS updateProfileUser() => response.data: ${response.data}',
  //     );

  //     final user = UserModel.fromJson(response.data!);
  //     await iHive.addOrUpdateUserModelToHive(userModel: user);

  //     return right(user);
  //   });
  // }

  // @override
  // Future<Either<AlertModel, UploadedImageModel>> uploadBusinessImage(
  //   CroppedFile? croppedFile,
  // ) async {
  //   talker.warning(
  //     '[AuthRepository] uploadBusinessImage() => croppedFile: $croppedFile',
  //   );
  //   return dioExceptionHandler<UploadedImageModel>(() async {
  //     final queryParams = <String, dynamic>{};

  //     if (croppedFile != null) {
  //       final fileName = croppedFile.path.split('/').last;
  //       queryParams['image'] = await MultipartFile.fromFile(
  //         croppedFile.path,
  //         filename: fileName,
  //       );
  //     }

  //     talker.log('queryParams at the END: $queryParams');

  //     final uploadBusinessImageFormData = FormData.fromMap(queryParams);

  //     final dioWithCustomParams = _dioService.getDioWithCustomParams();
  //     final response = await dioWithCustomParams.post<Map<String, dynamic>>(
  //       'business/images/',
  //       data: uploadBusinessImageFormData,
  //     );
  //     // final response = await dioWithCustomParams.patch<Map<String, dynamic>>(
  //     // 'business/images/',
  //     // data: uploadBusinessImageFormData,
  //     // );

  //     talker.verbose(
  //       '[AuthRepository] SUCCESS uploadBusinessImage() => response.data: ${response.data}',
  //     );

  //     final imageModel = ImageModel.fromJson(response.data!);
  //     final uploadedImage = UploadedImageModel(
  //       id: imageModel.id!,
  //       croppedFile: croppedFile,
  //     );

  //     return right(uploadedImage);
  //   });
  // }

  // @override
  // Future<Either<AlertModel, Unit>> deleteUser() async {
  //   talker.verbose('[AuthRepository] deleteUser()');

  //   return dioExceptionHandler<Unit>(() async {
  //     final response = await _dioService.dio.delete<dynamic>(
  //       'user/',
  //     );
  //     // final response = await _dioClient.delete<dynamic>(
  //     //   'user/',
  //     // );

  //     talker.verbose(
  //       '[AuthRepository] SUCCESS deleteUser() => response.data: ${response.data}',
  //     );

  //     return right(unit);
  //   });
  // }

// @override
// Future<Either<AlertModel, UserModel>> updateUserImageFile(
//   UserModel userModel,
//   XFile? userImageFile,
// ) async {
//   talker.verbose(
//     '[AuthRepository] updateUserImageFile() => userModel: $userModel, userImageFile: $userImageFile',
//   );
//   return dioExceptionHandler<UserModel>(() async {
//     final queryParams = <String, dynamic>{};

//     if (userImageFile != null) {
//       final fileName = userImageFile.path.split('/').last;
//       queryParams['image'] = await MultipartFile.fromFile(
//         userImageFile.path,
//         filename: fileName,
//       );
//     } else {
//       queryParams['image'] = null;
//     }

//     talker.verbose('queryParams at the END: $queryParams');

//     final FormData updateUserImageFormData = FormData.fromMap(queryParams);

//     final response = await _dioService.dio.patch<Map<String, dynamic>>(
//       'users/${userModel.id}/',
//       data: userImageFile != null
//           ? updateUserImageFormData
//           : {
//               'image': null
//             }, //* FormData IGNORES empty data so use query directly
//     );
//     // final response = await _dioClient.patch<Map<String, dynamic>>(
//     //   'users/${userModel.id}/',
//     //   data: updateUserFormData,
//     // );

//     talker.verbose(
//       '[AuthRepository] SUCCESS updateUserImageFile() => response.data: ${response.data}',
//     );

//     final user = UserModel.fromJson(response.data!);

//     return right(user);
//   });
// }
}
