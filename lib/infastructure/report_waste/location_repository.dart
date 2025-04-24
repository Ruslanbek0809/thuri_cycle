import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/report_waste/i_location.dart';

@LazySingleton(as: ILocationFacade)
class LocationRepository implements ILocationFacade {
  static const locationSettings = LocationSettings(
    distanceFilter: 1,
    // timeLimit: Duration(milliseconds: 500),
    // timeLimit: Duration(milliseconds: 5000),
  );

  @override
  Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  @override
  Future<Option<Position>> getLastKnownPosition() async {
    final position = await Geolocator.getLastKnownPosition();
    return optionOf(position);
  }

  @override
  Future<bool> isPermissionGranted() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  @override
  Future<void> requestPermission() async {
    await Geolocator.requestPermission();
  }

  @override
  Future<bool> isServiceEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }
}
