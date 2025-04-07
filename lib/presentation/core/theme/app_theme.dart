import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thuri_cycle/presentation/core/theme/color/app_color_scheme.dart';
import 'package:thuri_cycle/presentation/core/theme/text/app_text_theme.dart';
import 'package:thuri_cycle/presentation/core/theme/text/app_typography.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

//TODO: Work on deprecated parameters
Future<ThemeData> createTheme({
  required Brightness brightness,
}) async {
  //* GETS colorScheme using $constants.theme.defaultThemeColor by ColorScheme.fromSeed()
  final colorScheme = _getColorScheme(brightness: brightness);

  //* GETS colorScheme using DynamicColorPlugin.getCorePalette() package
  final dynamicColorScheme = await _getDynamicColors(brightness: brightness);

  //* GETS mainly used app colorScheme from either colorScheme or dynamicColorScheme.
  //* For now app uses colorScheme
  final appColorScheme = _getAppColorScheme(
    colorScheme: colorScheme,
    dynamicColorScheme: dynamicColorScheme,
    brightness: brightness,
  );

  //* Text Theme typography config
  final appTypography =
      AppTypography.create(fontFamily: $constants.theme.defaultFontFamily);

  //* Text Theme config
  final textTheme =
      _getTextTheme(appTypography: appTypography, brightness: brightness);

  //* GETS primaryColor
  final primaryColor = ElevationOverlay.colorWithOverlay(
    appColorScheme.surface,
    appColorScheme.primary,
    3,
  );
  //* GETS customOnPrimaryColor with opacity
  final customOnPrimaryColor = appColorScheme.primary.withOpacity(0.5);

  //* Main theme config widget
  return ThemeData(
    useMaterial3: true,
    brightness: appColorScheme.brightness,
    colorScheme: appColorScheme.materialColorScheme,
    textTheme: textTheme.materialTextTheme,
    scaffoldBackgroundColor: brightness == Brightness.dark
        ? $constants.theme.defaultDarkBackgroundColor
        : $constants.theme.defaultLightBackgroundColor,
    // scaffoldBackgroundColor: appColorScheme.surface,
    typography: appTypography.materialTypography,
    // splashColor: const Color.fromARGB(0, 248, 221, 221),
    splashFactory: InkRipple.splashFactory,
    highlightColor: Colors.transparent,
    shadowColor: brightness == Brightness.dark
        ? $constants.palette.shadowDarkColor
        : $constants.palette.shadowLightColor,
    canvasColor: brightness == Brightness.dark
        ? $constants.palette.strokeDarkColor
        : $constants.palette.strokeLightColor,
    //* Border / Stroke color
    hintColor: brightness == Brightness.dark
        ? $constants.palette.white
        : $constants.palette.secondary,
    dividerColor: brightness == Brightness.dark
        ? $constants.palette.dividerDarkColor
        : $constants.palette.dividerLightColor,
    dividerTheme: DividerThemeData(
      color: brightness == Brightness.dark
          ? $constants.palette.dividerDarkColor
          : $constants.palette.dividerLightColor,
      thickness: $constants.insets.xs + 2,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      toolbarHeight: getTabletType() ? 80 : 56,
      iconTheme: IconThemeData(
        size: getTabletType() ? 32 : 24,
      ),
      backgroundColor: brightness == Brightness.dark
          ? $constants.palette.darkCardBackground
          : $constants.theme.defaultLightBackgroundColor,
      surfaceTintColor: brightness == Brightness.dark
          ? $constants.palette.darkCardBackground
          : $constants.theme.defaultLightBackgroundColor,
      elevation: 1,
      shadowColor: brightness == Brightness.dark
          ? $constants.palette.shadowDarkColor
          : $constants.palette.shadowLightColor.withOpacity(0.2),
      systemOverlayStyle: createOverlayStyle(
        brightness: brightness,
        primaryColor: primaryColor,
      ),
    ),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        return brightness == Brightness.dark
            ? $constants.palette.dividerDarkColor
            : $constants.theme.defaultLightBackgroundColor;
      }),
      surfaceTintColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        return brightness == Brightness.dark
            ? $constants.palette.dividerDarkColor
            : $constants.theme.defaultLightBackgroundColor;
      }),
      elevation: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) {
        return 1;
      }),
      shadowColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        return brightness == Brightness.dark
            ? $constants.palette.shadowDarkColor
            : $constants.palette.shadowLightColor.withOpacity(0.2);
      }),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: $constants.palette.main,
      unselectedLabelColor: brightness == Brightness.dark
          ? $constants.palette.white
          : $constants.palette.mainText,
      indicatorColor: $constants.palette.main,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: $constants.theme.defaultElevation,
      highlightElevation: $constants.theme.defaultElevation,
    ),
    iconTheme: IconThemeData(
      size: getTabletType() ? 48 : 24,
      color: brightness == Brightness.dark
          ? $constants.palette.white
          : $constants.palette.iconColor,
    ),
    cardTheme: CardTheme(
      color: brightness == Brightness.dark
          ? $constants.palette.darkCardBackground
          : $constants.theme.defaultLightBackgroundColor,
      surfaceTintColor: brightness == Brightness.dark
          ? $constants.palette.darkCardBackground
          : $constants.theme.defaultLightBackgroundColor,
      elevation: $constants.theme.defaultElevation,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular($constants.theme.defaultBorderRadius),
        side: BorderSide(
          width: 0.5,
          color: brightness == Brightness.dark
              ? $constants.palette.strokeDarkColor
              : $constants.palette.strokeLightColor,
        ),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 16,
      indicatorColor: Colors.transparent,
      shadowColor: brightness == Brightness.dark
          ? $constants.palette.shadowDarkColor
          : $constants.palette.shadowLightColor,
      backgroundColor: brightness == Brightness.dark
          ? $constants.palette.darkCardBackground
          : $constants.theme.defaultLightBackgroundColor,
      surfaceTintColor: brightness == Brightness.dark
          ? $constants.palette.darkCardBackground
          : $constants.theme.defaultLightBackgroundColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: brightness == Brightness.dark
          ? $constants.palette.darkCardBackground
          : $constants.theme.defaultLightBackgroundColor,
      surfaceTintColor: brightness == Brightness.dark
          ? $constants.palette.darkCardBackground
          : $constants.theme.defaultLightBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular($constants.corners.md * 2 + 4),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular($constants.theme.defaultBorderRadius),
      ),
      backgroundColor: brightness == Brightness.dark
          ? $constants.palette.dividerDarkColor
          : $constants.theme.defaultLightBackgroundColor,
      surfaceTintColor: brightness == Brightness.dark
          ? $constants.palette.dividerDarkColor
          : $constants.theme.defaultLightBackgroundColor,
      elevation: $constants.theme.defaultElevation,
      shadowColor: brightness == Brightness.dark
          ? $constants.palette.shadowDarkColor
          : $constants.palette.shadowLightColor,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: brightness == Brightness.dark
          ? $constants.theme.defaultDarkBackgroundColor
          : $constants.theme.defaultLightBackgroundColor,
      collapsedBackgroundColor: brightness == Brightness.dark
          ? $constants.theme.defaultDarkBackgroundColor
          : $constants.theme.defaultLightBackgroundColor,
      iconColor: brightness == Brightness.dark
          ? $constants.palette.strokeDarkColor
          : $constants.palette.strokeLightColor,
      collapsedIconColor: brightness == Brightness.dark
          ? $constants.palette.strokeDarkColor
          : $constants.palette.strokeLightColor,
      shape: UnderlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          width: 0.5,
          color: brightness == Brightness.dark
              ? $constants.palette.strokeDarkColor
              : $constants.palette.strokeLightColor,
        ),
      ),
      collapsedShape: UnderlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          width: 0.5,
          color: brightness == Brightness.dark
              ? $constants.palette.strokeDarkColor
              : $constants.palette.strokeLightColor,
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: brightness == Brightness.dark
          ? $constants.theme.defaultDarkBackgroundColor
          : $constants.theme.defaultLightBackgroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: brightness == Brightness.dark
          ? $constants.palette.darkInputColor
          : $constants.palette.lightInputColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          $constants.corners.md + 2,
        ),
        borderSide: BorderSide(
          width: 0.5,
          color: brightness == Brightness.dark
              ? $constants.palette.strokeDarkColor
              : $constants.palette.strokeLightColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          $constants.corners.md + 2,
        ),
        borderSide: BorderSide(
          width: 0.5,
          color: brightness == Brightness.dark
              ? $constants.palette.strokeDarkColor
              : $constants.palette.strokeLightColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          $constants.corners.md + 2,
        ),
        borderSide: BorderSide(
          width: 0.5,
          color: brightness == Brightness.dark
              ? $constants.palette.strokeDarkColor
              : $constants.palette.strokeLightColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          $constants.corners.md + 2,
        ),
        borderSide: BorderSide(
          width: 0.5,
          color: $constants.palette.appRed,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          $constants.corners.md + 2,
        ),
        borderSide: BorderSide(
          width: 0.5,
          color: $constants.palette.appRed,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          $constants.corners.md + 2,
        ),
        borderSide: BorderSide(
          width: 0.5,
          color: brightness == Brightness.dark
              ? $constants.palette.strokeDarkColor
              : $constants.palette.strokeLightColor,
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return customOnPrimaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return customOnPrimaryColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return customOnPrimaryColor;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return customOnPrimaryColor;
        }
        return null;
      }),
    ),
  );
}

SystemUiOverlayStyle createOverlayStyle({
  required Brightness brightness,
  required Color primaryColor,
}) {
  final isDark = brightness == Brightness.dark;

  return SystemUiOverlayStyle(
    systemNavigationBarColor:
        isDark ? $constants.palette.darkBackground : $constants.palette.white,
    systemNavigationBarDividerColor:
        isDark ? $constants.palette.darkBackground : $constants.palette.white,
    systemNavigationBarContrastEnforced: false,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarIconBrightness:
        isDark ? Brightness.light : Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
  );
}

Future<ColorScheme?> _getDynamicColors({required Brightness brightness}) async {
  try {
    final corePalette = await DynamicColorPlugin.getCorePalette();

    return corePalette?.toColorScheme(brightness: brightness);
  } on PlatformException {
    return Future.value();
  }
}

ColorScheme _getColorScheme({required Brightness brightness}) {
  return ColorScheme.fromSeed(
    seedColor: $constants.theme.defaultThemeColor,
    brightness: brightness,
  );
}

AppColorScheme _getAppColorScheme({
  required Brightness brightness,
  required ColorScheme colorScheme,
  ColorScheme? dynamicColorScheme,
}) {
  final isDark = brightness == Brightness.dark;

  return AppColorScheme.fromMaterialColorScheme(
    $constants.theme.tryToGetColorPaletteFromWallpaper
        ? dynamicColorScheme ?? colorScheme
        : colorScheme,
    disabled: $constants.palette.grey,
    onDisabled: isDark ? $constants.palette.white : $constants.palette.black,
  );
}

AppTextTheme _getTextTheme({
  required AppTypography appTypography,
  required Brightness brightness,
}) {
  return brightness == Brightness.dark
      ? appTypography.white
      : appTypography.black;
}
