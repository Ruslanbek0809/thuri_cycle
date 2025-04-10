import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.padding,
    this.size,
    this.borderRadius,
    this.borderSide,
    super.key,
  });

  final Widget child;
  final Function onPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? $constants.palette.main,
        foregroundColor: Colors.transparent,
        //* Ripple effect color
        elevation: 0,
        shadowColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular($constants.corners.md + 2),
          side: borderSide ?? BorderSide.none,
        ),
        padding: padding ?? EdgeInsets.zero,
        minimumSize:
            size ?? Size(getSize(context).width, getTabletType() ? 80 : 56),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed as VoidCallback,
      child: child,
    );
  }
}
