part of 'map_marker_form_cubit.dart';

@freezed
class MapMarkerFormState with _$MapMarkerFormState {
  factory MapMarkerFormState({
    required LatLng initialLatLng,
    required double initialZoom,
    required LatLng? lastMapCenter,
    required bool isLoading,
    required bool includeResolved,
    required bool isNewInitialPositionLocked,
    required Set<MarkerType> shownTypes,
    required List<MapMarkerModel> allMarkers,
    String? errorMessage,
  }) = _MapMarkerFormState;

  factory MapMarkerFormState.initial() => MapMarkerFormState(
        initialLatLng: const LatLng(50.6844, 10.9255),
        initialZoom: 16,
        lastMapCenter: null,
        isLoading: false,
        includeResolved: false,
        isNewInitialPositionLocked: false,
        shownTypes: {},
        allMarkers: [],
      );
}
