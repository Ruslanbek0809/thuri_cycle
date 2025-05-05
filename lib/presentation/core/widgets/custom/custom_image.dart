import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//TODO [optimization]: Add proper placeholder in place of image and phImage
class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.image = 'assets/app_logo.png',
    this.phImage = 'assets/app_logo.png',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0.0,
    this.alignment = Alignment.center,
    this.svgColor,
  });

  final String image;
  final String phImage;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final AlignmentGeometry alignment;
  final Color? svgColor;

  @override
  Widget build(BuildContext context) {
    if (!image.contains('http')) {
      return !image.contains('.svg')
          ? ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.asset(
                image,
                width: width,
                height: height,
                fit: fit,
                alignment: alignment,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: SvgPicture.asset(
                image,
                width: width,
                height: height,
                fit: fit,
                alignment: alignment,
              ),
            );
    }

    return image.contains('.svg')
        ? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: SvgPicture.network(
              image,
              semanticsLabel: image,
              fit: fit,
              width: width,
              height: height,
              colorFilter: svgColor != null
                  ? ColorFilter.mode(svgColor!, BlendMode.srcIn)
                  : null,
              placeholderBuilder: (BuildContext context) => SvgPicture.asset(
                phImage,
                fit: fit,
                width: width,
                height: height,
                alignment: alignment,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: fit,
              width: width,
              height: height,
              placeholder: (context, url) => SvgPicture.asset(
                phImage,
                fit: fit,
                width: width,
                height: height,
                alignment: alignment,
              ),
              errorWidget: (context, url, error) => SvgPicture.asset(
                phImage,
                fit: fit,
                width: width,
                height: height,
                alignment: alignment,
              ),
            ),
          );
  }
}
