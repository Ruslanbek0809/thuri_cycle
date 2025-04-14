import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:thuri_cycle/application/community/community_articles/community_articles_cubit.dart';
import 'package:thuri_cycle/application/community/community_featured/community_featured_cubit.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/app_icon_button.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_colors.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_text_styles.dart';
import 'package:thuri_cycle/presentation/recycling_guide/community/sections/community_articles_section.dart';
import 'package:thuri_cycle/presentation/recycling_guide/community/sections/community_featured_section.dart';

//TODO: Look for changes from old project for this page and apply any needed features from it if needed
//TODO: Refactor everything inside the page later (plus add error widgets in bloc sections)
@RoutePage()
class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CommunityFeaturedCubit>()..getFeaturedArticle(),
        ),
        BlocProvider(
          create: (_) => getIt<CommunityArticlesCubit>()..getAllArticles(),
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Page content
            RefreshIndicator.adaptive(
              edgeOffset: MediaQuery.of(context).viewPadding.top + 60,
              onRefresh: () async {
                await HapticFeedback.lightImpact();
              },
              // onRefresh: () async {
              //   HapticFeedback.lightImpact();
              //   ref
              //     ..invalidate(articlesProvider)
              //     ..invalidate(featuredArticleProvider)
              //     ..invalidate(guidesProvider);
              // },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).viewPadding.top + 80,
                    ),
                    ...AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 200),
                      delay: const Duration(milliseconds: 80),
                      children: [
                        const CommunityFeaturedSection(),
                        // const SizedBox(height: 30),
                        // const CommunityGuidesSection(),
                        // const SizedBox(height: 10),
                        // const CommunityChallengesSection(),
                        const SizedBox(height: 20),
                        const CommunityArticlesSection(),
                      ],
                      childAnimationBuilder: (widget) => SlideAnimation(
                        verticalOffset: 30,
                        child: FadeInAnimation(child: widget),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewPadding.bottom + 120,
                    ),
                  ],
                ),
              ),
            ),
            // Top Navigation
            Positioned(
              top: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 12,
                  top: MediaQuery.of(context).viewPadding.top,
                ),
                color: AppColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: 'search_bar',
                      child: AppIconButton(
                        onTap: () {
                          // GoRouter.of(context).pushNamed(RouteNames.search);
                        },
                        size: 45,
                        iconSize: 22,
                        fillColor: AppColors.primary.withOpacity(0.1),
                        icon: Icons.search_rounded,
                      ),
                    ),
                    Text(
                      'Community',
                      style: AppTextStyles.blackBlack22.copyWith(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Hero(
                      tag: 'search_close',
                      child: AppIconButton(
                        onTap: () {},
                        // onTap: () => GoRouter.of(context).pushNamed(RouteNames.bookmarks),
                        size: 45,
                        iconSize: 22,
                        fillColor: AppColors.primary.withOpacity(0.1),
                        icon: Icons.bookmarks_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
