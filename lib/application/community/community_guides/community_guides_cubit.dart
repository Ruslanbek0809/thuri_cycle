import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/alert_model.dart';
import 'package:thuri_cycle/presentation/recycling_guide/community/guide_widgets/guide/guide.dart';

part 'community_guides_state.dart';
part 'community_guides_cubit.freezed.dart';

@injectable
class CommunityGuidesCubit extends Cubit<CommunityGuidesState> {
  CommunityGuidesCubit(this.iCommunity)
      : super(const CommunityGuidesState.initial());

  final ICommunity iCommunity;

  Future<void> getGuides() async {
    emit(const CommunityGuidesState.loading());

    // final response = await iCommunity.getGuides();

    // emit(
    //   response.fold(
    //     (error) => CommunityArticlesState.failed(alert: error),
    //     (guides) => CommunityArticlesState.success(guides: guides),
    //   ),
    // );
  }
}
