import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

class CustomOutlineChildButton extends StatelessWidget {
  const CustomOutlineChildButton({
    required this.child,
    required this.onPressed,
    this.borderWidth,
    this.borderColor,
    this.minimumSize,
    this.padding,
    this.borderRadius,
    super.key,
  });
  final Widget child;
  final Function onPressed;
  final double? borderWidth;
  final Color? borderColor;
  final Size? minimumSize;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          width: borderWidth ?? 1.0,
          color: borderColor ?? $constants.palette.main,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular($constants.corners.sm + 1),
        ),
        padding: padding ?? EdgeInsets.zero,
        minimumSize: minimumSize,
      ),
      onPressed: onPressed as VoidCallback,
      child: child,
    );
  }
}
