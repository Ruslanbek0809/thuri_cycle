import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/domain/report_waste/i_resolve.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';

part 'resolve_form_cubit.freezed.dart';
part 'resolve_form_state.dart';

@injectable
class ResolveFormCubit extends Cubit<ResolveFormState> {
  ResolveFormCubit(this._resolveFacade) : super(ResolveFormState.initial());
  final IResolveFacade _resolveFacade;

  void reset() => emit(ResolveFormState.initial());

  void addImage(ImageWithFileModel imageWithImageModel) {
    emit(state.copyWith(
        resolvedImages: [...state.resolvedImages, imageWithImageModel]));
  }

  void removeImageAt(int index) {
    final updated = List.of(state.resolvedImages)..removeAt(index);
    emit(state.copyWith(resolvedImages: updated));
  }

  Future<void> submitReport({
    required MapMarkerModel mapMarker,
    required String? userId,
  }) async {
    emit(state.copyWith(isSubmitting: true));

    final result = await _resolveFacade.submitResolve(
      mapMarker: mapMarker,
      resolvedImages: state.resolvedImages,
      resolvedBy: userId ??
          'unknown', // TODO [optimization]: Handle when userId is not known
    );

    emit(
      state.copyWith(
        isSubmitting: false,
        failureOrSuccessOption: optionOf(result),
      ),
    );
  }
}
