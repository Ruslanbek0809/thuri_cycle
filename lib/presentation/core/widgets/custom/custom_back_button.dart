import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:universal_platform/universal_platform.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    this.icon,
    this.size,
    this.color,
    this.onTap,
    super.key,
  });
  final IconData? icon;
  final double? size;
  final Color? color;
  final Future<void> Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ?? () => context.router.maybePop(),
      color: color ?? $constants.palette.iconColor,
      icon: Icon(
        UniversalPlatform.isIOS
            ? icon ?? Icons.arrow_back_ios_new_rounded
            : icon ?? Icons.arrow_back_rounded,
        size: size,
        color: color ?? $constants.palette.iconColor,
      ),
    );
  }
}
