import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/domain/community/article/article.dart';
import 'package:thuri_cycle/domain/community/guide/guide.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/DB/firestore_collection.dart';

@lazySingleton
class MapMarkersCollection extends FirestoreCollection<MapMarkerModel> {
  MapMarkersCollection(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  String get path => 'markers';

  @override
  CollectionReference<MapMarkerModel> get withConverter =>
      _firestore.collection(path).withConverter<MapMarkerModel>(
            fromFirestore: (snapshot, _) => MapMarkerModel.fromJson(
              snapshot.data()!..addAll({'id': snapshot.id}),
            ),
            toFirestore: (marker, _) => marker.toJson()..remove('id'),
          );
}

@lazySingleton
class UserCollection extends FirestoreCollection<UserModel> {
  UserCollection(this.firebaseFirestore);

  final FirebaseFirestore firebaseFirestore;

  @override
  String get path => 'users';

  @override
  CollectionReference<UserModel> get withConverter =>
      firebaseFirestore.collection(path).withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (_, __) => {},
          );
}

@lazySingleton
class ArticlesCollection extends FirestoreCollection<Article> {
  ArticlesCollection(this.firebaseFirestore);

  final FirebaseFirestore firebaseFirestore;

  @override
  String get path => 'articles';

  // Customizes how Firestore documents get converted into your Dart model
  @override
  CollectionReference<Article> get withConverter =>
      firebaseFirestore.collection(path).withConverter<Article>(
            fromFirestore: (snapshot, _) => Article.fromJson(
              snapshot.data()!
                ..addAll({
                  'uid': snapshot.id,
                }),
            ), // snapshot.data() is Firestore document data (as a Map<String, dynamic>) & Adds uid to article model
            toFirestore: (_, __) => {},
          );
}

@lazySingleton
class GuidesCollection extends FirestoreCollection<Guide> {
  GuidesCollection(this.firebaseFirestore);

  final FirebaseFirestore firebaseFirestore;

  @override
  String get path => 'guides';

  @override
  CollectionReference<Guide> get withConverter =>
      firebaseFirestore.collection(path).withConverter<Guide>(
            fromFirestore: (snapshot, _) =>
                Guide.fromJson(snapshot.data()!..addAll({'uid': snapshot.id})),
            toFirestore: (_, __) => {},
          );
}
