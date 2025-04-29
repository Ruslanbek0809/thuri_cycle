import 'package:collection/collection.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/l10n/l10n.dart';

//TODO [optimization]: Change it to carousel slider
class MarkerPhotoListWidget extends StatelessWidget {
  const MarkerPhotoListWidget(this.imageProviders, {super.key});
  final Iterable<Image> imageProviders;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imageProviders
            .expandIndexed(
              (index, image) => [
                if (index == 0) const SizedBox(width: 16),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: GestureDetector(
                    onTap: () {
                      final imageProvider = MultiImageProvider(
                        imageProviders
                            .map((e) => e.image)
                            .toList(growable: false),
                        initialIndex: index,
                      );
                      showImageViewerPager(
                        context,
                        imageProvider,
                        closeButtonTooltip: context.l10n.close,
                        doubleTapZoomable: true,
                      );
                    },
                    child: image,
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
