import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class BottomSheetMarkerTypeCard extends StatelessWidget {
  const BottomSheetMarkerTypeCard({
    required this.markerType,
    this.isSelected = false,
    this.isNextItemExist = true,
    this.onTap,
    super.key,
  });

  final MarkerType markerType;
  final bool isSelected;
  final bool isNextItemExist;
  final void Function(MarkerType)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // switch (isSelected) {
        //   case false:
        //     onTap!(true);
        //     break;
        //   case true:
        //     onTap!(false);
        //     break;
        // }

        onTap!(markerType);
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
                  Flexible(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular($constants.insets.xl),
                          child: Icon(
                            markerType.icon,
                            size: getTabletType() ? 60 : 30,
                            color: markerType.color,
                          ),
                        ),
                        SizedBox(width: $constants.insets.xs),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: $constants.insets.sm,
                            ),
                            child: Text(
                              markerType.getName(context),
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: $constants.insets.xs),
                  //*------------------ SELECTED CHECK ICON ---------------------//
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      size: getTabletType() ? 48 : 24,
                      color: $constants.palette.main,
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
