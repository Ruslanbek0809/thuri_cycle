import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomAvatarImage extends StatelessWidget {
  const CustomAvatarImage({
    super.key,
    this.image,
    this.phImage = 'assets/placeholder_1_1.svg',
    this.fit = BoxFit.cover,
    this.radius = 0.0,
  });
  final String? image;
  final String phImage;
  final BoxFit fit;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? phImage,
      fit: fit,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(phImage),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(phImage),
      ),
    );
  }
}
