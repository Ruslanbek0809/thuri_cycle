import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/guide/guide.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';

part 'community_guides_cubit.freezed.dart';
part 'community_guides_state.dart';

@injectable
class CommunityGuidesCubit extends Cubit<CommunityGuidesState> {
  CommunityGuidesCubit(this.iCommunity)
      : super(const CommunityGuidesState.initial());

  final ICommunity iCommunity;

  Future<void> getGuides() async {
    emit(const CommunityGuidesState.loading());

    final response = await iCommunity.getGuides();

    emit(
      response.fold(
        (failure) => CommunityGuidesState.failed(failure: failure),
        (guides) => CommunityGuidesState.success(guides: guides),
      ),
    );
  }
}
