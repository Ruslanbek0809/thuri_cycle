import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:thuri_cycle/application/community/community_articles/community_articles_cubit.dart';
import 'package:thuri_cycle/application/community/community_featured/community_featured_cubit.dart';
import 'package:thuri_cycle/application/community/community_guides/community_guides_cubit.dart';
import 'package:thuri_cycle/application/community/community_single_guide/community_single_guide_cubit.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/app_icon_button.dart';
import 'package:thuri_cycle/presentation/community/widgets/community_articles_section.dart';
import 'package:thuri_cycle/presentation/community/widgets/community_featured_section.dart';
import 'package:thuri_cycle/presentation/community/widgets/community_guide_section.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

//TODO [optimization]: Refactor everything inside the page later (plus add error widgets in bloc sections)
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
        BlocProvider(
          create: (_) => getIt<CommunityGuidesCubit>()..getGuides(),
        ),
        BlocProvider(
          create: (_) => getIt<CommunitySingleGuideCubit>(),
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
                //TODO: Implement these but handle bloc provider properly for this
                // if (context.mounted) {
                //   await context
                //       .read<CommunityFeaturedCubit>()
                //       .getFeaturedArticle();
                // }
                // if (context.mounted) {
                //   await context.read<CommunityArticlesCubit>().getAllArticles();
                // }

                // if (context.mounted) {
                //   await context.read<CommunityGuidesCubit>().getGuides();
                // }
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
                        const SizedBox(height: 30),
                        const CommunityGuidesSection(),
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
                color: $constants.palette.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: 'search_bar',
                      child: AppIconButton(
                        onTap: () {
                          //TODO [optimization]: Add in the next update
                          scaffoldMessengerKey.currentState
                            ?..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBarHelper.createInformation(
                                message: context.l10n.comingInNextUpdate,
                              ),
                            );
                          // GoRouter.of(context).pushNamed(RouteNames.search);
                        },
                        size: 45,
                        iconSize: 22,
                        fillColor: $constants.palette.main.withOpacity(0.1),
                        icon: Icons.search_rounded,
                      ),
                    ),
                    Text(
                      context.l10n.community,
                      style: getTextTheme(context).titleLarge!.copyWith(
                            fontSize: responsiveFontSize(context, 22),
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Hero(
                      tag: 'search_close',
                      child: AppIconButton(
                        onTap: () {
                          //TODO [optimization]: Add in the next update
                          scaffoldMessengerKey.currentState
                            ?..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBarHelper.createInformation(
                                message: context.l10n.comingInNextUpdate,
                              ),
                            );
                        },
                        // onTap: () => GoRouter.of(context).pushNamed(RouteNames.bookmarks),
                        size: 45,
                        iconSize: 22,
                        fillColor: $constants.palette.main.withOpacity(0.1),
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
