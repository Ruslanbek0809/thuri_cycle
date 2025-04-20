import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

part 'map_marker.freezed.dart';
part 'map_marker.g.dart';

@freezed
class MapMarkerModel with _$MapMarkerModel {
  const factory MapMarkerModel({
    required String id,
    required double latitude,
    required double longitude,
    required MarkerType type,
    required DateTime creationDate,
    required String reportedBy,
    DateTime? resolutionDate,
    String? resolvedBy,
  }) = _MapMarkerModel;

  factory MapMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$MapMarkerModelFromJson(json);
}

extension MapMarkerX on MapMarkerModel {
  LatLng get latLng => LatLng(latitude, longitude);

  bool isResolved() => resolutionDate != null;

  bool isNearEnoughToResolve(Position pos) {
    return Geolocator.distanceBetween(
          pos.latitude,
          pos.longitude,
          latitude,
          longitude,
        ) <
        50;
  }
}
