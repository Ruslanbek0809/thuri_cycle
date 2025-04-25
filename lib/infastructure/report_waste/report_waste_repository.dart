import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/i_report_waste.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';

@LazySingleton(as: IReportWasteFacade)
class ReportWasteRepository implements IReportWasteFacade {
  ReportWasteRepository(
    this._firebaseFirestore,
  );

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<Either<FirebaseFailure, List<MapMarkerModel>>> getMarkers(
    LatLng center, {
    required bool includeResolved,
  }) {
    return firebaseFailureHandler(() async {
      // final articles = await _articlesCollection.futureAll('date', true);

      // final updatedArticles = await Future.wait(
      //   articles.map((article) async {
      //     final url =
      //         await _firebaseStorageService.getImageUrl(article.imageUrl);
      //     return article.copyWith(imageUrl: url);
      //   }),
      // );
      // final snapshot = await _firebaseFirestore
      //     .collection('mapMarkers')
      //     .where('type', whereIn: MarkerType.values.map((e) => e.name).toList())
      //     .get();

      // return snapshot.docs
      //     .map((doc) => MapMarker.fromJson({...doc.data(), 'id': doc.id}))
      //     .where((marker) {
      //   if (!includeResolved && marker.isResolved()) return false;
      //   final distance = Distance();
      //   return distance(center, marker.latLng) <= 5000;
      // }).toList();

      return [];
    });
  }
}
