import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
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
        optionOfSuccessOrFailure:
            some(failureOrSuccess),  
      ),
    );
  }
}
