import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      height: 1,
      color: Theme.of(context).brightness == Brightness.dark
          ? getThemeData(context).dividerColor
          : const Color(0x1F000000),
    );
  }
}
