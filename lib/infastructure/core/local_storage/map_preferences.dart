import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

@lazySingleton
class MapPreferences {
  MapPreferences(this.sharedPreferences);

  final SharedPreferences sharedPreferences;
  
  LatLng getInitialLatLng() => LatLng(
        sharedPreferences.getDouble($constants.lastMapLatitude) ?? 50.6844,
        sharedPreferences.getDouble($constants.lastMapLongitude) ?? 10.9255,
      );

  double getInitialZoom() =>
      sharedPreferences.getDouble($constants.lastMapZoom) ?? 16;

  Future<void> savePosition(LatLng latLng, double zoom) async {
    await Future.wait([
      sharedPreferences.setDouble($constants.lastMapLatitude, latLng.latitude),
      sharedPreferences.setDouble(
        $constants.lastMapLongitude,
        latLng.longitude,
      ),
      sharedPreferences.setDouble($constants.lastMapZoom, zoom),
    ]);
  }
}
