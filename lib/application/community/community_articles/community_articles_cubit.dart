import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';

part 'community_articles_state.dart';
part 'community_articles_cubit.freezed.dart';

@injectable
class CommunityArticlesCubit extends Cubit<CommunityArticlesState> {
  CommunityArticlesCubit(this.iCommunity)
      : super(const CommunityArticlesState.initial());

  final ICommunity iCommunity;

  Future<void> getAllArticles() async {
    emit(const CommunityArticlesState.loading());

    final response = await iCommunity.getArticles();

    emit(
      response.fold(
        (failure) => CommunityArticlesState.failed(failure: failure),
        (articles) => CommunityArticlesState.success(articles: articles),
      ),
    );
  }
}
