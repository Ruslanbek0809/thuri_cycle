import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    this.isSizedBox = false,
    this.height,
    this.width,
    this.strokeWidth,
    this.color,
    super.key,
  });

  final bool isSizedBox;
  final double? height;
  final double? width;
  final double? strokeWidth;
  final Color? color;

  Widget _getIndicatorWidget(TargetPlatform platform, BuildContext context) {
    Widget indicator;
    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      indicator = CupertinoActivityIndicator(
        color: color ?? $constants.palette.main,
      );
    } else {
      indicator = CircularProgressIndicator(
        color: color ?? $constants.palette.main,
        strokeWidth: strokeWidth ?? 4.0,
      );
    }

    if (isSizedBox) {
      return SizedBox(
        height: height ?? 24,
        width: width ?? 24,
        child: Center(child: indicator),
      );
    } else {
      return Center(child: indicator);
    }
  }

  @override
  Widget build(BuildContext context) =>
      _getIndicatorWidget(Theme.of(context).platform, context);
}
