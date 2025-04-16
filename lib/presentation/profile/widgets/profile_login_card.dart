import 'package:flutter/material.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_text_button.dart';

class ProfileLoginCard extends StatelessWidget {
  const ProfileLoginCard({
    required this.onTap,
    super.key,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          $constants.corners.md + 6,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all($constants.insets.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: $constants.insets.xs),
              child: Text(
                context.l10n.login,
                style: getTextTheme(context).titleLarge!.copyWith(
                      fontSize: responsiveFontSize(
                        context,
                        18,
                      ),
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: $constants.insets.xs),
              child: Text(
                context.l10n.pleaseLoginOrRegisterToUse,
                style: getTextTheme(context).titleMedium!.copyWith(
                      fontSize: responsiveFontSize(
                        context,
                        14.5,
                      ),
                    ),
              ),
            ),
            //*--------------- LOGIN BUTTON ---------------//
            Padding(
              padding: EdgeInsets.only(
                right: $constants.insets.lg + 2,
              ),
              child: CustomTextButton(
                backgroundColor: $constants.palette.main,
                minimumSize:
                    Size(getSize(context).width / 2, getTabletType() ? 80 : 50),
                onPressed: onTap,
                child: Text(
                  context.l10n.login,
                  style: getTextTheme(context).titleMedium!.copyWith(
                        fontSize: responsiveFontSize(
                          context,
                          14.5,
                        ),
                        fontWeight: FontWeight.w600,
                        color: $constants.palette.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
