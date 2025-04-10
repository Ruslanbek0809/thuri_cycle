import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomOpacityBlockButton extends StatelessWidget {
  const CustomOpacityBlockButton({this.onTap, super.key});

  final Future<void> Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: $constants.palette.black.withOpacity(0.5),
      shape: const CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all($constants.insets.xxs + 1),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            Icons.block,
            size: getTabletType() ? 40 : 20,
            color: $constants.palette.white,
          ),
        ),
      ),
    );
  }
}
