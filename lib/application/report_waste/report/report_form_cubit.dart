import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/domain/report_waste/i_report.dart';
import 'package:thuri_cycle/domain/report_waste/i_report_waste.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/local_storage/map_preferences.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

part 'report_form_cubit.freezed.dart';
part 'report_form_state.dart';

class ReportFormCubit extends Cubit<ReportFormState> {
  ReportFormCubit(this._reportFacade) : super(ReportFormState.initial());
  final IReportFacade _reportFacade;

  void setMarkerType(MarkerType type) {
    emit(state.copyWith(markerType: type));
  }

  void addImage(Uint8List imageBytes, String? name) {
    final updated = List<Pair<Uint8List, String?>>.from(state.images)
      ..add(Pair(imageBytes, name));
    emit(state.copyWith(images: updated));
  }

  void removeImageAt(int index) {
    final updated = List<Pair<Uint8List, String?>>.from(state.images)
      ..removeAt(index);
    emit(state.copyWith(images: updated));
  }

  Future<void> submitReport({
    required double latitude,
    required double longitude,
  }) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        errorMessage: null,
        submissionSuccess: false,
      ),
    );

    try {
      final marker = await _reportFacade.createReportMarker(
        latitude: latitude,
        longitude: longitude,
        type: state.markerType!,
      );

      String? imageUploadError;
      try {
        await _reportFacade.uploadImages(marker.id, state.images);
      } catch (e) {
        imageUploadError = e.toString();
      }

      emit(
        state.copyWith(
          isSubmitting: false,
          submissionSuccess: true,
          createdMarker: marker,
          imageUploadError: imageUploadError,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void reset() => emit(ReportFormState.initial());
}
