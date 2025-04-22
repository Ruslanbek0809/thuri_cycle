import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/collections.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/storage/firebase_storage.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';
import 'package:thuri_cycle/presentation/recycling_guide/community/guide_widgets/guide/guide.dart';

@LazySingleton(as: ICommunity)
class CommunityRepository implements ICommunity {
  CommunityRepository(
    // this._firebaseFirestore,
    this._firebaseStorageService,
    this._articlesCollection,
    this._guidesCollection,
  );

  // final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorageService _firebaseStorageService;
  final ArticlesCollection _articlesCollection;
  final GuidesCollection _guidesCollection;

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

  @override
  Future<Either<FirebaseFailure, List<Guide>>> getGuides() async {
    return firebaseFailureHandler(() async {
      final guides = await _guidesCollection.futureAll();

      final updatedGuides = await Future.wait(
        guides.map((guide) async {
          final imageUrl =
              await _firebaseStorageService.getImageUrl(guide.imageUrl);
          final iconUrl =
              await _firebaseStorageService.getImageUrl(guide.iconUrl);
          return guide.copyWith(imageUrl: imageUrl, iconUrl: iconUrl);
        }),
      );

      return updatedGuides;
    });
  }

  @override
  Future<Either<FirebaseFailure, Guide?>> getSingleGuide(String id) async {
    return firebaseFailureHandler(() async {
      final guide = await _guidesCollection.futureSingleByID(id);

      if (guide == null) {
        return null;
      }

      final imageUrl =
          await _firebaseStorageService.getImageUrl(guide.imageUrl);

      return guide.copyWith(imageUrl: imageUrl);
    });
  }
}
