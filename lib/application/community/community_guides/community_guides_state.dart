part of 'community_guides_cubit.dart';

@freezed
class CommunityGuidesState with _$CommunityGuidesState {
  const factory CommunityGuidesState.initial() = _Initial;

  const factory CommunityGuidesState.loading() = _Loading;

  const factory CommunityGuidesState.failed({required AlertModel alert}) =
      _Failed;

  const factory CommunityGuidesState.success({
    required List<Guide> guides,
  }) = _Success;
}
