import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:thuri_cycle/domain/community/guide/guide.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/app_icon_button.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/shared/app_markdown.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/theme/src/app_text_styles.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

//TODO [optimization]: Fix this error: bootstrap() runZonedGuarded() error: XmlParserException: ">" expected at 10:12
//TODO: Optimize UI
@RoutePage()
class SingleGuidePage extends StatelessWidget {
  const SingleGuidePage({required this.guide, super.key});

  final Guide guide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? $constants.palette.secondaryBackground
          : $constants.palette.darkBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top + 60),
                ...AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 200),
                  children: [
                    SizedBox(
                      height: 200,
                      child: CachedNetworkImage(
                        imageUrl: guide.imageUrl,
                        width: double.infinity,
                        imageBuilder: (context, image) => Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned.fill(
                              child: Image(
                                image: image,
                                fit: BoxFit.cover,
                                color:
                                    guide.color.hexToColor().withOpacity(0.75),
                                colorBlendMode: BlendMode.color,
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
                            Positioned.fill(
                              child: ColoredBox(
                                color:
                                    $constants.palette.black.withOpacity(0.4),
                              ),
                            ),
                            Positioned(
                              bottom: 25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // CustomImage(
                                  //   image: guide.iconUrl,
                                  //   height: 60,
                                  // ),
                                  // SvgPicture.network(
                                  //   guide.iconUrl,
                                  //   height: 60,
                                  // ),
                                  const SizedBox(height: 20),
                                  Text(
                                    '${context.l10n.recycling101}: ${Localizations.localeOf(context).languageCode == 'en' ? guide.material : guide.materialDe}',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.whiteExtraBold26,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getSize(context).width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            $constants.corners.md + 6,
                          ),
                        ),
                        margin: EdgeInsets.all($constants.insets.sm),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                            vertical: $constants.insets.xs + 2,
                          ),
                          child: AppMarkdown(
                            text:
                                Localizations.localeOf(context).languageCode ==
                                        'en'
                                    ? guide.content
                                    : guide.contentDe,
                            lineHeight: 1.5,
                          ),
                        ),
                      ),
                    ),
                    if (guide.tip.isNotEmpty)
                      SizedBox(
                        width: getSize(context).width,
                        child: Card(
                          elevation: 0.25,
                          color: const Color(0xFFDFF4D7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              $constants.corners.md + 4,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: $constants.insets.sm,
                              vertical: $constants.insets.xs + 2,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  color: $constants.palette.main,
                                  size: 24,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    guide.tip,
                                    style: AppTextStyles.blackRegular14
                                        .copyWith(height: 1.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                        onTap: () => Navigator.pop(context),
                        size: 45,
                        iconSize: 22,
                        fillColor: $constants.palette.main.withOpacity(0.1),
                        icon: Icons.chevron_left_rounded,
                      ),
                      Text(
                        context.l10n.recycling101,
                        style: AppTextStyles.blackExtraBold18.copyWith(
                          color: $constants.palette.black,
                        ),
                      ),
                      const SizedBox(width: 45),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
