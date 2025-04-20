import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';

abstract class IReportWaste {
  Future<Either<FirebaseFailure, List<MapMarkerModel>>> getMarkers(
    LatLng center, {
    required bool includeResolved,
  });
}
