import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_elevated_gradient_button.dart';

class CustomState extends StatelessWidget {
  const CustomState({
    this.svgName,
    this.svgHeight,
    this.svgWidth,
    this.text,
    this.textColor,
    this.isButtonAvailable = true,
    this.button,
    this.onTap,
    super.key,
  });

  final String? svgName;
  final double? svgHeight;
  final double? svgWidth;
  final String? text;
  final Color? textColor;
  final bool? isButtonAvailable;
  final Widget? button;
  final Future<void> Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (svgName != null)
            SvgPicture.asset(
              svgName!,
              height: svgHeight ?? getSize(context).height * 0.25,
              width: svgWidth ?? getSize(context).width * 0.63,
            ),
          Padding(
            padding: EdgeInsets.only(top: $constants.insets.lg),
            child: Text(
              text ?? '',
              style: textColor != null
                  ? getTextTheme(context).titleMedium!.copyWith(
                        fontSize: responsiveFontSize(context, 18.25),
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      )
                  : getTextTheme(context).titleMedium!.copyWith(
                        fontSize: responsiveFontSize(context, 18.25),
                        fontWeight: FontWeight.w600,
                      ),
            ),
          ),
          //*--------------- RETRY BUTTON ---------------//
          if (isButtonAvailable!)
            Padding(
              padding: EdgeInsets.only(top: $constants.insets.md),
              child: CustomElevatedGradientButton(
                onPressed: onTap ?? () {},
                size: Size(
                  getSize(context).width * 0.5 +
                      (($constants.insets.sm + 4) * 2),
                  getTabletType() ? 80 : 50,
                ),
                child: button ??
                    Text(
                      context.l10n.retry,
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
    );
  }
}
