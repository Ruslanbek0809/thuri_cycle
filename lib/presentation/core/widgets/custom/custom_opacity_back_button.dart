import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:universal_platform/universal_platform.dart';

class CustomOpacityBackButton extends StatelessWidget {
  const CustomOpacityBackButton({this.onTap, super.key});
  final Future<void> Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: $constants.palette.black.withOpacity(0.5),
      shape: const CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all($constants.insets.xxs + 1),
        child: InkWell(
          onTap: onTap ?? () => context.router.maybePop(),
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            UniversalPlatform.isIOS
                ? Icons.arrow_back_ios_new_rounded
                : Icons.arrow_back_rounded,
            size: getTabletType() ? 40 : 20,
            color: $constants.palette.white,
          ),
        ),
      ),
    );
  }
}
