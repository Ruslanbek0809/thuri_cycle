import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/DB/firestore_collection.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';
import 'package:thuri_cycle/presentation/recycling_guide/community/guide_widgets/guide/guide.dart';

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
