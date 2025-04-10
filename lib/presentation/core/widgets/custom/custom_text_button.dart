import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.padding,
    this.minimumSize,
    this.borderRadius,
    this.borderSide,
    this.alignment,
    super.key,
  });
  final Widget child;
  final Function onPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? borderSide;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        alignment: alignment,
        backgroundColor: backgroundColor ?? $constants.palette.main,
        surfaceTintColor: backgroundColor ?? $constants.palette.main,
        foregroundColor: Colors.transparent, //* Ripple effect color
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular($constants.corners.md),
          side: borderSide ?? BorderSide.none,
        ),
        padding: padding ?? EdgeInsets.zero,
        minimumSize: minimumSize ?? Size(getSize(context).width, getTabletType() ? 80 : 48),
      ),
      onPressed: onPressed as VoidCallback,
      child: child,
    );
  }
}
