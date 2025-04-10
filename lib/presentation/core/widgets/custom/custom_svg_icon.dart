import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomSvgIcon extends StatelessWidget {
  const CustomSvgIcon({
    required this.icon,
    required this.color,
    this.size,
    super.key,
  });
  final String icon;
  final double? size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/$icon.svg',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      height: size ?? (getTabletType() ? 48 : 24),
      width: size ?? (getTabletType() ? 48 : 24),
    );
  }
}
