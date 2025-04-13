import 'package:dartz/dartz.dart';
import 'package:thuri_cycle/domain/core/alert_model.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';

abstract class ICommunity {
  Future<Either<AlertModel, Article>> getFeaturedArticle();

  // Future<Either<AlertModel, List<ProductModel>>> getSimilarProducts(
  //   int categoryId,
  // );
}
