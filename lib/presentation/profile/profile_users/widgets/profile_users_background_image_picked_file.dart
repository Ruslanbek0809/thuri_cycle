import 'dart:io';

import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUsersBackgroundImagePickedFile extends StatelessWidget {
  const ProfileUsersBackgroundImagePickedFile({
    this.pickedFile,
    this.onTap,
    super.key,
  });

  final XFile? pickedFile;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final safeTopPadding = MediaQuery.of(context).padding.top;

    return Stack(
      children: [
        if (pickedFile != null)
          Image.file(
            File(pickedFile!.path),
            height: getSize(context).height * (getTabletType() ? 0.3 : 0.27),
            width: getSize(context).width,
            fit: BoxFit.fitWidth,
            errorBuilder: (
              BuildContext context,
              Object error,
              StackTrace? stackTrace,
            ) {
              return const Center(
                child: Text(
                  'This image type is not supported',
                ),
              );
            },
          )
        else
          CustomImage(
            image: getProfileBackground(context),
            height: getSize(context).height * (getTabletType() ? 0.3 : 0.27),
            width: getSize(context).width,
          ),
        Positioned(
          top: safeTopPadding + $constants.insets.sm,
          right: $constants.insets.sm,
          child: Card(
            color: $constants.palette.black.withOpacity(0.5),
            shape: const CircleBorder(),
            child: Padding(
              padding: EdgeInsets.all($constants.insets.xxs + 1),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(100),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: $constants.palette.white,
                  size: getTabletType() ? 40 : 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
