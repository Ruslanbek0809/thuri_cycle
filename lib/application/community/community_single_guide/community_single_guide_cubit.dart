import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/guide/guide.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';

part 'community_single_guide_cubit.freezed.dart';
part 'community_single_guide_state.dart';

@injectable
class CommunitySingleGuideCubit extends Cubit<CommunitySingleGuideState> {
  CommunitySingleGuideCubit(this.iCommunity)
      : super(const CommunitySingleGuideState.initial());

  final ICommunity iCommunity;

  Future<void> getSingleGuide(String id) async {
    emit(const CommunitySingleGuideState.loading());

    final response = await iCommunity.getSingleGuide(id);

    emit(
      response.fold(
        (failure) => CommunitySingleGuideState.failed(failure: failure),
        (singleGuide) =>
            CommunitySingleGuideState.success(singleGuide: singleGuide),
      ),
    );
  }
}
