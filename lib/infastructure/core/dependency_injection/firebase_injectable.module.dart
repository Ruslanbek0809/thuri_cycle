import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

//* SOLVES following issues
//* [AuthRepository] depends on unregistered type [FirebaseAuth] from package:firebase_auth/firebase_auth.dart
//* [AuthRepository] depends on unregistered type [GoogleSignIn] from package:google_sign_in/google_sign_in.dart
//TODO: Add more to fix others, plus fix other unregistered types

@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
