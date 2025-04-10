import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomBorderedAvatarImage extends StatelessWidget {
  const CustomBorderedAvatarImage({
    super.key,
    this.image,
    this.phImage = 'assets/placeholder_1_1.svg',
    this.fit = BoxFit.cover,
    this.radius = 0.0,
    this.decoration,
    this.size,
    this.isOnline,
  });

  final String? image;
  final String phImage;
  final BoxFit fit;
  final double radius;
  final BoxDecoration? decoration;
  final Size? size;
  final bool? isOnline;

  @override
  Widget build(BuildContext context) {
    // ignore: use_decorated_box
    return Container(
      decoration: decoration ??
          BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: getThemeData(context).canvasColor),
          ),
      width: size?.width ?? getSize(context).width / 4,
      height: size?.height ?? getSize(context).width / 4,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: image ?? phImage,
                fit: fit,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: radius - 1,
                  backgroundColor: Colors.transparent,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => CircleAvatar(
                  radius: radius - 1,
                  backgroundImage: AssetImage(phImage),
                ),
                errorWidget: (context, url, error) => CircleAvatar(
                  radius: radius - 1,
                  backgroundImage: AssetImage(phImage),
                ),
              ),
            ),
          ),
          if (isOnline ?? false)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: (size?.width ?? getSize(context).width / 4) / 4,
                height: (size?.width ?? getSize(context).width / 4) / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: $constants.palette.green4,
                  border: Border.all(
                    color: getThemeData(context).appBarTheme.backgroundColor!,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
