import 'package:dartz/dartz.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

abstract class IReportFacade {
  Future<List<String>> uploadMultipleImages(List<ImageWithFileModel> images);

  Future<Either<FirebaseFailure, Unit>> submitReport({
    required double latitude,
    required double longitude,
    required MarkerType markerType,
    required List<ImageWithFileModel> images,
    required String reportedBy,
  });
}
