import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/shared/bouncing.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_colors.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_shadows.dart';
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/theme/src/app_text_styles.dart';
import 'package:thuri_cycle/presentation/recycling_guide/community/guide_widgets/guide/guide.dart';

class GuideWidget extends StatelessWidget {
  const GuideWidget({
    required this.guide,
    super.key,
    this.onTap,
  });

  final Guide guide;
  final Function(Guide)? onTap;

  @override
  Widget build(BuildContext context) => Bouncing(
        onTap: () => onTap?.call(guide),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
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
                          baseColor: Colors.black.withOpacity(0.1),
                          highlightColor: Colors.black.withOpacity(0.08),
                          child: Container(
                            width: double.infinity,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: ColoredBox(
                          color: guide.color.hexToColor().withOpacity(0.8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.network(guide.iconUrl),
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
                    'How to recycle...',
                    style: AppTextStyles.blackBlack22.copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.secondary,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    guide.material,
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
