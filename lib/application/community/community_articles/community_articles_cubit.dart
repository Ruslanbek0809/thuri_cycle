import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/article/article.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';

part 'community_articles_cubit.freezed.dart';
part 'community_articles_state.dart';

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
