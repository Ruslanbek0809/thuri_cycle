import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/alert_model.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';

@LazySingleton(as: ICommunity)
class CommunityRepository implements ICommunity {
  CommunityRepository(
    this._firebaseFirestore,
  );

  final FirebaseFirestore _firebaseFirestore;
  // final FirestoreCollection<Article> articlesCollection;

  // MealsRepo({FirebaseFirestore? firebaseFirestore})
  //     : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Article>> getArticles() async {
    try {
      final articles = await articlesCollection.futureAll('date', true);

      return Future.wait(
        articles.map(
          (article) => storage
              .getImageUrl(article.imageUrl)
              .then((url) => article = article.copyWith(imageUrl: url)),
        ),
      );
    } catch (e) {
      throw ApiError(message: 'Error fetching articles');
    }
  }

  @override
  Stream<List<MealModel>> getAllMeals() {
    return _firebaseFirestore.collection('meals').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return MealModel.fromSnapShot(doc);
      }).toList();
    });
  }

// await db.collection("users").get().then((event) {
//   for (var doc in event.docs) {
//     print("${doc.id} => ${doc.data()}");
//   }
// });

  // @override
  // Stream<List<MealModel>> getMealsByCategory(String categoryId) {
  //   return _firebaseFirestore
  //       .collection('meals')
  //       .where('categoryid', isEqualTo: categoryId)
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return MealModel.fromSnapShot(doc);
  //     }).toList();
  //   });
  // }

  @override
  Future<Either<AlertModel, Article>> getFeaturedArticle() {
    // TODO: implement getFeaturedArticle
    throw UnimplementedError();
  }

  // @override
  // Future<Article?> getFeaturedArticle() async {
  //   try {
  //     final article =
  //         await articlesCollection.futureSingleWhereEqual('featured', true);
  //     if (article == null) {
  //       return null;
  //     }

  //     final imageUrl = await storage.getImageUrl(article.imageUrl);
  //     return article.copyWith(imageUrl: imageUrl);
  //   } catch (err) {
  //     throw ApiError(message: 'Error fetching featured article');
  //   }
  // }

  // @override
  // Stream<NibblesInfo> getAboutInfo() {
  //   return _firebaseFirestore
  //       .collection('info')
  //       .doc("about")
  //       .snapshots()
  //       .map((snap) => NibblesInfo.fromSnapshot(snap));
  // }
}
