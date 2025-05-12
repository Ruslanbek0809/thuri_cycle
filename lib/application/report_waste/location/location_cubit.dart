import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/report_waste/i_location.dart';
import 'package:thuri_cycle/domain/report_waste/location_info.dart'; // Import your model
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.iLocationFacade) : super(const LocationState.initial());

  final ILocationFacade iLocationFacade;
  StreamSubscription<Position>? _positionSubscription;

  // Keeps updating after current or last known position with getPositionStream
  Future<void> initialize() async {
    final granted = await iLocationFacade.isPermissionGranted();
    final serviceEnabled = await iLocationFacade.isServiceEnabled();

    if (!granted) {
      await iLocationFacade.requestPermission();
    }

    if (serviceEnabled && granted) {
      final currentOrLastKnownLocationInfoPosition =
          await iLocationFacade.getCurrentOrLastKnownLocationInfo();
      currentOrLastKnownLocationInfoPosition.fold(
        () {
          talker.error(
            'LocationCubit currentOrLastKnownLocationInfoPosition ERROR',
          );
          emit(const LocationState.failure());
        },
        (currentOrLastKnownLocationInfo) {
          emit(LocationState.success(currentOrLastKnownLocationInfo));

          _positionSubscription = iLocationFacade.getPositionStream().listen(
            (pos) async {
              final updated =
                  currentOrLastKnownLocationInfo.copyWith(position: pos);
              emit(LocationState.success(updated));
            },
            onError: (dynamic e) {
              talker.error('LocationCubit ERROR: $e');
              emit(const LocationState.failure());
            },
          );
        },
      );
    } else {
      talker.error('LocationCubit serviceEnabled && granted ERROR');
      emit(const LocationState.failure());
    }
  }

  @override
  Future<void> close() async {
    await _positionSubscription?.cancel();
    return super.close();
  }
}
