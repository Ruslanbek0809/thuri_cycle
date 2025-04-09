part of 'auth_form_cubit.dart';

@freezed
abstract class AuthFormState with _$AuthFormState {
  factory AuthFormState({
    required bool isLoading,
    required String? verificationId,
    required int? forceResendingToken,
    required Option<Either<AuthFailure, SignInMethod>> optionOfSuccessOrFailure,
    required Option<Either<AuthFailure, Unit>>
        fbPhoneAuthLoginOptionOfSuccessOrFailure,
    required Option<Either<AuthFailure, Unit>>
        fbPhoneAuthOtpOptionOfSuccessOrFailure,
  }) = _AuthState;

  factory AuthFormState.initial() => AuthFormState(
        isLoading: false,
        verificationId: null,
        forceResendingToken: null,
        optionOfSuccessOrFailure: none(),
        fbPhoneAuthLoginOptionOfSuccessOrFailure: none(),
        fbPhoneAuthOtpOptionOfSuccessOrFailure: none(),
      );
}

//* Custom sealed class representing the different sign-in methods along with their associated data
@freezed
class SignInMethod with _$SignInMethod {
  const factory SignInMethod.google(String name) = _GoogleSignInMethod;
  const factory SignInMethod.apple(String name) = _AppleSignInMethod;
  const factory SignInMethod.firebaseOtp() = _FirebaseOtpSignInMethod;
}
