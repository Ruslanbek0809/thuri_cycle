import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/collections.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/storage/firebase_storage.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';

@LazySingleton(as: ICommunity)
class CommunityRepository implements ICommunity {
  CommunityRepository(
    // this._firebaseFirestore,
    this._firebaseStorageService,
    this._articlesCollection,
  );

  // final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorageService _firebaseStorageService;
  final ArticlesCollection _articlesCollection;

// await db.collection("users").get().then((event) {
//   for (var doc in event.docs) {
//     print("${doc.id} => ${doc.data()}");
//   }
// });

  @override
  Future<Either<FirebaseFailure, List<Article>>> getArticles() {
    return firebaseFailureHandler(() async {
      final articles = await _articlesCollection.futureAll('date', true);

      final updatedArticles = await Future.wait(
        articles.map((article) async {
          final url =
              await _firebaseStorageService.getImageUrl(article.imageUrl);
          return article.copyWith(imageUrl: url);
        }),
      );

      return updatedArticles;
    });
  }

  // @override
  // Future<List<Article>> getArticles() async {
  //   try {
  //     final articles = await _articlesCollection.futureAll('date', true);

  //     return Future.wait(
  //       articles.map(
  //         (article) => _firebaseStorageService
  //             .getImageUrl(article.imageUrl)
  //             .then((url) => article = article.copyWith(imageUrl: url)),
  //       ),
  //     );
  //   } catch (e) {
  //     // throw ApiError(message: 'Error fetching articles');
  //   }
  // }

  @override
  Future<Either<FirebaseFailure, Article?>> getFeaturedArticle() async {
    return firebaseFailureHandler(() async {
      final article =
          await _articlesCollection.futureSingleWhereEqual('featured', true);

      if (article == null) {
        return null;
      }

      final imageUrl =
          await _firebaseStorageService.getImageUrl(article.imageUrl);

      return article.copyWith(imageUrl: imageUrl);
    });
  }

  // @override
  // Future<Article?> getFeaturedArticle() async {
  //   try {
  //     final article = await articlesCollection.futureSingleWhereEqual('featured', true);
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
  // Stream<List<MealModel>> getAllMeals() {
  //   return _firebaseFirestore.collection('meals').snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return MealModel.fromSnapShot(doc);
  //     }).toList();
  //   });
  // }
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

  // @override
  // Stream<NibblesInfo> getAboutInfo() {
  //   return _firebaseFirestore
  //       .collection('info')
  //       .doc("about")
  //       .snapshots()
  //       .map((snap) => NibblesInfo.fromSnapshot(snap));
  // }
}
