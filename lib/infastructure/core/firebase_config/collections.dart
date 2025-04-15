import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firestore_collection.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';
import 'package:thuri_cycle/presentation/recycling_guide/community/guide_widgets/guide/guide.dart';

class ArticlesCollection extends FirestoreCollection<Article> {
  @override
  String get path => 'articles';

  // Adds uid to article model
  @override
  CollectionReference<Article> get withConverter => firestore
      .collection(path)
      .withConverter<Article>(
        fromFirestore: (snapshot, _) =>
            Article.fromJson(snapshot.data()!..addAll({'uid': snapshot.id})),
        toFirestore: (_, __) => {},
      );
}

class GuidesCollection extends FirestoreCollection<Guide> {
  @override
  String get path => 'guides';

  @override
  CollectionReference<Guide> get withConverter =>
      firestore.collection(path).withConverter<Guide>(
            fromFirestore: (snapshot, _) =>
                Guide.fromJson(snapshot.data()!..addAll({'uid': snapshot.id})),
            toFirestore: (_, __) => {},
          );
}
