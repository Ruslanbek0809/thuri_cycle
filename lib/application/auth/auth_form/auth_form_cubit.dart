import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/auth/auth_failure.dart';
import 'package:thuri_cycle/domain/auth/i_auth_facade.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

part 'auth_form_cubit.freezed.dart';
part 'auth_form_state.dart';

//TODO: Create BlocProvider for this wherever it is used
@injectable
class AuthFormCubit extends Cubit<AuthFormState> {
  AuthFormCubit(this.iAuth) : super(AuthFormState.initial());
  final IAuth iAuth;

  // //* RESETS default auth form to initial state
  // Future<void> resetAuthFormToInitialState() async {
  //   emit(AuthFormState.initial());
  // }

  void setIsLoadingToFalse() {
    talker.info('[AuthCubit] setIsLoadingToFalse()');
    emit(state.copyWith(isLoading: false));
  }

  Future<void> signInWithGoogle() async {
    talker.info('[AuthCubit] signInWithGoogle()');
    emit(
      state.copyWith(
        isLoading: true,
        optionOfSuccessOrFailure: none(),
      ),
    );

    final failureOrSuccess = await iAuth.signInWithGoogle();

    emit(
      state.copyWith(
        optionOfSuccessOrFailure:
            some(failureOrSuccess), //* some(result) == optionOf(result)
      ),
    );
  }

  Future<void> signInWithApple() async {
    talker.info('[AuthCubit] signInWithApple()');
    emit(
      state.copyWith(
        isLoading: true,
        optionOfSuccessOrFailure: none(),
      ),
    );

    final failureOrSuccess = await iAuth.signInWithApple();

    emit(
      state.copyWith(
        optionOfSuccessOrFailure: some(failureOrSuccess),
      ),
    );
  }

  //*----------------- FB PHONE AUTH ---------------------//

  Future<void> verifyPhone(
    String phoneNumber, {
    int? forceResendingToken,
    bool isResend = false,
  }) async {
    talker.info('[AuthCubit] verifyPhone() phoneNumber: $phoneNumber');
    emit(
      state.copyWith(
        isLoading: true,
        fbPhoneAuthLoginOptionOfSuccessOrFailure: none(),
        otpVerificationOptionOfSuccessOrFailure: none(),
      ),
    );

    await iAuth.verifyPhone(
      phoneNumber: phoneNumber,
      forceResendingToken: forceResendingToken,
      verificationCompleted: (PhoneAuthCredential credential) async {
        talker.verbose('verificationCompleted() credential: $credential');
        //* Not used.
        //TODO [optimization]: You may choose to handle auto-login here
      },
      codeSent: (String verificationId, int? resendToken) {
        talker.verbose(
          'codeSent() verificationId: $verificationId, resendToken: $resendToken',
        );
        emit(
          state.copyWith(
            isLoading: false,
            isResend: isResend,
            verificationId: verificationId,
            forceResendingToken: resendToken,
            fbPhoneAuthLoginOptionOfSuccessOrFailure: some(right(unit)),
          ),
        );
        // if (forceResendingToken != null) {
        //   emit(
        //     state.copyWith(
        //       isLoading: false,
        //       verificationId: verificationId,
        //       forceResendingToken: resendToken,
        //       fbPhoneAuthOtpOptionOfSuccessOrFailure: optionOf(right(unit)),
        //     ),
        //   );
        // } else {
        //   emit(
        //     state.copyWith(
        //       isLoading: false,
        //       verificationId: verificationId,
        //       forceResendingToken: resendToken,
        //       fbPhoneAuthLoginOptionOfSuccessOrFailure: optionOf(right(unit)),
        //     ),
        //   );
        // }
      },
      verificationFailed: (FirebaseAuthException e) {
        talker.error('verificationFailed() e: $e');
        final failure = e.code == 'invalid-phone-number'
            ? const AuthFailure.invalidPhoneNumber()
            : e.code == 'too-many-requests'
                ? const AuthFailure.tooManyRequests()
                : const AuthFailure.serverError();
        emit(
          state.copyWith(
            isLoading: false,
            fbPhoneAuthLoginOptionOfSuccessOrFailure: some(left(failure)),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        talker.error(
          'codeAutoRetrievalTimeout() verificationId: $verificationId',
        );
        emit(
          state.copyWith(
            isLoading: false,
            fbPhoneAuthLoginOptionOfSuccessOrFailure:
                some(left(const AuthFailure.serverError())),
          ),
        );
      },
    );
  }

  Future<void> verifyFbOtp(
    String otpCode,
  ) async {
    talker.info(
      '[AuthCubit] verifyFbOtp() state.verificationId: ${state.verificationId}, otpCode: $otpCode',
    );
    emit(
      state.copyWith(
        isLoading: true,
        otpVerificationOptionOfSuccessOrFailure: none(),
      ),
    );

    final failureOrSuccess = await iAuth.verifyFbOtp(
      verificationId: state.verificationId!,
      otpCode: otpCode,
    );

    emit(
      state.copyWith(
        otpVerificationOptionOfSuccessOrFailure: some(failureOrSuccess),
      ),
    );
  }
}
