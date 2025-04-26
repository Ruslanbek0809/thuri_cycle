import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/report_waste/i_report.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/storage/firebase_storage.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

@LazySingleton(as: IReportFacade)
class ReportWasteRepository implements IReportFacade {
  ReportWasteRepository(
    this._firebaseFirestore,
    this._firebaseStorage,
  );

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorageService _firebaseStorage;

  @override
  Future<MapMarkerModel> createReportMarker({
    required double latitude,
    required double longitude,
    required MarkerType type,
  }) {
    // TODO: implement createReportMarker
    throw UnimplementedError();
  }

  @override
  Future<List<String>> uploadMultipleImages(
    List<ImageWithFileModel> images,
  ) async {
    return await Future.wait(
      images.map((imageWithFileModel) async {
        final fileNamePrefix = DateTime.now().millisecondsSinceEpoch.toString();
        final uniqueName = '$fileNamePrefix-${imageWithFileModel.path}';
        final path = 'reports/$uniqueName';
        return await _firebaseStorage.uploadImage(
          file: imageWithFileModel.file,
          path: path,
        );
      }),
    );
  }
}
