import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

abstract class IReportFacade {
  Future<MapMarkerModel> createReportMarker({
    required double latitude,
    required double longitude,
    required MarkerType type,
  });

  Future<List<String>> uploadMultipleImages(List<ImageWithFileModel> images);
}
