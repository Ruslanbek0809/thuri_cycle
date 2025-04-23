import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/report_waste/i_location.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.iLocationFacade) : super(const LocationState.initial());

  final ILocationFacade iLocationFacade;
  StreamSubscription<Position>? _positionSubscription;

  Future<void> initialize() async {
    final granted = await iLocationFacade.isPermissionGranted();
    final serviceEnabled = await iLocationFacade.isServiceEnabled();

    if (!granted) {
      await iLocationFacade.requestPermission();
    }

    if (serviceEnabled) {
      try {
        _positionSubscription = iLocationFacade.getPositionStream().listen(
          (pos) => emit(LocationState.success(pos)),
          onError: (error) {
            talker.error(
              'LocationState.failure() getPositionStream() onError: $error',
            );
            return emit(const LocationState.failure());
          },
        );
      } catch (e, stackTrace) {
        // reportException(e);
        talker.handle(
          'LocationState.failure() serviceEnabled ENABLED error: $e',
          stackTrace,
        );
      }
    } else {
      talker.error('LocationState.failure() unexpected');
      emit(const LocationState.failure());
    }
  }

  @override
  Future<void> close() async {
    await _positionSubscription?.cancel();
    return super.close();
  }
}
