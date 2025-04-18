import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/auth/i_auth_facade.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';

part 'profile_user_form_cubit.freezed.dart';
part 'profile_user_form_state.dart';

// Reusable for both profile card + edit page
// If ProfileUserFormCubit is not needed immediately, you can lazy: true and
// initialize it only when user goes to profile page. 
// But since you’re watching user model from start, lazy: false is fine here.
@injectable
class ProfileUserFormCubit extends Cubit<ProfileUserFormState> {
  ProfileUserFormCubit(
    this.iAuth,
  ) : super(ProfileUserFormState.initial());

  final IAuth iAuth;

  // StreamSubscription<UserModel>? _userSubscription;

  StreamSubscription<Option<UserModel>>? _userSubscription;

  void watchUserModelFromFb() {
    _userSubscription?.cancel();
    _userSubscription = iAuth.watchUserModelFromFb().listen((userOption) {
      userOption.fold(
        () => null, // do nothing if user doesn't exist
        (userModel) => emit(state.copyWith(userModel: userModel)),
      );
    });
  }

  void nameChanged(String newName) {
    emit(
      state.copyWith(
        userModel: state.userModel.copyWith(name: newName),
        failureOrSuccessOption: none(),
      ),
    );
  }

  // Future<void> submitChanges() async {
  //   emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));

  //   final result = await iAuth.updateProfileFromFb(state.userModel);

  //   emit(
  //     state.copyWith(
  //       isSubmitting: false,
  //       failureOrSuccessOption: optionOf(result),
  //     ),
  //   );
  // }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  //*----------------- USER MAIN SECTIONS ---------------------//

  // Future<void> firstNameChanged(String value) async {
  //   talker.warning('firstNameChanged: $value');
  //   emit(
  //     state.copyWith(
  //       userModelForEditing:
  //           state.userModelForEditing.copyWith(firstName: value),
  //       imageUploadOptionOfSuccessOrFailure: none(),
  //       cancelSubscriptionOptionOfSuccessOrFailure: none(),
  //       deleteUserOptionOfSuccessOrFailure: none(),
  //       optionOfSuccessOrFailure: none(),
  //     ),
  //   );
  // }
}
