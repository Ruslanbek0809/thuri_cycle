import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/i_report.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

part 'report_form_cubit.freezed.dart';
part 'report_form_state.dart';

@injectable
class ReportFormCubit extends Cubit<ReportFormState> {
  ReportFormCubit(this._reportFacade) : super(ReportFormState.initial());
  final IReportFacade _reportFacade;

  void reset() => emit(ReportFormState.initial());

  void addImage(ImageWithFileModel imageWithImageModel) {
    emit(state.copyWith(images: [...state.images, imageWithImageModel]));
  }

  void removeImageAt(int index) {
    final updated = List.of(state.images)..removeAt(index);
    emit(state.copyWith(images: updated));
  }

  void setMarkerType(MarkerType type) {
    emit(state.copyWith(markerType: type));
  }

  Future<void> submitReport({
    required double latitude,
    required double longitude,
    required String? userId,
  }) async {
    emit(state.copyWith(isSubmitting: true));

    final result = await _reportFacade.submitReport(
      latitude: latitude,
      longitude: longitude,
      markerType: state.markerType!,
      images: state.images,
      reportedBy: userId ?? 'unknown', // TODO [optimization]: Handle when userId is not known 
    );

    emit(
      state.copyWith(
        isSubmitting: false,
        failureOrSuccessOption: optionOf(result),
      ),
    );

    // result.fold(
    //   (failure) => emit(state.copyWith(isSubmitting: false, showError: true)),
    //   (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
    // );
  }
}
