import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart';
import 'package:thuri_cycle/domain/auth/auth_failure.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';

abstract class IAuth {

  Future<Option<UserModel>> getUserModelFromFb();
  Stream<Option<UserModel>> watchUserModelFromFb();

  // Future<Option<FirebaseUser>> getSignedInUser();
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, SignInMethod>> signInWithGoogle();
  Future<Either<AuthFailure, SignInMethod>> signInWithApple();

  Future<void> signOut();
}
