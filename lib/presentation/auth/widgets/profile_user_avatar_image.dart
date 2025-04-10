import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

class ProfileUserAvatarImage extends StatelessWidget {
  const ProfileUserAvatarImage({this.pickedFile, super.key});
  final XFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: $constants.palette.circleAvatarColor,
          radius: 62,
          child: pickedFile != null
              ? ClipOval(
                  child: Image.file(
                    File(pickedFile!.path),
                    height: 124,
                    width: 124,
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
                )
              : Icon(
                  Icons.person_rounded,
                  size: 64,
                  color: $constants.palette.white,
                ),
        ),
        if (pickedFile == null)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: $constants.palette.main,
              ),
              child: Icon(
                Icons.add_rounded,
                size: 20,
                color: $constants.palette.white,
              ),
            ),
          ),
      ],
    );
  }
}
