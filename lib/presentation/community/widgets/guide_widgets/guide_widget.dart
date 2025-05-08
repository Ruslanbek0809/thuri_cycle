import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thuri_cycle/domain/community/guide/guide.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/shared/bouncing.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/theme/src/app_colors.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/theme/src/app_shadows.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/theme/src/app_text_styles.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_image.dart';

class GuideWidget extends StatelessWidget {
  const GuideWidget({
    required this.guide,
    super.key,
    this.onTap,
  });

  final Guide guide;
  final void Function(Guide)? onTap;

  @override
  Widget build(BuildContext context) => Bouncing(
        onTap: () => onTap?.call(guide),
        child: Container(
          padding: EdgeInsets.fromLTRB(
            0,
            $constants.insets.xs,
            $constants.insets.xs,
            $constants.insets.xs,
          ),
          width: getSize(context).width / 1.75,
          decoration: BoxDecoration(
            color: $constants.palette.white,
            borderRadius: BorderRadius.circular(
              $constants.insets.xs + $constants.insets.xxs,
            ),
            border: Border.all(color: const Color(0xfff2f2f2)),
            boxShadow: [AppShadows.primary],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: guide.imageUrl,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Shimmer.fromColors(
                          baseColor: $constants.palette.black.withOpacity(0.1),
                          highlightColor:
                              $constants.palette.black.withOpacity(0.08),
                          child: Container(
                            width: double.infinity,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                      //TODO [optimization]: Use color or remove
                      // Positioned.fill(
                      //   child: ColoredBox(
                      //     color: guide.color.hexToColor().withOpacity(0.8),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomImage(image: guide.iconUrl),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.howToRecycle,
                    style: AppTextStyles.blackBlack22.copyWith(
                      fontWeight: FontWeight.w900,
                      color: $constants.palette.main,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    Localizations.localeOf(context).languageCode == 'en'
                        ? guide.material
                        : guide.materialDe,
                    style: AppTextStyles.blackBlack22
                        .copyWith(fontSize: 17, height: 1.2),
                  ),
                ],
              ),
              const SizedBox(width: 25),
            ],
          ),
        ),
      );
}
