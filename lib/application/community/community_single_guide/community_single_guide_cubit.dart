import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';
import 'package:thuri_cycle/presentation/recycling_guide/community/guide_widgets/guide/guide.dart';

part 'community_single_guide_state.dart';
part 'community_single_guide_cubit.freezed.dart';

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
