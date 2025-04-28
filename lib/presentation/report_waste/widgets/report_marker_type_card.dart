import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class ReportMarkerTypeCard extends StatelessWidget {
  const ReportMarkerTypeCard({
    this.label,
    this.markerType,
    this.onTap,
    super.key,
  });

  final String? label;
  final MarkerType? markerType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //*------------------ ITEM LABEL ---------------------//
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: $constants.insets.xs),
            child: Text(
              label!,
              style: getTextTheme(context).titleMedium!.copyWith(
                    fontSize: responsiveFontSize(
                      context,
                      14.5,
                    ),
                  ),
            ),
          ),
        //*------------------ ITEM CARD ---------------------//
        Card(
          color: getThemeData(context).inputDecorationTheme.fillColor,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular($constants.corners.md + 2),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: $constants.insets.sm,
                vertical: $constants.insets.xs + 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //*------------------ ITEM IMAGE/TITLE ---------------------//
                  Flexible(
                    child: Row(
                      children: [
                        //*------------------ IMAGE ---------------------//
                        if (markerType != null)
                          Icon(
                            markerType?.icon ?? Icons.help_outline,
                            size: getTabletType() ? 40 : 20,
                            color: markerType?.color ??
                                getThemeData(context).canvasColor,
                          ),
                        //*------------------ TITLE ---------------------//
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: markerType != null
                                  ? $constants.insets.xs + 2
                                  : 0,
                            ),
                            child: Text(
                              markerType?.getName(context) ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  getTextTheme(context).titleMedium!.copyWith(
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
                  //*------------------ ITEM ARROW FORWARD ICON ---------------------//
                  Padding(
                    padding: EdgeInsets.only(left: $constants.insets.xs),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: getTabletType() ? 40 : 20,
                      color: getThemeData(context).canvasColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
