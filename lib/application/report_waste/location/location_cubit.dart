import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/report_waste/i_location.dart';

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
      _positionSubscription = iLocationFacade.getPositionStream().listen(
            (pos) => emit(LocationState.success(pos)),
            onError: (_) => emit(const LocationState.failure()),
          );
    } else {
      emit(const LocationState.failure());
    }
  }

  @override
  Future<void> close() async {
    await _positionSubscription?.cancel();
    return super.close();
  }
}
