import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thuri_cycle/domain/report_waste/i_report.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/local_storage/map_preferences.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

part 'map_marker_form_cubit.freezed.dart';
part 'map_marker_form_state.dart';

@injectable
class MapMarkerFormCubit extends Cubit<MapMarkerFormState> {
  MapMarkerFormCubit(
    this.iReportFacade,
    // this.ILocationFacade,
    this.mapPreferences,
    this.sharedPreferences,
  ) : super(MapMarkerFormState.initial());

  final IReportFacade iReportFacade;
  // final ILocationFacade iLocationFacade;
  final MapPreferences mapPreferences;

  final SharedPreferences sharedPreferences;
  final Distance _distance = const Distance();
  static const double zoomThreshold = 11;

  StreamSubscription<MapEvent>? _mapEventSubscription;

  void setIsNewInitialPositionLockedToTrue() {
    talker.info('[MapMarkerFormCubit] setIsNewInitialPositionLockedToTrue()');
    emit(state.copyWith(isNewInitialPositionLocked: true));
  }

  Future<void> initInitPositionAndGetMarkersFromFB({
    bool isNewSaveNewMapPosition = false,
    LatLng? center,
    double? zoom,
  }) async {
    if (isNewSaveNewMapPosition) {
      await saveCurrentMapPosition(center!, zoom!);
    }
    final initialLatLng = mapPreferences.getInitialLatLng();
    final initialZoom = mapPreferences.getInitialZoom();

    // final granted = await iLocationFacade.isPermissionGranted();
    // final serviceEnabled = await iLocationFacade.isServiceEnabled();

    // if (!granted) {
    //   await iLocationFacade.requestPermission();
    // }

    // if (serviceEnabled && granted) {

    // }

    emit(
      state.copyWith(
        initialLatLng: initialLatLng,
        initialZoom: initialZoom,
      ),
    );

    await getMarkersFromFB(initialLatLng);
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
        .listen((event) => getMarkersFromFB(event.camera.center));
  }

  Future<void> getMarkersFromFB(LatLng center) async {
    emit(
      state.copyWith(
        isLoading: true,
        lastMapCenter: center,
      ),
    );

    final response = await iReportFacade.getMarkersFromFB(
      center,
      includeResolved: state.includeResolved,
    );

    response.fold(
      (firebaseFailure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Error',
        ),
      ), //TODO: Handle this
      (markers) => emit(
        state.copyWith(
          isLoading: false,
          allMarkers: markers,
        ),
      ),
    );
  }

  void addOrReplaceMarker(MapMarkerModel marker) {
    // final updated = List<MapMarkerModel>.from(state.allMarkers)
    //   ..removeWhere((m) => m.id == marker.id);
    // if (marker.resolutionDate == null || state.includeResolved) {
    //   updated.add(marker);
    // }

    // emit(state.copyWith(allMarkers: updated));

    final updatedMarkers = List<MapMarkerModel>.from(state.allMarkers);
    final index = updatedMarkers.indexWhere((m) => m.id == marker.id);

    if (index != -1) {
      updatedMarkers[index] = marker;
    } else {
      updatedMarkers.add(marker);
    }

    emit(state.copyWith(allMarkers: updatedMarkers));
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
      getMarkersFromFB(state.lastMapCenter!);
    }
  }

  Iterable<MapMarkerModel> get visibleMarkers {
    return state.allMarkers;
    // .where(
    //   (e) =>
    //       (state.includeResolved || !e.isResolved()) &&
    //       state.shownTypes.contains(e.markerType),
    // ); //TODO: Adjust this visibleMarkers
  }

  MapMarkerModel? getClosestMarker(LatLng location) {
    return minBy(
      visibleMarkers,
      (m) => _distance(location, m.latLng),
    );
  }

  @override
  Future<void> close() {
    _mapEventSubscription?.cancel();
    return super.close();
  }
}
