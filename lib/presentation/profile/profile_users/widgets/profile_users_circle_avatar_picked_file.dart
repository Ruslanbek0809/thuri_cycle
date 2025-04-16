import 'dart:io';

import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_lottie_avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUsersCircleAvatarPickedFile extends StatelessWidget {
  const ProfileUsersCircleAvatarPickedFile({this.pickedFile, super.key});

  final XFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (pickedFile != null)
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 3,
                  color: getThemeData(context).scaffoldBackgroundColor),
            ),
            width: getTabletType() ? 208 : 104,
            height: getTabletType() ? 208 : 104,
            child: ClipOval(
              child: Image.file(
                File(pickedFile!.path),
                fit: BoxFit.cover,
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
              ),
            ),
          )
        else
          CustomLottieAvatar(
            width: getTabletType() ? 208 : 104,
            height: getTabletType() ? 208 : 104,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 3,
                  color: getThemeData(context).scaffoldBackgroundColor),
            ),
          ),
        Card(
          color: $constants.palette.black.withOpacity(0.5),
          shape: const CircleBorder(),
          child: Padding(
            padding: EdgeInsets.all($constants.insets.xxs + 1),
            child: Icon(
              Icons.camera_alt_outlined,
              color: $constants.palette.white,
              size: getTabletType() ? 40 : 20,
            ),
          ),
        ),
      ],
    );
  }
}
