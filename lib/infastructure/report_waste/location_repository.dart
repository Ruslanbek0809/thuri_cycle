import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/report_waste/i_location.dart';
import 'package:thuri_cycle/domain/report_waste/location_info.dart';

@LazySingleton(as: ILocationFacade)
class LocationRepository implements ILocationFacade {
  static const locationSettings = LocationSettings(
    distanceFilter: 1,
    // Optional timeLimit if needed later
    // timeLimit: Duration(milliseconds: 5000),
  );

  @override
  Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  // @override
  // Future<Option<Position>> getLastKnownPosition() async {
  //   final position = await Geolocator.getLastKnownPosition();
  //   return optionOf(position);
  // }

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

  //TODO [optimizations]: Handle it better
  @override
  Future<Option<LocationInfoModel>> getCurrentOrLastKnownLocationInfo() async {
    final permissionGranted = await isPermissionGranted();
    final servicesEnabled = await isServiceEnabled();

    // final positionOpt = await getLastKnownPosition();
    // final positionModel = positionOpt.toNullable();

    final lastKnownPosition = await Geolocator.getLastKnownPosition();
    if (lastKnownPosition != null) {
      return some(
        LocationInfoModel(
          servicesEnabled: servicesEnabled,
          permissionGranted: permissionGranted,
          position: lastKnownPosition,
        ),
      );
    } else {
      // Fallback to getting current position (may take a second)
      try {
        final currentPosition = await Geolocator.getCurrentPosition();
        return some(
          LocationInfoModel(
            servicesEnabled: servicesEnabled,
            permissionGranted: permissionGranted,
            position: currentPosition,
          ),
        );
      } catch (e) {
        return none(); // Could not retrieve position
      }
    }
  }
}
