import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

//* SOLVES following issues
//* [AuthRepository] depends on unregistered type [FirebaseAuth] from package:firebase_auth/firebase_auth.dart
//* [AuthRepository] depends on unregistered type [GoogleSignIn] from package:google_sign_in/google_sign_in.dart
//* [AuthRepository] depends on unregistered type [FirebaseFirestore] from package:cloud_firestore/cloud_firestore.dart
//* [AuthRepository] depends on unregistered type [FirebaseStorage] from package:firebase_storage/firebase_storage.dart

@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
}
