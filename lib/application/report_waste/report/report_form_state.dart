part of 'report_form_cubit.dart';

@freezed
class ReportFormState with _$ReportFormState {
  const factory ReportFormState({
    required MarkerType? markerType,
    required List<ImageWithFileModel> images,
    required bool isSubmitting,
    required bool submissionSuccess,
    required Option<Either<FirebaseFailure, MapMarkerModel>>
        failureOrSuccessOption,
    String? errorMessage,
    // MapMarkerModel? createdMarker,
    String? imageUploadError,
  }) = _ReportFormState;

  factory ReportFormState.initial() => ReportFormState(
        markerType: null,
        images: [],
        isSubmitting: false,
        submissionSuccess: false,
        failureOrSuccessOption: none(),
      );
}
