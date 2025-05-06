part of 'profile_user_form_cubit.dart';

@freezed
class ProfileUserFormState with _$ProfileUserFormState {
  factory ProfileUserFormState({
    required UserModel userModel,
    required UserModel userModelForEditing,
    required ImageWithFileModel? userImageWithFileModel,
    required bool isDeleteUserImageTriggered,
    required PhoneController? userPhone,
    required bool isGettingPhoneVerificationCode,
    required bool isPhoneVerifying,
    required bool isLoading,
    required bool isSubmitting,
    required Option<Either<FirebaseFailure, Unit>> failureOrSuccessOption,
  }) = _ProfileUserFormState;

  factory ProfileUserFormState.initial() => ProfileUserFormState(
        userModel: UserModel.initial(),
        userModelForEditing: UserModel.initial(),
        userImageWithFileModel: null,
        isDeleteUserImageTriggered: false,
        userPhone: null,
        isGettingPhoneVerificationCode: false,
        isPhoneVerifying: false,
        isLoading: false,
        isSubmitting: false,
        failureOrSuccessOption: none(),
      );
}
