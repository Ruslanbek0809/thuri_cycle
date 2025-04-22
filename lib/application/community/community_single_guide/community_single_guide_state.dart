part of 'community_single_guide_cubit.dart';

@freezed
class CommunitySingleGuideState with _$CommunitySingleGuideState {
  const factory CommunitySingleGuideState.initial() = _Initial;

  const factory CommunitySingleGuideState.loading() = _Loading;

  const factory CommunitySingleGuideState.failed({
    required FirebaseFailure failure,
  }) = _Failed;

  const factory CommunitySingleGuideState.success({
    required Guide? singleGuide,
  }) = _Success;
}
