import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomElevatedGradientButton extends StatelessWidget {
  const CustomElevatedGradientButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.elevation,
    this.padding,
    this.size,
    this.borderRadius,
    this.borderSide,
    super.key,
  });
  final Widget child;
  final Function onPressed;
  final Color? backgroundColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? $constants.palette.main,
        foregroundColor: Colors.transparent, //* Ripple effect color
        elevation: elevation ?? 0,
        shadowColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular($constants.corners.md + 2),
          side: borderSide ?? BorderSide.none,
        ),
        padding: padding ?? EdgeInsets.zero,
        minimumSize:
            size ?? Size(getSize(context).width, getTabletType() ? 80 : 56),
      ),
      onPressed: onPressed as VoidCallback,
      child: child,
    );
  }
}
