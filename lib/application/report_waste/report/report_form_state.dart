part of 'report_form_cubit.dart';

@freezed
class ReportFormState with _$ReportFormState {
  const factory ReportFormState({
    required MarkerType? markerType,
    required List<Pair<Uint8List, String?>> images,
    required bool isSubmitting,
    required bool submissionSuccess,
    String? errorMessage,
    MapMarkerModel? createdMarker,
    String? imageUploadError,
  }) = _ReportFormState;

  factory ReportFormState.initial() => const ReportFormState(
        markerType: null,
        images: [],
        isSubmitting: false,
        submissionSuccess: false,
      );
}
