import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thuri_cycle/domain/report_waste/image_with_file.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class AddReportPhotosWidget extends StatelessWidget {
  const AddReportPhotosWidget(
    this.images,
    this.onAddImage,
    this.onRemoveImage, {
    super.key,
  });
  final List<ImageWithFileModel> images;
  final void Function(ImageWithFileModel)? onAddImage;
  final void Function(int)? onRemoveImage;

  static const imageHeight = 256.0;

  Future<void> _captureImage(BuildContext context) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      final file = File(image.path);
      final imageWithImageModel =
          ImageWithFileModel(file: file, path: image.path);
      onAddImage?.call(imageWithImageModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final bgColor = colors.primaryContainer;
    final fgColor = colors.onPrimaryContainer;
    final bgDisabledColor =
        Color.alphaBlend(colors.onSurface.withOpacity(0.12), colors.surface);
    final fgDisabledColor =
        Color.alphaBlend(colors.onSurface.withOpacity(0.38), colors.surface);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[const SizedBox(width: 16)]
            .followedBy(
          images.asMap().entries.expand((entry) {
            final index = entry.key;
            final image = entry.value;
            return [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      $constants.corners.md + 2,
                    ),
                    child: Image.file(
                      image.file,
                      height: imageHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Ink(
                        color:
                            onRemoveImage == null ? bgDisabledColor : bgColor,
                        child: InkWell(
                          onTap: () => onRemoveImage?.call(index),
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: Icon(
                              Icons.close,
                              size: 24,
                              color: onRemoveImage == null
                                  ? fgDisabledColor
                                  : fgColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
            ];
          }),
        )
            .followedBy([
          // Ink(
          //   decoration: BoxDecoration(
          //     color: onAddImage == null ? bgDisabledColor : bgColor,
          //     borderRadius: const BorderRadius.all(Radius.circular(16)),
          //   ),
          //   child: InkWell(
          //     onTap: () => _captureImage(context),
          //     borderRadius: const BorderRadius.all(Radius.circular(16)),
          //     child: const SizedBox(
          //       width: imageHeight / 1.618,
          //       height: imageHeight,
          //       child: Icon(Icons.add_a_photo, size: 32),
          //     ),
          //   ),
          // ),
          //*----------------- PICTURE ADD PLACEHOLDER---------------------//
          InkWell(
            borderRadius: BorderRadius.circular(
              $constants.corners.md + 2,
            ),
            onTap: () => _captureImage(context),
            child: DottedBorder(
              borderType: BorderType.RRect,
              color: getThemeData(context).canvasColor,
              dashPattern: const [5, 5],
              strokeWidth: 2,
              radius: Radius.circular(
                $constants.corners.md + 2,
              ),
              padding: EdgeInsets.zero,
              child: Container(
                width: imageHeight / 1.618,
                height: imageHeight,
                // height: boxConstraints,
                // width: boxConstraints,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    $constants.corners.md + 2,
                  ),
                  color: getThemeData(context).cardTheme.color,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.add_a_photo,
                  color: getThemeData(context).canvasColor,
                  size: 28,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ]).toList(growable: false),
      ),
    );
  }
}
