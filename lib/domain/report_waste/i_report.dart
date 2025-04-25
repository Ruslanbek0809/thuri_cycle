import 'dart:typed_data';

import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

abstract class IReportFacade {
  Future<MapMarkerModel> createReportMarker({
    required double latitude,
    required double longitude,
    required MarkerType type,
  });

  Future<void> uploadImages(
    String markerId,
    List<Pair<Uint8List, String?>> images,
  );
}
