import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:thuri_cycle/domain/report_waste/location_info.dart';

abstract class ILocationFacade {
  Stream<Position> getPositionStream();
  Future<Option<Position>> getLastKnownPosition();
  Future<bool> isPermissionGranted();
  Future<bool> isServiceEnabled();
  Future<void> requestPermission();
  Future<LocationInfoModel> getCurrentLocationInfo();
}
