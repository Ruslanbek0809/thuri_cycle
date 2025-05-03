import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/community/article/article.dart';
import 'package:thuri_cycle/domain/community/i_community.dart';
import 'package:thuri_cycle/domain/core/firebase_failure.dart';

part 'community_featured_cubit.freezed.dart';
part 'community_featured_state.dart';

@injectable
class CommunityFeaturedCubit extends Cubit<CommunityFeaturedState> {
  CommunityFeaturedCubit(this.iCommunity)
      : super(const CommunityFeaturedState.initial());

  final ICommunity iCommunity;

  Future<void> getFeaturedArticle() async {
    emit(const CommunityFeaturedState.loading());

    final response = await iCommunity.getFeaturedArticle();

    emit(
      response.fold(
        (failure) => CommunityFeaturedState.failed(failure: failure),
        (article) => CommunityFeaturedState.success(article: article),
      ),
    );
  }
}
