import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as pathPackage;
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/i_resolve.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/DB/firestore_service.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/storage/firebase_storage.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

@LazySingleton(as: IResolveFacade)
class ResolveRepository implements IResolveFacade {
  ResolveRepository(
    this._firestoreService,
    this._firebaseStorage,
    // this._mapMarkersCollection,
  );

  final FirestoreService _firestoreService;
  final FirebaseStorageService _firebaseStorage;
  // final MapMarkersCollection _mapMarkersCollection;

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
  Future<Either<FirebaseFailure, MapMarkerModel>> submitResolve({
    required MapMarkerModel mapMarker,
    required List<ImageWithFileModel> resolvedImages,
    required String resolvedBy,
  }) {
    return firebaseFailureHandler(() async {
      final imageUrls = await uploadMultipleImages(resolvedImages);

      mapMarker = mapMarker.copyWith(
        resolutionImages: imageUrls,
        resolutionDate: DateTime.now(),
        resolvedBy: resolvedBy,
      );
      // final marker = MapMarkerModel(
      //   resolutionImages: imageUrls,
      //   resolutionDate: DateTime.now(),
      //   resolvedBy: resolvedBy,
      // );
      // await _mapMarkersCollection.withConverter.add(marker);

      // final userData = {
      //   'resolutionImages': imageUrls,
      //   'resolutionDate': DateTime.now(),
      //   'resolvedBy': resolvedBy,
      // };

      final markerDocPath = 'markers/${mapMarker.id}';
      final exists = await _firestoreService.docExists(markerDocPath);

      if (!exists) {
        await _firestoreService.create(markerDocPath, mapMarker.toJson());
        talker.verbose(
          '[ResolveRepository] New mapMarker document created for ${mapMarker.id}',
        );
      } else {
        await _firestoreService.set(markerDocPath, mapMarker.toJson());
        talker.verbose(
          '[ResolveRepository] mapMarker document already exists for ${mapMarker.id}',
        );
      }
      return mapMarker;
    });
  }
}
