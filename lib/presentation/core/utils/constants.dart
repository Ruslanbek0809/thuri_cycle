import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

enum MarkerType {
  unknown(0, Colors.grey, Icons.help_outline),
  plasticAndPackaging(1, Colors.yellow, Icons.recycling),
  paper(2, Colors.blue, Icons.description),
  glass(3, Colors.green, Icons.wine_bar),
  organic(4, Colors.brown, Icons.eco),
  residual(5, Colors.black, Icons.delete),
  electronics(6, Colors.purple, Icons.devices),
  hazardous(7, Colors.red, Icons.warning),
  bulky(8, Colors.orange, Icons.weekend),
  textiles(9, Colors.teal, Icons.checkroom),
  batteries(10, Colors.deepOrange, Icons.battery_charging_full);

  const MarkerType(this.id, this.color, this.icon);
  final int id;
  final Color color;
  final IconData icon;

  Icon getThemedIcon(BuildContext context) {
    return Icon(
      icon,
      color: HSLColor.fromColor(color)
          .withLightness(
            Theme.of(context).brightness == Brightness.dark ? 0.7 : 0.3,
          )
          .toColor(),
    );
  }

  String getName(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (this) {
      case MarkerType.unknown:
        return l10n.markerTypeUnknown;
      case MarkerType.plasticAndPackaging:
        return l10n.markerTypePlasticAndPackaging;
      case MarkerType.paper:
        return l10n.markerTypePaper;
      case MarkerType.glass:
        return l10n.markerTypeGlass;
      case MarkerType.organic:
        return l10n.markerTypeOrganic;
      case MarkerType.residual:
        return l10n.markerTypeResidual;
      case MarkerType.electronics:
        return l10n.markerTypeElectronics;
      case MarkerType.hazardous:
        return l10n.markerTypeHazardous;
      case MarkerType.bulky:
        return l10n.markerTypeBulky;
      case MarkerType.textiles:
        return l10n.markerTypeTextiles;
      case MarkerType.batteries:
        return l10n.markerTypeBatteries;
    }
  }
}

class Pair<A, B> {
  Pair(this.first, this.second);

  final A first;
  final B second;
}

final $constants = Constants();

@immutable
class Constants {
  final appTitle = 'ThuriCycle';

  // final baseUrl = 'http://test.flipgoo.com:7000/api/';
  final baseUrl = 'https://test.flipgoo.com/api/';
  final receiveTimeout = 30000;
  final connectionTimeout = 30000;
  final longerReceiveTimeout = 300000;
  final longerConnectionTimeout = 300000;

  final defaultInitialCoordinates = const LatLng(50.6844, 10.9255);
  final defaultInitialZoom = 16.0;

  final authTokenStorage = 'auth_storage';
  final authTokenExpireTime = 'auth_storage_expire_time';

  final fcmTopicAndroid = 'android';
  final fcmTopicIos = 'ios';

  final appLocale = 'appLocale';

  final isOnboardingSeen = 'isOnboardingSeen';

  final lastMapLatitude = 'lastMapLatitude';
  final lastMapLongitude = 'lastMapLongitude';
  final lastMapZoom = 'lastMapZoom';

  final imageHeight = 256.0;

  /// Theme defaults.
  late final theme = _Theme();

  /// Animation durations.
  late final times = _Times();

  /// Rounded edge corner radiuses.
  late final corners = _Corners();

  /// Padding and margin values.
  late final insets = _Insets();

  /// Text shadows.
  late final shadows = _Shadows();

  /// Text configuration.
  late final textStyle = _TextStyle();

  /// Color $constants.palette.
  late final palette = _Palette();

  /// API configuration.
  late final api = _API();

  /// Navigation configuration.
  late final navigation = _Navigation();
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

@immutable
class _Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double xl = 16;
  late final double lg = 32;
}

@immutable
class _Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}

@immutable
class _Shadows {
  final textSoft = [
    Shadow(
      color: Colors.black.withOpacity(0.25),
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
  ];
  final text = [
    Shadow(
      color: Colors.black.withOpacity(0.6),
      offset: const Offset(0, 2),
      blurRadius: 2,
    ),
  ];
  final textStrong = [
    Shadow(
      color: Colors.black.withOpacity(0.6),
      offset: const Offset(0, 4),
      blurRadius: 6,
    ),
  ];
}

@immutable
class _Palette {
  final List<Color> themes = [
    const Color(0xFFFF0000),
    const Color(0xFFFF8000),
    const Color(0xFFFCCC1A),
    const Color(0xFF66B032),
    const Color(0xFF00FFFF),
    const Color(0xFF0000FF),
    const Color(0xFF0080FF),
    const Color(0xFFFF00FF),
  ];

  final white = const Color(0xFFFFFFFF);
  final black = const Color(0xFF000000);
  final greyBlack = const Color(0xFF020714);
  final mainText = const Color(0xFF001A34);
  final secondaryText = const Color(0xFF6D7885);
  final grey = const Color(0xFF9E9E9E);
  final orange = const Color(0xFFFF8000);
  final yellow = const Color(0xFFFCCC1A);
  final yellowTikTok = const Color(0xFFFFBE0D);
  final green = const Color(0xFF66B032);
  final green2 = const Color(0xFF10C44B);
  final green3 = const Color(0x294BB34B);
  final green4 = const Color(0xFF4BB34B);
  final cyan = const Color(0xFF00FFFF);
  final blue = const Color(0xFF0000FF);
  final blue2 = const Color(0x290085FD);
  final purple = const Color(0xFF0080FF);
  final magenta = const Color(0xFFFF00FF);

  final main = const Color(0xFF0085FD);

  // final main = const Color(0xFF2F54CB);
  final mainFade = const Color(0xFFC9D6FF);
  final mainSecond = const Color(0xFF758DDE);
  final second = const Color(0xFFF5F5F5);
  final lightBackground = const Color(0xFFFFFFFF);
  final secondaryBackground = const Color(0xFFECEDF1);
  final darkBackground = const Color(0xFF19191A);
  final cardBackground = const Color(0xFFE4EBFF);
  final darkCardBackground = const Color(0xFF232324);
  final secondary = const Color(0xFF707E8C);
  final lightInputColor = const Color(0xFFF2F3F5);
  final darkInputColor = const Color(0xFF363738);
  final dividerLightColor = const Color(0xFFF1F5F9);
  final dividerDarkColor = const Color(0xFF363738);
  final shadowLightColor = const Color(0xFFA7B2D6);
  final shadowDarkColor = const Color(0xFF131F42);
  final appBlue = const Color(0xFF3F8CFF);
  final appYellow = const Color(0xFFFFC727);
  final circleAvatarColor = const Color(0xFFD9D9D9);
  final circleAvatarBorder = const Color(0xFFE3E3E3);
  final strokeLightColor = const Color(0xFFB9B9BB);
  final strokeDarkColor = const Color(0xFF515152);
  final switchLightColor = const Color(0xFFB2BCC5);
  final switchDarkColor = const Color(0xFF28396F);
  final iconColor = const Color(0xFF99A2AE);
  final sliderDotColor = const Color(0x80FFFFFF);
  final backButtonColor = const Color(0xFF7985AC);
  final search = const Color(0xFF818C99);
  final shimmerMain = const Color(0xFFD8DEEF);
  final shimmerSecondary = const Color(0xFFF2F5FF);
  final cardOrange = const Color(0xFFFA5D0E);
  final appGreen = const Color(0xFF2EBF0B);
  final appGreen2 = const Color(0xFF03BE70);
  final appRed = const Color(0xFFFA0E1C);
  final appRed2 = const Color(0xFFFF375B);
  final gradientButtonColorBlue1 = const Color(0xFF0162D6);
  final gradientButtonColorBlue2 = const Color(0xFF2E8CFC);
  final gradientColorBlue1 = const Color(0xFF03177E);
  final gradientColorBlue2 = const Color(0xFF1633CF);
  final gradientColorPurple1 = const Color(0xFF99008A);
  final gradientColorPurple2 = const Color(0xFFFE84F2);
  final gradientColorGreen1 = const Color(0xFF005916);
  final gradientColorGreen2 = const Color(0xFF1EB640);
  final navigationColor = const Color(0xFF99A2AD);
}

@immutable
class _Theme {
  final tryToGetColorPaletteFromWallpaper = false;
  final defaultLightBackgroundColor = $constants.palette.lightBackground;
  final defaultDarkBackgroundColor = $constants.palette.darkBackground;
  final defaultThemeColor = const Color(0xFF0085FD);
  final defaultFontFamily = 'Gilroy';
  final double defaultElevation = 0;
  final double defaultBorderRadius = 10;
}

//TODO [optimization]: Implement clean constant _TextStyle same as in navBarTextStyle
@immutable
class _TextStyle {
  TextStyle navBarTextStyle(
    BuildContext context, {
    Color? color,
  }) {
    return TextStyle(
      color: color ?? $constants.palette.main,
      fontSize: responsiveFontSize(context, 12),
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    );
  }
}

@immutable
class _API {
  final maxItemToBeFetchedAtOneTime = 5;
}

@immutable
class _Navigation {
  List<NavigationDestination> bottomNavigationItems(
    BuildContext context,
    int currentPageIndex,
  ) =>
      [
        NavigationDestination(
          icon: Icon(
            Icons.location_on_outlined,
            size: getTabletType() ? 52 : 26,
            color: $constants.palette.navigationColor,
          ),
          selectedIcon: Icon(
            Icons.location_on,
            size: getTabletType() ? 52 : 26,
            color: $constants.palette.main,
          ),
          label: 'Waste Map',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.groups_outlined,
            size: getTabletType() ? 52 : 26,
            color: $constants.palette.navigationColor,
          ),
          selectedIcon: Icon(
            Icons.groups,
            size: getTabletType() ? 52 : 26,
            color: $constants.palette.main,
          ),
          label: 'Community',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.account_circle_outlined,
            size: getTabletType() ? 52 : 26,
            color: $constants.palette.navigationColor,
          ),
          selectedIcon: Icon(
            Icons.account_circle,
            size: getTabletType() ? 52 : 26,
            color: $constants.palette.main,
          ),
          label: 'Profile',
        ),
      ];
}
