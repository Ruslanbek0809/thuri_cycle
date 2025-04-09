import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

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

//* Turns any field's toJson into NULL value
dynamic toNull(dynamic a) {
  return;
}

String colorToHex(Color c) {
  return "#${(c.value.toRadixString(16))..padLeft(8, '0').toUpperCase()}";
}

Color hexToColor(String h) {
  final buffer = StringBuffer();
  if (h.length == 6 || h.length == 7) buffer.write('ff');
  buffer.write(h.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

LinearGradient colorsToGradient(List<Color> colors, {double opacity = 1}) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: colors.map((c) => c.withOpacity(opacity)).toList(),
  );
}

extension NumberToPrecisionFormat on num {
  num toPrecision(int n) =>
      num.parse(toStringAsFixed(n).replaceFirst(RegExp(r'\.?0*$'), ''));
}

extension PercentageOfNumberFormat on num {
  num toPercentage({required int precision, required num discountPercentage}) =>
      num.parse(
        (this - (this * (discountPercentage / 100)))
            .toPrecision(precision)
            .toString(),
      );
}

extension PercentageOfNumberFromAnotherNumberFormat on num {
  num toDiscountPercentage({required num discountedPrice}) =>
      100 * ((this - discountedPrice) / this);
}

//* PARSES and FORMATS String date time to DateTime date format
extension DateTimeFormatter on DateTime {
  String formatDateTimeToDate() {
    // final tempDate = DateFormat('dd.MM.yyyy').parse(this);
    return DateFormat('dd.MM.yyyy').format(this);
  }
}

// //*PARSES and FORMATS String date time to DateTime in HH:mm format
// extension DateTimeHmFormatter on String {
//   String formatDateTimeToHm() {
//     final tempDate = DateFormat('HH:mm').parse(this);
//     return DateFormat.Hm().format(tempDate);
//   }
// }

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexedd<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

bool isEmail(String input) {
  // Regular expression for validating an email
  final emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    caseSensitive: false,
  );

  // Use the regex to validate the input
  return emailRegExp.hasMatch(input);
}

//* Used when init data is needed but it is not added from initState
TextEditingController useTextEditingControllerWithInitialValue(
  String initialValue,
) {
  final controller = useTextEditingController();

  useEffect(
    () {
      controller.text = initialValue;
      return null;
    },
    [initialValue],
  );

  return controller;
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
