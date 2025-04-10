import 'package:flutter/material.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomClearTextIconCard extends StatelessWidget {
  const CustomClearTextIconCard({
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getThemeData(context).dividerColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular($constants.corners.md),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular($constants.corners.md),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.xs,
            vertical: $constants.insets.xxs,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: $constants.insets.xxs),
                child: Text(
                  context.l10n.clear,
                  style: getTextTheme(context).titleSmall!.copyWith(
                        fontSize: responsiveFontSize(context, 12.75),
                      ),
                ),
              ),
              Icon(
                Icons.clear,
                size: 14,
                color: getThemeData(context).tabBarTheme.unselectedLabelColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
