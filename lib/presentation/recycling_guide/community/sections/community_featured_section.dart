import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/community/community_featured/community_featured_cubit.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article_widget.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article_widget_skeleton.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/shared/constants.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_colors.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_shadows.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_text_styles.dart';
import 'package:thuri_cycle/router.gr.dart';

class CommunityFeaturedSection extends StatelessWidget {
  const CommunityFeaturedSection({super.key});

  Widget articleContainer({required String text}) => Container(
        height: AppConstants.featuredArticleHeight,
        decoration: BoxDecoration(
          boxShadow: [AppShadows.primary],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(text),
        ),
      );

  @override
  Widget build(BuildContext context) {
    // final articleState = ref.watch(featuredArticleProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured',
            style: AppTextStyles.blackBlack22,
          ),
          const SizedBox(height: 10),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: BlocBuilder<CommunityFeaturedCubit, CommunityFeaturedState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: Container.new,
                  loading: () => const ArticleWidgetSkeleton.large(),
                  failed: (e) => articleContainer(text: (e).message),
                  success: (article) => article != null
                      ? ArticleWidget.large(
                          article: article,
                          onTap: (Article article) async {
                            await context.router
                                .push(ArticleRoute(article: article));
                          },
                        )
                      : articleContainer(text: 'Coming soon!'),
                );
              },
            ),
            // Container(
            //   key: ValueKey(articleState),
            //   child: articleState.when(
            //     data: (article) => article != null
            //         ? ArticleWidget.large(
            //             article: article,
            //             onTap: (Article article) async {
            //               await context.router.push(const ArticleRoute());
            //             },
            //           )
            //         : articleContainer(text: 'Coming soon!'),
            //     loading: () => const ArticleWidgetSkeleton.large(),
            //     error: (e, tr) => articleContainer(
            //         text: e is ApiError ? (e).message : 'Error occurred'),
            //   ),
            // ),
            // Container(
            //   key: ValueKey(articleState),
            //   child: articleState.when(
            //     data: (article) => article != null
            //         ? ArticleWidget.large(
            //             article: article,
            //             onTap: (Article article) async {
            //               await context.router.push(const ArticleRoute());
            //             },
            //           )
            //         : articleContainer(text: 'Coming soon!'),
            //     loading: () => const ArticleWidgetSkeleton.large(),
            //     error: (e, tr) => articleContainer(
            //         text: e is ApiError ? (e).message : 'Error occurred'),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
