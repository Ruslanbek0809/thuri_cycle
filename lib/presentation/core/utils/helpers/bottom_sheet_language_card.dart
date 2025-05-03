import 'package:flutter/material.dart';
import 'package:thuri_cycle/domain/profile/language/language.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class BottomSheetLanguageCard extends StatelessWidget {
  const BottomSheetLanguageCard({
    required this.language,
    this.isSelected = false,
    this.isNextItemExist = true,
    this.onTap,
    super.key,
  });

  final LanguageModel language;
  final bool isSelected;
  final bool isNextItemExist;
  final void Function(LanguageModel)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!(language);
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
                    child: Text(
                      language.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: isSelected
                          ? getTextTheme(context).titleMedium!.copyWith(
                                fontSize: responsiveFontSize(context, 14.5),
                                color: $constants.palette.main,
                              )
                          : getTextTheme(context).titleMedium!.copyWith(
                                fontSize: responsiveFontSize(context, 14.5),
                              ),
                    ),
                  ),
                  SizedBox(width: $constants.insets.sm),
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
