import 'package:dartz/dartz.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';

abstract class IResolveFacade {
  Future<List<String>> uploadMultipleImages(List<ImageWithFileModel> images);

  Future<Either<FirebaseFailure, MapMarkerModel>> submitResolve({
    required MapMarkerModel mapMarker,
    required List<ImageWithFileModel> resolvedImages,
    required String resolvedBy,
  });
}
