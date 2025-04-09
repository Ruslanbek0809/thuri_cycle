import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/auth/i_auth_facade.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.iAuth,
    // this.iHive,
    this._secureStorage,
    // this._dioTokenRefresh,
  ) : super(const AuthState.initial()) {
    on<AuthCheckRequested>(authCheckRequested);
    on<AuthExtensiveCheckRequested>(authExtensiveCheckRequested);
    on<SignedOut>(signedOut);
    // _dioTokenRefresh.fresh.authenticationStatus.listen((event) async {
    // if (event == AuthenticationStatus.authenticated) {
    // final idToken = await _dioTokenRefresh.fresh.token;
    // talker.warn(
    //   '[AuthBloc] SUCCESS AuthenticationStatus.authenticated => idToken: $idToken',
    // );
    // } else if (event == AuthenticationStatus.unauthenticated) {}
    // });
  }

  final IAuth iAuth;
  // final IHive iHive;
  final FlutterSecureStorage _secureStorage;

  // final DioTokenRefresh _dioTokenRefresh;

  Future<void> authCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    final userOption = await iAuth.getSignedInUser();
    userOption.fold(
      () => emit(const AuthState.unauthenticated()),
      (r) => emit(const AuthState.authenticated()),
    );
  }

  Future<void> authExtensiveCheckRequested(
    AuthExtensiveCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    final userOption = await iAuth.getSignedInUser();
    userOption.fold(
      () => emit(const AuthState.unauthenticated()),
      (firebaseUser) async {
        final userIdTokenOption =
            await iAuth.getSignedInUserIdToken(firebaseUser);
        userIdTokenOption.fold(
          (l) => emit(const AuthState.unauthenticated()),
          (idToken) async {
            talker.warning(
              '[AuthBloc] SUCCESS authCheckRequested() => idToken: $idToken',
            );
            await _secureStorage.write(
              key: $constants.authTokenStorage,
              value: idToken,
            );
            emit(const AuthState.authenticated());
            // await _dioTokenRefresh.fresh
            //     .setToken(idToken)
            //     .then((value) => emit(const AuthState.authenticated()));
          },
        );
      },
    );
  }

  Future<void> signedOut(
    SignedOut event,
    Emitter<AuthState> emit,
  ) async {
    talker.warning('[AuthBloc] signedOut()');
    await iAuth.signOut().then((value) async {
      await _secureStorage
          .delete(key: $constants.authTokenStorage)
          .then((value) async {
        // await iHive.clearHiveUser().then((value) {
        //   emit(const AuthState.unauthenticated());
        // });
        // await iHive.clearHiveFavorites();
        // await Sentry.configureScope((scope) {
        //   scope.setUser(null);
        // });
      });
    });
    // await _dioTokenRefresh.fresh.clearToken().then((value) async {
    //   await iAuth.signOut().then((value) async {
    //     await iHive.clearHiveUser().then((value) {
    //       emit(const AuthState.unauthenticated());
    //     });
    //     await iHive.clearHiveFavorites();
    //     await Sentry.configureScope((scope) {
    //       scope.setUser(null);
    //     });
    //   });
    // });
  }

  Future<void> deteleFirebaseUser(
    SignedOut event,
    Emitter<AuthState> emit,
  ) async {
    talker.warning('[AuthBloc] deteleFirebaseUser()');
    // final userOption = await iAuth.getSignedInUser();
    // userOption.fold(
    //   () => unawaited(null),
    //   (firebaseUser) async {
    //     await firebaseUser.delete();
    //   },
    // );
    await _secureStorage
        .delete(key: $constants.authTokenStorage)
        .then((value) async {
      // await iAuth.signOut().then((value) async {
      //   talker.warning('[AuthBloc] deteleFirebaseUser()\s signOut SUCCESS');
      // }).catchError((value) async {
      //   talker.error('[AuthBloc] deteleFirebaseUser()\s signOut ERROR');
      // });
      // await iHive.clearHiveFavorites();
      // await iHive.clearHiveUser().then((value) {
      //   emit(const AuthState.unauthenticated());
      // });
      // await Sentry.configureScope((scope) {
      //   scope.setUser(null);
      // });
    });
    // await _dioTokenRefresh.fresh.clearToken().then((value) async {
    //   // await iAuth.signOut().then((value) async {
    //   //   talker.warning('[AuthBloc] deteleFirebaseUser()\s signOut SUCCESS');
    //   // }).catchError((value) async {
    //   //   talker.error('[AuthBloc] deteleFirebaseUser()\s signOut ERROR');
    //   // });
    //   await iHive.clearHiveFavorites();
    //   await iHive.clearHiveUser().then((value) {
    //     emit(const AuthState.unauthenticated());
    //   });
    //   await Sentry.configureScope((scope) {
    //     scope.setUser(null);
    //   });
    // });
  }
}
