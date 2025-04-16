import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileUsersSvgItemCard extends StatelessWidget {
  const ProfileUsersSvgItemCard({
    required this.title,
    this.svgName,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  final String? svgName;
  final String title;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.sm,
        ),
        //*------------------ ITEM ICON/TITLE ---------------------//
        child: Row(
          children: [
            if (svgName != null)
              SvgPicture.asset(
                svgName!,
                height: getTabletType() ? 32 : 24,
                width: getTabletType() ? 32 : 24,
              ),
            Padding(
              padding: EdgeInsets.only(
                left: svgName != null ? $constants.insets.xs + 2 : 0,
              ),
              child: Text(
                title,
                style: getTextTheme(context).titleMedium!.copyWith(
                      fontSize: responsiveFontSize(
                        context,
                        14.5,
                      ),
                      fontWeight: FontWeight.w600,
                      color: $constants.palette.appRed,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
