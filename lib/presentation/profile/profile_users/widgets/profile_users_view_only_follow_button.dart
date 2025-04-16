import 'package:auto_size_text/auto_size_text.dart';
import 'package:flipgoo_app/l10n/l10n.dart';
import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_elevated_gradient_button.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_svg_icon.dart';
import 'package:flutter/material.dart';

class ProfileUsersViewOnlyFollowButton extends StatelessWidget {
  const ProfileUsersViewOnlyFollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getSize(context).width / 3 - ($constants.insets.md - 2),
      child: CustomElevatedGradientButton(
        backgroundColor: $constants.palette.main,
        elevation: 1,
        borderRadius: BorderRadius.circular($constants.corners.md),
        size: Size(
          getSize(context).width / 3 - ($constants.insets.md - 2),
          35,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.xxs),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgIcon(
                icon: 'user_follow',
                size: 16,
                color: $constants.palette.white,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: $constants.insets.xs - 2,
                  ),
                  child: AutoSizeText(
                    context.l10n.follow,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getTextTheme(context).titleSmall!.copyWith(
                          fontSize: responsiveFontSize(context, 12.75),
                          fontWeight: FontWeight.w600,
                          color: $constants.palette.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onPressed: () async {
          scaffoldMessengerKey.currentState?..hideCurrentSnackBar()..showSnackBar(
            SnackBarHelper.createInformation(message: context.l10n.viewOnly),
          );
        },
      ),
    );
  }
}
