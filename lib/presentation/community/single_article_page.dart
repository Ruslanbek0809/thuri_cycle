import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:thuri_cycle/domain/community/article/article.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/app_icon_button.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/shared/app_markdown.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/theme/src/app_icons.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/theme/src/app_text_styles.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

// import '../../providers/user_provider.dart';

// final expandedPositionProvider = StateProvider<Offset?>((ref) => null);

GlobalKey _summaryKey = GlobalKey();

@RoutePage()
class SingleArticlePage extends StatelessWidget {
  const SingleArticlePage({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    // final expandedPositon = ref.watch(expandedPositionProvider);
    // final isBookmarked =
    //     ref.watch(userProvider)!.bookmarks.contains(article.uid);

    Widget buildSummaryBlock({bool expandable = false}) {
      return GestureDetector(
        onTap: HapticFeedback.lightImpact,
        // onTap: () {
        //   HapticFeedback.lightImpact();
        //   if (expandedPositon == null) {
        //     RenderBox box =
        //         _summaryKey.currentContext?.findRenderObject() as RenderBox;
        //     Offset? offset = box.localToGlobal(Offset.zero);
        //     ref.read(expandedPositionProvider.notifier).state = offset;
        //   } else {
        //     ref.read(expandedPositionProvider.notifier).state = null;
        //   }
        // },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: $constants.palette.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0x86CCCCCC)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: $constants.palette.main.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: AppIcons.icon(AppIcons.local),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.aiGenerated,
                            style: AppTextStyles.blackBlack22.copyWith(
                              fontWeight: FontWeight.w900,
                              color: $constants.palette.main,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            context.l10n.articleSummary,
                            style: AppTextStyles.blackBlack22
                                .copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        context.l10n.hide,
                        // expandedPositon == null ? 'Show' : 'Hide',
                        style: AppTextStyles.blackExtraBold16
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                  if (expandable)
                    // if (expandable && expandedPositon != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        Localizations.localeOf(context).languageCode == 'en'
                            ? article.summary
                            : article.summaryDe,
                        textAlign: TextAlign.start,
                        style: AppTextStyles.grayMedium16,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Page content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top + 90),
                ...AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 200),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: $constants.palette.main.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        article.tag.toUpperCase(),
                        style: AppTextStyles.primaryExtraBold14.copyWith(
                          color: $constants.palette.main,
                          height: 1.42,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 280,
                      child: Text(
                        article.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.blackBlack22
                            .copyWith(fontSize: 24, height: 1.2),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${DateFormat('MMMM d y').format(article.date)}  •  ThuriCycle',
                      style: AppTextStyles.graySemiBold12,
                    ),
                    const SizedBox(height: 35),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: article.imageUrl,
                          height: 280,
                          width: double.infinity,
                          imageBuilder: (context, image) => Stack(
                            children: [
                              Positioned.fill(
                                child: Image(
                                  image: image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 12,
                                child: Text(
                                  '@Unsplash',
                                  style: AppTextStyles.whiteSemiBold12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          key: _summaryKey,
                          child: buildSummaryBlock(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: AppMarkdown(
                        text:
                            Localizations.localeOf(context).languageCode == 'en'
                                ? article.content
                                : article.contentDe,
                        lineHeight: 1.5,
                      ),
                    ),
                  ],
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 55,
                    child: FadeInAnimation(child: widget),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.bottom + 100,
                ),
              ],
            ),
          ),
          // Top Navigation
          Positioned(
            top: 0,
            width: MediaQuery.of(context).size.width,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 12,
                    top: MediaQuery.of(context).viewPadding.top,
                  ),
                  color: $constants.palette.white.withOpacity(0.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIconButton(
                        onTap: () {},
                        // onTap: () => GoRouter.of(context).pop(),
                        size: 45,
                        iconSize: 22,
                        fillColor: $constants.palette.main.withOpacity(0.1),
                        icon: Icons.chevron_left_rounded,
                      ),
                      Text(
                        context.l10n.article,
                        style: AppTextStyles.blackExtraBold18.copyWith(
                          color: $constants.palette.black,
                        ),
                      ),
                      AppIconButton(
                        onTap: () {
                          // if (!isBookmarked) {
                          //   ref.read(userProvider.notifier).addBookmark(article.uid, (success) {
                          //     AppToast.of(context).show(
                          //       gravity: ToastGravity.BOTTOM,
                          //       text: 'Added to bookmarks!',
                          //     );
                          //   });
                          // } else {
                          //   ref.read(userProvider.notifier).removeBookmark(article.uid, (success) {
                          //     AppToast.of(context).show(
                          //       gravity: ToastGravity.BOTTOM,
                          //       text: 'Removed from bookmarks!',
                          //     );
                          //   });
                          // }
                        },
                        size: 45,
                        iconSize: 22,
                        fillColor: $constants.palette.main.withOpacity(0.1),
                        icon: Icons.bookmark_outline_rounded,
                        // icon: isBookmarked
                        //     ? Icons.bookmark_rounded
                        //     : Icons.bookmark_outline_rounded,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Positioned.fill(
          //   child: IgnorePointer(
          //     ignoring: expandedPositon == null,
          //     child: AnimatedOpacity(
          //       duration: const Duration(milliseconds: 200),
          //       opacity: expandedPositon != null ? 1 : 0,
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(12),
          //         child: BackdropFilter(
          //           filter: ImageFilter.blur(
          //             sigmaX: 30,
          //             sigmaY: 30,
          //           ),
          //           child: Container(
          //             color: Colors.white.withOpacity(0.8),
          //             width: double.infinity,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // if (expandedPositon != null) ...[
          //   Positioned(
          //     top: expandedPositon.dy,
          //     left: expandedPositon.dx,
          //     child: ,
          //   ),
          // ],
          buildSummaryBlock(expandable: true),
          // if (expandedPositon != null) ...[
          //   Positioned(
          //     top: expandedPositon.dy,
          //     left: expandedPositon.dx,
          //     child: buildSummaryBlock(expandable: true),
          //   ),
          // ],
        ],
      ),
    );
  }
}
