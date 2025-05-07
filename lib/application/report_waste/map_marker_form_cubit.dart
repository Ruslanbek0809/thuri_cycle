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

part 'map_marker_form_cubit.freezed.dart';
part 'map_marker_form_state.dart';

@injectable
class MapMarkerFormCubit extends Cubit<MapMarkerFormState> {
  MapMarkerFormCubit(
    this.iReportFacade,
    this.mapPreferences,
    this.sharedPreferences,
  ) : super(MapMarkerFormState.initial());

  final IReportFacade iReportFacade;
  final MapPreferences mapPreferences;

  final SharedPreferences sharedPreferences;
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

    await loadMarkersFromFb(initialLatLng);
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
        .listen((event) => loadMarkersFromFb(event.camera.center));
  }

  Future<void> loadMarkersFromFb(LatLng center) async {
    emit(
      state.copyWith(
        isLoading: true,
        lastMapCenter: center,
      ),
    );

    final response = await iReportFacade.getMarkersFromFb(
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
    final updated = List<MapMarkerModel>.from(state.allMarkers)
      ..removeWhere((m) => m.id == marker.id);

    if (marker.resolutionDate == null || state.includeResolved) {
      updated.add(marker);
    }

    emit(state.copyWith(allMarkers: updated));
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
      loadMarkersFromFb(state.lastMapCenter!);
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

  // //*----------------- FB Messaging ---------------------//

  // Future<void> initFcmToken() async {
  //   final firebaseMessaging = FirebaseMessaging.instance;
  //   await firebaseMessaging.getToken().then(
  //     (fcmToken) async {
  //       if (fcmToken != null) {
  //         if (kDebugMode) {
  //           talker.verbose('initFcmToken() getToken() fcmToken: $fcmToken');
  //         }

  //         await sharedPreferences.setString($constants.fcmToken, fcmToken);
  //       }
  //       return null;
  //     },
  //     onError: (dynamic err) {
  //       if (err != null) {
  //         talker.verbose(err);
  //       }
  //     },
  //   );

  //   //* Listen for token refresh
  //   FirebaseMessaging.instance.onTokenRefresh.listen((newFcmToken) async {
  //     if (kDebugMode) {
  //       talker
  //           .verbose('initFcmToken() onTokenRefresh newFcmToken: $newFcmToken');
  //     }
  //     await sharedPreferences.setString($constants.fcmToken, newFcmToken);
  //   });
  // }
}
