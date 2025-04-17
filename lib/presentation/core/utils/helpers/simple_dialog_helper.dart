import 'package:collection/collection.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_theme_change_dialog.dart';

class SimpleClass {
  SimpleClass(
    this.svgName,
    this.title,
  );

  String svgName;
  String title;
}

@immutable
abstract class SimpleDialogHelper {
  const SimpleDialogHelper._();

  static Future<ThemeMode?> showThemesDialog(
    BuildContext context,
    ThemeMode selectedThemeMode,
  ) {
    final themes = <ThemeMode>[
      ThemeMode.system,
      ThemeMode.light,
      ThemeMode.dark
    ];
    final assets = <String>[
      if (MediaQuery.of(context).platformBrightness == Brightness.dark)
        'assets/profile/theme_mode_dark.svg'
      else
        'assets/profile/theme_mode_light.svg',
      'assets/profile/theme_mode_light.svg',
      'assets/profile/theme_mode_dark.svg'
    ];
    if (Theme.of(context).platform != TargetPlatform.iOS) {
      return showDialog<ThemeMode?>(
        context: context,
        builder: (context) => SimpleDialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm + $constants.insets.xxs,
            vertical: $constants.insets.md,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm + $constants.insets.xxs,
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(top: $constants.insets.sm),
              child: Text(
                context.l10n.theme,
                style: getTextTheme(context).titleLarge!.copyWith(
                      fontSize: responsiveFontSize(
                        context,
                        20,
                      ),
                    ),
              ),
            ),
            ...themes.mapIndexed(
              (index, themeMode) => SimpleDialogOption(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: SimpleDialogThemeChangeCard(
                  themeMode: themeMode,
                  svgAsset: assets[index],
                  isSelected: themeMode == selectedThemeMode,
                  isNextItemExist: index != themes.length - 1,
                  onTap: (value) {
                    if (themeMode == selectedThemeMode) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(
                        context,
                        value,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    return showCupertinoDialog<ThemeMode?>(
      context: context,
      barrierDismissible: true,
      builder: (context) => SimpleDialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm + $constants.insets.xxs,
          vertical: $constants.insets.md,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm + $constants.insets.xxs,
        ),
        children: [
          Padding(
            padding: EdgeInsets.only(top: $constants.insets.sm),
            child: Text(
              context.l10n.theme,
              style: getTextTheme(context).titleLarge!.copyWith(
                    fontSize: responsiveFontSize(
                      context,
                      20,
                    ),
                  ),
            ),
          ),
          ...themes.mapIndexed(
            (index, themeMode) => SimpleDialogOption(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: SimpleDialogThemeChangeCard(
                themeMode: themeMode,
                svgAsset: assets[index],
                isSelected: themeMode == selectedThemeMode,
                isNextItemExist: index != themes.length - 1,
                onTap: (value) {
                  if (themeMode == selectedThemeMode) {
                    Navigator.pop(
                      context,
                    );
                  } else {
                    Navigator.pop(
                      context,
                      value,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
