import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class SimpleDialogThemeChangeCard extends StatelessWidget {
  const SimpleDialogThemeChangeCard({
    required this.themeMode,
    required this.svgAsset,
    this.isSelected = false,
    this.isNextItemExist = true,
    this.onTap,
    super.key,
  });

  final ThemeMode themeMode;
  final bool isSelected;
  final bool isNextItemExist;
  final String svgAsset;
  final void Function(ThemeMode)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!(themeMode);
      },
      child: Ink(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: $constants.insets.sm + 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //*------------------ ITEM ICON/TITLE ---------------------//

                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          svgAsset,
                          width: getTabletType() ? 48 : 24,
                          height: getTabletType() ? 48 : 24,
                        ),
                        SizedBox(width: $constants.insets.sm),
                        Flexible(
                          child: Text(
                            themeMode.name[0].toUpperCase() +
                                themeMode.name.substring(1),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: isSelected
                                ? getTextTheme(context).titleMedium!.copyWith(
                                      fontSize: responsiveFontSize(
                                        context,
                                        14.5,
                                      ),
                                      color: $constants.palette.main,
                                    )
                                : getTextTheme(context).titleMedium!.copyWith(
                                      fontSize: responsiveFontSize(
                                        context,
                                        14.5,
                                      ),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //*------------------ SELECTED CHECK ICON ---------------------//
                  if (isSelected)
                    SvgPicture.asset(
                      'assets/profile/theme_mode_check.svg',
                      height: getTabletType() ? 40 : 20,
                      width: getTabletType() ? 40 : 20,
                    ),
                ],
              ),
            ),
            //*------------------ DIVIDER ---------------------//
            if (isNextItemExist)
              Container(
                height: 0.5,
                color: getThemeData(context).canvasColor,
              ),
          ],
        ),
      ),
    );
  }
}
