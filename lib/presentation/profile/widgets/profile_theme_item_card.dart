import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class ProfileThemeItemCard extends StatelessWidget {
  const ProfileThemeItemCard({
    required this.svgName,
    required this.title,
    this.value,
    this.widget,
    this.onTap,
    super.key,
  });

  final String svgName;
  final String title;
  final String? value;
  final Widget? widget;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all($constants.insets.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //*------------------ ITEM ICON ---------------------//
                Row(
                  children: [
                    SvgPicture.asset(
                      svgName,
                      width: getTabletType() ? 48 : 24,
                      height: getTabletType() ? 48 : 24,
                    ),
                    //*------------------ ITEM TITLE ---------------------//
                    Padding(
                      padding: EdgeInsets.only(left: $constants.insets.sm),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getTextTheme(context).titleMedium!.copyWith(
                              fontSize: responsiveFontSize(
                                context,
                                14.5,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    //*------------------ ITEM VALUE/ARROW FORWARD ICON ---------------------//
                    if (value != null && value!.isNotEmpty)
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: $constants.insets.xs,
                        ),
                        decoration: BoxDecoration(
                          color: getThemeData(context).dividerColor,
                          borderRadius: BorderRadius.circular(
                            $constants.corners.sm + 1,
                          ),
                        ),
                        child: Text(
                          value ?? '',
                          maxLines: 1,
                          style: getTextTheme(context).titleSmall!.copyWith(
                                fontSize: responsiveFontSize(context, 11),
                                fontWeight: FontWeight.w700,
                                color: getThemeData(context).hintColor,
                              ),
                        ),
                      ),
                    if (widget != null)
                      widget!
                    else
                      Padding(
                        padding:
                            EdgeInsets.only(left: $constants.insets.xxs + 2),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: getTabletType() ? 28 : 14,
                          color: getThemeData(context).hintColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
