import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomSvgAvatar extends StatelessWidget {
  const CustomSvgAvatar({
    super.key,
    this.width,
    this.height,
    this.decoration,
    this.isOnline,
  });

  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final bool? isOnline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? getSize(context).width / 4,
      height: height ?? getSize(context).width / 4,
      decoration: decoration,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? 'assets/app_logo_svg.svg'
                  : 'assets/app_logo_svg.svg',
            ),
          ),
          if (isOnline ?? false)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: (width ?? getSize(context).width / 4) / 4,
                height: (height ?? getSize(context).width / 4) / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: $constants.palette.main,
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
