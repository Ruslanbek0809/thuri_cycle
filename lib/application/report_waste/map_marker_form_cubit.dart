import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/domain/report_waste/i_report_waste.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/local_storage/map_preferences.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

part 'map_marker_form_cubit.freezed.dart';
part 'map_marker_form_state.dart';

@injectable
class MapMarkerFormCubit extends Cubit<MapMarkerFormState> {
  MapMarkerFormCubit(
    this.iReportWasteFacade,
    this.mapPreferences,
  ) : super(MapMarkerFormState.initial());

  final IReportWasteFacade iReportWasteFacade;
  final MapPreferences mapPreferences;
  final Distance _distance = const Distance();
  static const double zoomThreshold = 11;

  StreamSubscription<MapEvent>? _mapEventSubscription;

  Future<void> initialize() async {
    final initialLatLng = mapPreferences.getInitialLatLng();
    final initialZoom = mapPreferences.getInitialZoom();

    emit(
      state.copyWith(
        initialLatLng: initialLatLng,
        initialZoom: initialZoom,
      ),
    );

    await loadMarkers(initialLatLng);
  }

  void connectToMapStream(Stream<MapEvent> eventStream) {
    _mapEventSubscription?.cancel();
    _mapEventSubscription = eventStream
        .where(
          (event) =>
              event.camera.zoom >= zoomThreshold &&
              (state.lastMapCenter == null ||
                  _distance(event.camera.center, state.lastMapCenter!) > 5000),
        )
        .listen((event) => loadMarkers(event.camera.center));
  }

  Future<void> loadMarkers(LatLng center) async {
    emit(
      state.copyWith(
        isLoading: true,
        lastMapCenter: center,
      ),
    );

    try {
      final response = await iReportWasteFacade.getMarkers(
        center,
        includeResolved: state.includeResolved,
      );

      response.fold(
        (_) => null, //TODO: Handle this
        (markers) => emit(
          state.copyWith(
            isLoading: false,
            allMarkers: markers,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> saveCurrentMapPosition(LatLng center, double zoom) async {
    await mapPreferences.savePosition(center, zoom);
  }

  void updateFilters({bool? includeResolved, Set<MarkerType>? shownTypes}) {
    emit(
      state.copyWith(
        includeResolved: includeResolved ?? state.includeResolved,
        shownTypes: shownTypes ?? state.shownTypes,
      ),
    );

    // refresh if now including resolved
    if (includeResolved == true &&
        !state.includeResolved &&
        state.lastMapCenter != null) {
      loadMarkers(state.lastMapCenter!);
    }
  }

  Iterable<MapMarkerModel> get visibleMarkers {
    return state.allMarkers.where(
      (e) =>
          (state.includeResolved || !e.isResolved()) &&
          state.shownTypes.contains(e.markerType),
    );
  }

  MapMarkerModel? getClosestMarker(LatLng location) {
    return minBy(
      visibleMarkers,
      (m) => _distance(location, m.latLng),
    );
  }

  void addOrReplaceMarker(MapMarkerModel marker) {
    final updated = List<MapMarkerModel>.from(state.allMarkers)
      ..removeWhere((m) => m.id == marker.id);

    if (marker.resolutionDate == null || state.includeResolved) {
      updated.add(marker);
    }

    emit(state.copyWith(allMarkers: updated));
  }

  @override
  Future<void> close() {
    _mapEventSubscription?.cancel();
    return super.close();
  }
}
