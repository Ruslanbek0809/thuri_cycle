import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

part 'location_info.freezed.dart';

@freezed
class LocationInfoModel with _$LocationInfoModel {
  const factory LocationInfoModel({
    required bool servicesEnabled,
    required bool permissionGranted,
    Position? position,
  }) = _LocationInfoModel;
}

extension MapMarkerX on LocationInfoModel {
  LatLng? get latLng => (position != null)
      ? LatLng(position!.latitude, position!.longitude)
      : null;
}
