import 'package:dartz/dartz.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';
import 'package:thuri_cycle/presentation/recycling_guide/community/guide_widgets/guide/guide.dart';

abstract class ICommunity {
  Future<Either<FirebaseFailure, Article?>> getFeaturedArticle();
  Future<Either<FirebaseFailure, List<Article>>> getArticles();
  Future<Either<FirebaseFailure, List<Guide>>> getGuides();
  Future<Either<FirebaseFailure, Guide?>> getSingleGuide(String id);
}
