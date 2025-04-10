import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomBarForBottomSheet extends StatelessWidget {
  const CustomBarForBottomSheet({
    this.extraMargin,
    super.key,
  });

  final double? extraMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: $constants.insets.xxs + 1,
      margin: EdgeInsets.only(
        top: $constants.insets.sm + 4,
        bottom: $constants.insets.sm,
        left: (getSize(context).width / 2.4) + (extraMargin ?? 0),
        right: (getSize(context).width / 2.4) + (extraMargin ?? 0),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: getThemeData(context).canvasColor,
        borderRadius: BorderRadius.circular($constants.corners.md + 2),
      ),
    );
  }
}
