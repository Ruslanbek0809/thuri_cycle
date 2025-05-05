part of 'single_marker_form_cubit.dart';

@freezed
class SingleMarkerFormState with _$SingleMarkerFormState {
  factory SingleMarkerFormState({
    required UserModel reportedByUser,
    required UserModel? resolvedByUser,
    required bool isLoading,
    required Option<Either<FirebaseFailure, Unit>> failureOrSuccessOption,
  }) = _SingleMarkerFormState;

  factory SingleMarkerFormState.initial() => SingleMarkerFormState(
        reportedByUser: UserModel.initial(),
        resolvedByUser: UserModel.initial(),
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}
