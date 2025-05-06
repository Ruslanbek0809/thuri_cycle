import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:thuri_cycle/domain/auth/i_auth_facade.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';

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

  StreamSubscription<Option<UserModel>>? _userSubscription;

  void initialAssignOfUserModelForEditing() {
    final fullPhone = state.userModel.phoneNumber ?? '';
    final strippedPhone =
        fullPhone.startsWith('+49') ? fullPhone.replaceFirst('+49', '') : null;
    emit(
      state.copyWith(
        userModelForEditing: state.userModel,
        userPhone: state.userModel.phoneNumber != null &&
                state.userModel.phoneNumber!.isNotEmpty
            ? PhoneController(
                initialValue: PhoneNumber(
                  isoCode: IsoCode.DE,
                  nsn: strippedPhone ?? '',
                ),
              )
            : null,
        failureOrSuccessOption: none(),
      ),
    );
  }

  void watchUserModelFromFb() {
    _userSubscription?.cancel();
    _userSubscription = iAuth.watchUserProfileFromFB().listen((userOption) {
      userOption.fold(
        () => null, // TODO [optimization]: Handle null part
        (userModel) => emit(state.copyWith(userModel: userModel)),
      );
    });
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  //*----------------- USER UPDATE SECTIONS ---------------------//

  Future<void> userNameChanged(String value) async {
    emit(
      state.copyWith(
        userModelForEditing:
            state.userModelForEditing.copyWith(username: value),
      ),
    );
  }

  Future<void> userMainPhoneValueChanged(PhoneNumber? value) async {
    emit(
      state.copyWith(
        userPhone: PhoneController(
          initialValue:
              value ?? const PhoneNumber(isoCode: IsoCode.DE, nsn: ''),
        ),
      ),
    );
  }

  Future<void> userImageWithFileModelPicked(
    ImageWithFileModel? pickedImageWithFileModel, {
    bool isDeleteImageTriggered = false,
  }) async {
    emit(
      state.copyWith(
        userImageWithFileModel: pickedImageWithFileModel,
        isDeleteUserImageTriggered: isDeleteImageTriggered,
      ),
    );
  }

  Future<void> updateProfileUser() async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));

    final updatedUser = state.userModelForEditing;
    // .copyWith(
    //   phoneNumber: state.userPhone?.value?.nsn,
    // );

    final result = await iAuth.updateProfileUser(
      updatedUser,
      state.userImageWithFileModel,
      deleteImageTriggered: state.isDeleteUserImageTriggered,
    );

    emit(
      result.fold(
        (l) => state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(l)),
        ),
        (r) => state.copyWith(
          isLoading: false,
          userModel: r,
          userModelForEditing: r,
          userImageWithFileModel: null,
          isDeleteUserImageTriggered: false,
          failureOrSuccessOption: some(right(unit)),
        ),
      ),
    );
  }
}
