import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_outline_child_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_text_button.dart';

@immutable
abstract class DialogHelper {
  const DialogHelper._();

  static Future<bool?> showCustomAlertDialog(
    BuildContext context, {
    String? title,
    Widget? contentWidget,
    String? content,
    String? cancelText,
    String? confirmText,
    Color? confirmColor,
    bool isSingleButton = false,
  }) {
    if (Theme.of(context).platform != TargetPlatform.iOS) {
      return showDialog<bool?>(
        context: context,
        builder: (context) => AlertDialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm + $constants.insets.xxs,
            vertical: $constants.insets.md,
          ),
          title: Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: getTextTheme(context).titleLarge!.copyWith(
                  fontSize: responsiveFontSize(
                    context,
                    20,
                  ),
                ),
          ),
          titlePadding: EdgeInsets.only(
            top: $constants.insets.lg,
            left: $constants.insets.md + $constants.insets.xxs,
            right: $constants.insets.md + $constants.insets.xxs,
          ),
          content: contentWidget ??
              Text(
                content ?? '',
                style: getTextTheme(context).titleMedium!.copyWith(
                      fontSize: responsiveFontSize(
                        context,
                        14.5,
                      ),
                    ),
              ),
          contentPadding: EdgeInsets.only(
            top: $constants.insets.sm + $constants.insets.xxs,
            left: $constants.insets.md + $constants.insets.xxs,
            right: $constants.insets.md + $constants.insets.xxs,
          ),
          actionsPadding: EdgeInsets.only(
            top: $constants.insets.md,
            left: $constants.insets.sm + $constants.insets.xxs,
            right: $constants.insets.sm + $constants.insets.xxs,
            bottom: $constants.insets.lg,
          ),
          actions: <Widget>[
            if (!isSingleButton)
              Row(
                children: [
                  Flexible(
                    child: CustomOutlineChildButton(
                      borderWidth: 0.7,
                      borderColor: $constants.palette.appRed,
                      borderRadius:
                          BorderRadius.circular($constants.corners.md + 2),
                      minimumSize: Size(getSize(context).width / 2, 50),
                      child: Text(
                        cancelText ?? context.l10n.cancel,
                        style: getTextTheme(context).titleMedium!.copyWith(
                              fontSize: responsiveFontSize(
                                context,
                                14.5,
                              ),
                              color: $constants.palette.appRed,
                            ),
                      ),
                      onPressed: () => Navigator.pop(context, false),
                    ),
                  ),
                  SizedBox(width: $constants.insets.sm + 4),
                  Flexible(
                    child: CustomTextButton(
                      backgroundColor: confirmColor ?? $constants.palette.main,
                      minimumSize: Size(getSize(context).width / 2, 50),
                      child: Text(
                        confirmText ?? 'Confirm',
                        style: getTextTheme(context).titleMedium!.copyWith(
                              fontSize: responsiveFontSize(
                                context,
                                14.5,
                              ),
                              color: $constants.palette.white,
                            ),
                      ),
                      onPressed: () => Navigator.pop(context, true),
                    ),
                  ),
                ],
              )
            else
              CustomTextButton(
                backgroundColor: confirmColor ?? $constants.palette.main,
                minimumSize: Size(getSize(context).width, 54),
                child: Text(
                  confirmText ?? 'Confirm',
                  style: getTextTheme(context).titleMedium!.copyWith(
                        fontSize: responsiveFontSize(
                          context,
                          14.5,
                        ),
                        color: $constants.palette.white,
                      ),
                ),
                onPressed: () => Navigator.pop(context, true),
              ),
          ],
        ),
      );
    }

    return showCupertinoDialog<bool?>(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title ?? 'Basic dialog title,',
          textAlign: TextAlign.center,
          style: getTextTheme(context).titleSmall!.copyWith(
                fontSize: 12.75,
                fontWeight: FontWeight.w500,
              ),
        ),
        content: Text(
          content ??
              'A dialog is a type of modal window that\n'
                  'appears in front of app content to\n'
                  'provide critical information, or prompt\n'
                  'for a decision to be made.',
          style: getTextTheme(context).titleSmall!.copyWith(
                fontSize: 12.75,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              confirmText ?? 'Yes',
              style: getTextTheme(context).titleSmall!.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          if (!isSingleButton)
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                cancelText ?? 'No',
                style: getTextTheme(context).titleSmall!.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
