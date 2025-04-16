part of 'community_featured_cubit.dart';

@freezed
class CommunityFeaturedState with _$CommunityFeaturedState {
  const factory CommunityFeaturedState.initial() =
      _CommunityFeaturedStateInitial;

  const factory CommunityFeaturedState.loading() =
      _CommunityFeaturedStateLoading;

  const factory CommunityFeaturedState.failed({required FirebaseFailure failure}) =
      _CommunityFeaturedStateFailed;

  const factory CommunityFeaturedState.success({
    required Article? article,
  }) = _CommunityFeaturedStateSuccess;
}
