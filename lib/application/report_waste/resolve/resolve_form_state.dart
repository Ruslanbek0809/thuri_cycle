part of 'resolve_form_cubit.dart';

@freezed
class ResolveFormState with _$ResolveFormState {
  const factory ResolveFormState({
    required List<ImageWithFileModel> resolvedImages,
    required bool isSubmitting,
    required bool submissionSuccess,
    required Option<Either<FirebaseFailure, MapMarkerModel>> failureOrSuccessOption,
    String? errorMessage,
    MapMarkerModel? createdMarker,
    String? imageUploadError,
  }) = _ResolveFormState;

  factory ResolveFormState.initial() => ResolveFormState(
        resolvedImages: [],
        isSubmitting: false,
        submissionSuccess: false,
        failureOrSuccessOption: none(),
      );
}
