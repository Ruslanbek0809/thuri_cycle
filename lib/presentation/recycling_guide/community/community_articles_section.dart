import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/community/community_articles/community_articles_cubit.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article_widget.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article_widget_skeleton.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_colors.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_shadows.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_text_styles.dart';
import 'package:thuri_cycle/router.gr.dart';

class CommunityArticlesSection extends StatelessWidget {
  const CommunityArticlesSection({super.key});

  Widget articlePlaceholder({Widget? child}) => Container(
        decoration: BoxDecoration(
          boxShadow: [AppShadows.primary],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Read Articles',
            style: AppTextStyles.blackBlack22.copyWith(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 10),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: BlocBuilder<CommunityArticlesCubit, CommunityArticlesState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return Container(
                key: ValueKey(state),
                child: state.maybeWhen(
                  orElse: Container.new,
                  loading: () => GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 270,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                        const ArticleWidgetSkeleton(),
                  ),
                  failed: (e) => Center(child: Text(mapFailureToMessage(e))),
                  success: (articles) => GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 310,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: articles.length,
                    itemBuilder: (context, index) => ArticleWidget(
                      article: articles[index],
                      onTap: (Article article) async {
                        await context.router
                            .push(ArticleRoute(article: article));
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Container(
                //   decoration: BoxDecoration(
                //     boxShadow: [AppShadows.primary],
                //   ),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(16),
                //     child: Container(
                //       height: 240,
                //       color: AppColors.white,
                //       child: Row(
                //         children: [
                //           Expanded(
                //             child: Container(
                //               decoration: const BoxDecoration(
                //                 color: AppColors.white,
                //                 // boxShadow: [AppShadows.primary],
                //               ),
                //               child: Padding(
                //                 padding: const EdgeInsets.all(20),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'Article'.toUpperCase(),
                //                       style: AppTextStyles.blackBlack22.copyWith(
                //                         color: AppColors.secondary,
                //                         fontSize: 12,
                //                       ),
                //                     ),
                //                     Text(
                //                       'Can Recycling Really Help Combat Climate Change?',
                //                       style: AppTextStyles.blackBlack22.copyWith(fontSize: 19.5),
                //                     ),
                //                     const Spacer(),
                //                     AppButton.primary(
                //                       fillColor: AppColors.secondary,
                //                       textColor: AppColors.white,
                //                       height: 45,
                //                       width: 120,
                //                       borderRadius: 16,
                //                       onTap: () {},
                //                       hasShadow: false,
                //                       child: const Text('Read Now'),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Image.network(
                //               'https://images.unsplash.com/photo-1690902303020-a980f1eda16b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1015&q=80',
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),