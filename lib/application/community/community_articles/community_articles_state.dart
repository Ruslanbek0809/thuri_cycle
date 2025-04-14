part of 'community_articles_cubit.dart';

@freezed
class CommunityArticlesState with _$CommunityArticlesState {
  const factory CommunityArticlesState.initial() = _Initial;

  const factory CommunityArticlesState.loading() = _Loading;

  const factory CommunityArticlesState.failed({required AlertModel alert}) =
      _Failed;

  const factory CommunityArticlesState.success({
    required List<Article> articles,
  }) = _Success;
}
