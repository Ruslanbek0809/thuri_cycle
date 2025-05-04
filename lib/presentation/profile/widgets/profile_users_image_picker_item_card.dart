import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class ProfileUsersImagePickerItemCard extends StatelessWidget {
  const ProfileUsersImagePickerItemCard({
    required this.icon,
    required this.title,
    this.borderRadius,
    this.isNextWidgetAvailable = false,
    this.isDelete = false,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String title;
  final BorderRadius? borderRadius;
  final bool isNextWidgetAvailable;
  final bool isDelete;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
        child: Column(
          children: [
            //*------------------ ITEM ICON/TITLE ---------------------//
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: $constants.insets.sm,
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: isDelete
                        ? $constants.palette.appRed
                        : getThemeData(context).unselectedWidgetColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: $constants.insets.sm,
                    ),
                    child: isDelete
                        ? Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getTextTheme(context).titleMedium!.copyWith(
                                  fontSize: responsiveFontSize(
                                    context,
                                    14.5,
                                  ),
                                  color: $constants.palette.appRed,
                                ),
                          )
                        : Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getTextTheme(context).titleMedium!.copyWith(
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
            //*------------------ ADDS BORDER if NEXT WIDGET is AVAILABLE ---------------------//
            if (isNextWidgetAvailable)
              Container(
                height: 1,
                color: getThemeData(context).canvasColor,
              ),
          ],
        ),
      ),
    );
  }
}
