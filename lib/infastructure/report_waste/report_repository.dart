import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/i_report.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

@LazySingleton(as: IReportFacade)
class ReportWasteRepository implements IReportFacade {
  ReportWasteRepository(
    this._firebaseFirestore,
  );

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<MapMarkerModel> createReportMarker(
      {required double latitude,
      required double longitude,
      required MarkerType type}) {
    // TODO: implement createReportMarker
    throw UnimplementedError();
  }

  @override
  Future<void> uploadImages(
      String markerId, List<Pair<Uint8List, String?>> images) {
    // TODO: implement uploadImages
    throw UnimplementedError();
  }
}
