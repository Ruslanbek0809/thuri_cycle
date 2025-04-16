import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flutter/cupertino.dart';

class ProfileUsersItemCard extends StatelessWidget {
  const ProfileUsersItemCard({
    required this.title,
    required this.content,
    required this.value,
    this.onChanged,
    super.key,
  });

  final String title;
  final String content;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm,
            vertical: $constants.insets.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //*------------------ ITEM TITLE/CONTENT ---------------------//
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: $constants.insets.xxl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: getTextTheme(context).titleMedium!.copyWith(
                              fontSize: responsiveFontSize(
                                context,
                                14.5,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: getTextTheme(context).titleSmall!.copyWith(
                              fontSize: responsiveFontSize(context, 11),
                              color: getThemeData(context).hintColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              //*------------------ SWITCHER ---------------------//
              Transform.scale(
                scale: getTabletType() ? 1 : 0.7,
                child: CupertinoSwitch(
                  value: value,
                  activeColor: $constants.palette.appBlue,
                  trackColor: getThemeData(context).hintColor,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
