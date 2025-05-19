import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/community/community_featured/community_featured_cubit.dart';
import 'package:thuri_cycle/domain/community/article/article.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/article_widget.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/article_widget_skeleton.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/shared/constants.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/theme/src/app_shadows.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/theme/src/app_text_styles.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/router.gr.dart';

class CommunityFeaturedSection extends StatelessWidget {
  const CommunityFeaturedSection({super.key});

  Widget articleContainer({required String text}) => Container(
        height: AppConstants.featuredArticleHeight,
        decoration: BoxDecoration(
          boxShadow: [AppShadows.primary],
          color: $constants.palette.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(text),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.featured,
            style: AppTextStyles.blackBlack22,
          ),
          const SizedBox(height: 10),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: BlocBuilder<CommunityFeaturedCubit, CommunityFeaturedState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return Container(
                  key: ValueKey(state),
                  child: state.maybeWhen(
                    orElse: Container.new,
                    loading: () => const ArticleWidgetSkeleton.large(),
                    failed: (e) =>
                        articleContainer(text: mapFailureToMessage(context, e)),
                    success: (article) => article != null
                        ? ArticleWidget.large(
                            article: article,
                            onTap: (Article article) async {
                              await context.router
                                  .push(SingleArticleRoute(article: article));
                            },
                          )
                        : articleContainer(text: context.l10n.comingSoon),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
