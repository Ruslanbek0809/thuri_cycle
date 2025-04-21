import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

abstract class ILocationFacade {
  Stream<Position> getPositionStream();
  Future<Option<Position>> getLastKnownPosition();
  Future<bool> isPermissionGranted();
  Future<bool> isServiceEnabled();
  Future<void> requestPermission();
}
