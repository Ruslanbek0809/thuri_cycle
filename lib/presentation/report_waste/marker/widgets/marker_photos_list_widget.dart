import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_image.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/add_images_widget.dart';

//TODO [optimization]: Change it to carousel slider
class MarkerPhotoListWidget extends StatelessWidget {
  const MarkerPhotoListWidget({
    required this.imageUrls,
    // required this.imageProviders,
    super.key,
  });
  final List<String> imageUrls;
  // final Iterable<Image> imageProviders;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imageUrls
            .expandIndexed(
              (index, image) => [
                if (index == 0) const SizedBox(width: 16),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: GestureDetector(
                    onTap: () {
                      final nonSvgImages = imageUrls
                          .where((url) => !url.endsWith('.svg'))
                          .toList(growable: false);

                      final providers = nonSvgImages
                          .map(
                            (url) => CachedNetworkImageProvider(url)
                                as ImageProvider,
                          )
                          .toList();

                      final initialIndex = nonSvgImages.indexOf(image);

                      if (providers.isNotEmpty) {
                        final imageProvider = MultiImageProvider(
                          providers,
                          initialIndex:
                              initialIndex.clamp(0, providers.length - 1),
                        );

                        showImageViewerPager(
                          context,
                          imageProvider,
                          closeButtonTooltip: context.l10n.close,
                          doubleTapZoomable: true,
                        );
                      }
                    },
                    child: CustomImage(
                      image: image,
                      // width: getSize(context).width,
                      height: AddImagesWidget.imageHeight,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            )
            .toList(growable: false),
      ),
    );
  }
}
