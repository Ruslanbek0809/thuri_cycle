import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/alert_model.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';

@LazySingleton(as: ICommunity)
class CommunityRepository implements ICommunity {
  @override
  Future<Either<AlertModel, Article>> getFeaturedArticle() {
    // TODO: implement getFeaturedArticle
    throw UnimplementedError();
  }
}
