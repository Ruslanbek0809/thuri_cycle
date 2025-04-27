import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:path/path.dart' as pathPackage;
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/i_report.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/collections.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/storage/firebase_storage.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

@LazySingleton(as: IReportFacade)
class ReportRepository implements IReportFacade {
  ReportRepository(
    this._firebaseStorage,
    this._mapMarkersCollection,
  );

  final FirebaseStorageService _firebaseStorage;
  final MapMarkersCollection _mapMarkersCollection;

  @override
  Future<Either<FirebaseFailure, List<MapMarkerModel>>> getMarkersFromFb(
    LatLng center, {
    required bool includeResolved,
  }) {
    return firebaseFailureHandler(() async {
      final markers =
          await _mapMarkersCollection.futureAll('creationDate', true);

      final enriched = await Future.wait(
        markers.map((marker) async {
          // ignore: omit_local_variable_types
          final List<String> resolvedImages = await Future.wait(
            marker.images?.map(_firebaseStorage.getImageUrl) ?? [],
          );
          return marker.copyWith(images: resolvedImages);
        }),
      );

      talker.verbose('getMarkersFromFb() enriched: $enriched');

      // return _getJson("/map/get_near", params: {
      //   "y": latitude.toString(),
      //   "x": longitude.toString(),
      //   "srid": "4326", // gps
      //   "include_resolved": includeResolved ? "true" : "false",
      // }).map((markers) => markers.map<MapMarker>(mapMarkerFromJson).toList());

      return enriched;
    });
  }

  @override
  Future<List<String>> uploadMultipleImages(
    List<ImageWithFileModel> images,
  ) async {
    return await Future.wait(
      images.map((imageWithFileModel) async {
        final fileNamePrefix = DateTime.now().millisecondsSinceEpoch.toString();
        final onlyFileName = pathPackage.basename(imageWithFileModel.path);
        final uniqueName = '$fileNamePrefix-$onlyFileName';
        final path = 'reports/$uniqueName';
        return await _firebaseStorage.uploadImage(
          file: imageWithFileModel.file,
          path: path,
        );
      }),
    );
  }

  @override
  Future<Either<FirebaseFailure, Unit>> submitReport({
    required double latitude,
    required double longitude,
    required MarkerType markerType,
    required List<ImageWithFileModel> images,
    required String reportedBy,
  }) {
    return firebaseFailureHandler(() async {
      final imageUrls = await uploadMultipleImages(images);

      final marker = MapMarkerModel(
        id: '',
        // Firestore will assign it.
        // It is gonna be removed by withConverter of MapMarkersCollection
        latitude: latitude,
        longitude: longitude,
        markerType: markerType,
        images: imageUrls,
        creationDate: DateTime.now(),
        reportedBy: reportedBy,
      );

      await _mapMarkersCollection.withConverter.add(marker);

      return unit;
    });
  }
}
