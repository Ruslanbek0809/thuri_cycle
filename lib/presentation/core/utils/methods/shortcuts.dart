import 'package:flutter/material.dart';

Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

bool getTabletType() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  return data.size.shortestSide > 600;
}

double getBottomBarHeight() {
  return kBottomNavigationBarHeight;
}

ThemeData getThemeData(BuildContext context) {
  return Theme.of(context);
}

ColorScheme getTheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}

TextTheme getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

CardThemeData getCardTheme(BuildContext context) {
  return Theme.of(context).cardTheme;
}

Color getPrimaryColor(BuildContext context) {
  return ElevationOverlay.colorWithOverlay(
    getTheme(context).surface,
    getTheme(context).primary,
    3,
  );
}

Color getCustomOnPrimaryColor(BuildContext context, [double opacity = 0.5]) {
  return getTheme(context).primary.withOpacity(opacity);
/*   return ElevationOverlay.colorWithOverlay(
    getTheme(context).primary,
    getTheme(context).background,
    isDarkMode(context) ? 1000 : 500,
  ); */
}

//TODO: Look at below and more options as well (like flutter_screenutil)
double responsiveFontSize(BuildContext context, double baseSize) {
  const referenceWidth =
      360; //* A common denominator for various Android devices

  // 28 => 25.5
  // 26 => 23.75
  // 24 => 22
  // 22 => 20
  // 20 => 18.25
  // 18 => 16.5
  // 16 => 14.5
  // 14 => 12.75
  // 12 => 11
  // 10 => 9.25
  // 8 => 7.5

  final screenWidth = MediaQuery.of(context).size.width;

  return baseSize * (screenWidth / referenceWidth);
}

// double responsiveFontSize(
//   BuildContext context,
//   double baseSize, {
//   double min = 10,
//   double max = 24,
// }) {
//   final mediaQuery = MediaQuery.of(context);
//   final textScaleFactor = mediaQuery.textScaleFactor;

//   final screenWidth = mediaQuery.size.width;
//   final screenHeight = mediaQuery.size.height;
//   const referenceWidth = 360.0;
//   const referenceHeight = 640.0;

//   // Calculate scale based on the smaller of width or height ratio
//   final scale =
//       (screenWidth / referenceWidth + screenHeight / referenceHeight) / 2;

//   final scaledSize = baseSize * scale * textScaleFactor;
//   return scaledSize.clamp(min, max);
// }
