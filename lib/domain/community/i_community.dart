import 'package:dartz/dartz.dart';
import 'package:thuri_cycle/domain/community/article/article.dart';
import 'package:thuri_cycle/domain/community/guide/guide.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';

abstract class ICommunity {
  Future<Either<FirebaseFailure, Article?>> getFeaturedArticle();
  Future<Either<FirebaseFailure, List<Article>>> getArticles();
  Future<Either<FirebaseFailure, List<Guide>>> getGuides();
  Future<Either<FirebaseFailure, Guide?>> getSingleGuide(String id);
}
