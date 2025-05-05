import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/auth/i_auth_facade.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';

part 'single_marker_form_cubit.freezed.dart';
part 'single_marker_form_state.dart';

// Reusable for both profile card + edit page
@injectable
class SingleMarkerFormCubit extends Cubit<SingleMarkerFormState> {
  SingleMarkerFormCubit(
    this.iAuth,
  ) : super(SingleMarkerFormState.initial());

  final IAuth iAuth;

  //TODO [optimization]: Remove isLoading & failureOrSuccessOption if not needed
  Future<void> getUserModelByID(
    String? uid, {
    bool isReportedByUser = false,
  }) async {
    if (uid != null) {
      final userOption = await iAuth.getUserModelByID(uid);
      userOption.fold(
        () => null, // TODO [optimization]: Handle null part
        (userModel) => isReportedByUser
            ? emit(state.copyWith(reportedByUser: userModel))
            : emit(state.copyWith(resolvedByUser: userModel)),
      );
    }
  }
}
