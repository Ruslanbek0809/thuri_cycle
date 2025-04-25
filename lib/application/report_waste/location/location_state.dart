part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.success(LocationInfoModel locationInfo) = _Success;
  const factory LocationState.failure() = _Failure;
}
