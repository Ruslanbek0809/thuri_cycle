// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i21;
import 'package:latlong2/latlong.dart' as _i23;
import 'package:thuri_cycle/app/app_wrapper.dart' as _i1;
import 'package:thuri_cycle/app/onboarding.dart' as _i6;
import 'package:thuri_cycle/app/splash.dart' as _i18;
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart'
    as _i20;
import 'package:thuri_cycle/domain/community/article/article.dart' as _i24;
import 'package:thuri_cycle/domain/community/guide/guide.dart' as _i25;
import 'package:thuri_cycle/domain/report_waste/map_marker.dart' as _i22;
import 'package:thuri_cycle/presentation/auth/login.dart' as _i4;
import 'package:thuri_cycle/presentation/auth/otp.dart' as _i7;
import 'package:thuri_cycle/presentation/community/community_page.dart' as _i2;
import 'package:thuri_cycle/presentation/community/single_article_page.dart'
    as _i15;
import 'package:thuri_cycle/presentation/community/single_guide_page.dart'
    as _i16;
import 'package:thuri_cycle/presentation/home/home.dart' as _i3;
import 'package:thuri_cycle/presentation/profile/profile.dart' as _i8;
import 'package:thuri_cycle/presentation/profile/profile_user_edit_info.dart'
    as _i9;
import 'package:thuri_cycle/presentation/report_waste/map_page.dart' as _i5;
import 'package:thuri_cycle/presentation/report_waste/report_page.dart' as _i10;
import 'package:thuri_cycle/presentation/report_waste/resolve_page.dart'
    as _i11;
import 'package:thuri_cycle/presentation/report_waste/scoreboard_page.dart'
    as _i13;
import 'package:thuri_cycle/presentation/report_waste/settings_page.dart'
    as _i14;
import 'package:thuri_cycle/presentation/report_waste/single_marker_page.dart'
    as _i17;
import 'package:thuri_cycle/presentation/scan_waste/scan_waste.dart' as _i12;

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i19.PageRouteInfo<void> {
  const AppWrapper({List<_i19.PageRouteInfo>? children})
    : super(AppWrapper.name, initialChildren: children);

  static const String name = 'AppWrapper';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppWrapper();
    },
  );
}

/// generated route for
/// [_i2.CommunityPage]
class CommunityRoute extends _i19.PageRouteInfo<void> {
  const CommunityRoute({List<_i19.PageRouteInfo>? children})
    : super(CommunityRoute.name, initialChildren: children);

  static const String name = 'CommunityRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i2.CommunityPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.MapPage]
class MapRoute extends _i19.PageRouteInfo<void> {
  const MapRoute({List<_i19.PageRouteInfo>? children})
    : super(MapRoute.name, initialChildren: children);

  static const String name = 'MapRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i5.MapPage();
    },
  );
}

/// generated route for
/// [_i6.OnboardingPage]
class OnboardingRoute extends _i19.PageRouteInfo<void> {
  const OnboardingRoute({List<_i19.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i7.OtpPage]
class OtpRoute extends _i19.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    required String phoneNumber,
    required _i20.AuthFormCubit authFormCubit,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(
           phoneNumber: phoneNumber,
           authFormCubit: authFormCubit,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i19.WrappedRoute(
        child: _i7.OtpPage(
          phoneNumber: args.phoneNumber,
          authFormCubit: args.authFormCubit,
          key: args.key,
        ),
      );
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({
    required this.phoneNumber,
    required this.authFormCubit,
    this.key,
  });

  final String phoneNumber;

  final _i20.AuthFormCubit authFormCubit;

  final _i21.Key? key;

  @override
  String toString() {
    return 'OtpRouteArgs{phoneNumber: $phoneNumber, authFormCubit: $authFormCubit, key: $key}';
  }
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfilePage();
    },
  );
}

/// generated route for
/// [_i9.ProfileUserEditPage]
class ProfileUserEditRoute extends _i19.PageRouteInfo<void> {
  const ProfileUserEditRoute({List<_i19.PageRouteInfo>? children})
    : super(ProfileUserEditRoute.name, initialChildren: children);

  static const String name = 'ProfileUserEditRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileUserEditPage();
    },
  );
}

/// generated route for
/// [_i10.ReportPage]
class ReportRoute extends _i19.PageRouteInfo<void> {
  const ReportRoute({List<_i19.PageRouteInfo>? children})
    : super(ReportRoute.name, initialChildren: children);

  static const String name = 'ReportRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i10.ReportPage();
    },
  );
}

/// generated route for
/// [_i11.ResolvePage]
class ResolveRoute extends _i19.PageRouteInfo<ResolveRouteArgs> {
  ResolveRoute({
    required _i22.MapMarkerModel mapMarker,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ResolveRoute.name,
         args: ResolveRouteArgs(mapMarker: mapMarker, key: key),
         initialChildren: children,
       );

  static const String name = 'ResolveRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResolveRouteArgs>();
      return _i11.ResolvePage(args.mapMarker, key: args.key);
    },
  );
}

class ResolveRouteArgs {
  const ResolveRouteArgs({required this.mapMarker, this.key});

  final _i22.MapMarkerModel mapMarker;

  final _i21.Key? key;

  @override
  String toString() {
    return 'ResolveRouteArgs{mapMarker: $mapMarker, key: $key}';
  }
}

/// generated route for
/// [_i12.ScanWastePage]
class ScanWasteRoute extends _i19.PageRouteInfo<void> {
  const ScanWasteRoute({List<_i19.PageRouteInfo>? children})
    : super(ScanWasteRoute.name, initialChildren: children);

  static const String name = 'ScanWasteRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i12.ScanWastePage();
    },
  );
}

/// generated route for
/// [_i13.ScoreboardPage]
class ScoreboardRoute extends _i19.PageRouteInfo<ScoreboardRouteArgs> {
  ScoreboardRoute({
    required _i23.LatLng mapCenter,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ScoreboardRoute.name,
         args: ScoreboardRouteArgs(mapCenter: mapCenter, key: key),
         initialChildren: children,
       );

  static const String name = 'ScoreboardRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScoreboardRouteArgs>();
      return _i13.ScoreboardPage(args.mapCenter, key: args.key);
    },
  );
}

class ScoreboardRouteArgs {
  const ScoreboardRouteArgs({required this.mapCenter, this.key});

  final _i23.LatLng mapCenter;

  final _i21.Key? key;

  @override
  String toString() {
    return 'ScoreboardRouteArgs{mapCenter: $mapCenter, key: $key}';
  }
}

/// generated route for
/// [_i14.SettingsPage]
class SettingsRoute extends _i19.PageRouteInfo<void> {
  const SettingsRoute({List<_i19.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i14.SettingsPage();
    },
  );
}

/// generated route for
/// [_i15.SingleArticlePage]
class SingleArticleRoute extends _i19.PageRouteInfo<SingleArticleRouteArgs> {
  SingleArticleRoute({
    required _i24.Article article,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         SingleArticleRoute.name,
         args: SingleArticleRouteArgs(article: article, key: key),
         initialChildren: children,
       );

  static const String name = 'SingleArticleRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleArticleRouteArgs>();
      return _i15.SingleArticlePage(article: args.article, key: args.key);
    },
  );
}

class SingleArticleRouteArgs {
  const SingleArticleRouteArgs({required this.article, this.key});

  final _i24.Article article;

  final _i21.Key? key;

  @override
  String toString() {
    return 'SingleArticleRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [_i16.SingleGuidePage]
class SingleGuideRoute extends _i19.PageRouteInfo<SingleGuideRouteArgs> {
  SingleGuideRoute({
    required _i25.Guide guide,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         SingleGuideRoute.name,
         args: SingleGuideRouteArgs(guide: guide, key: key),
         initialChildren: children,
       );

  static const String name = 'SingleGuideRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleGuideRouteArgs>();
      return _i16.SingleGuidePage(guide: args.guide, key: args.key);
    },
  );
}

class SingleGuideRouteArgs {
  const SingleGuideRouteArgs({required this.guide, this.key});

  final _i25.Guide guide;

  final _i21.Key? key;

  @override
  String toString() {
    return 'SingleGuideRouteArgs{guide: $guide, key: $key}';
  }
}

/// generated route for
/// [_i17.SingleMarkerPage]
class SingleMarkerRoute extends _i19.PageRouteInfo<SingleMarkerRouteArgs> {
  SingleMarkerRoute({
    required _i22.MapMarkerModel mapMarker,
    required void Function(_i22.MapMarkerModel) onResolveButtonPressed,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         SingleMarkerRoute.name,
         args: SingleMarkerRouteArgs(
           mapMarker: mapMarker,
           onResolveButtonPressed: onResolveButtonPressed,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'SingleMarkerRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleMarkerRouteArgs>();
      return _i17.SingleMarkerPage(
        mapMarker: args.mapMarker,
        onResolveButtonPressed: args.onResolveButtonPressed,
        key: args.key,
      );
    },
  );
}

class SingleMarkerRouteArgs {
  const SingleMarkerRouteArgs({
    required this.mapMarker,
    required this.onResolveButtonPressed,
    this.key,
  });

  final _i22.MapMarkerModel mapMarker;

  final void Function(_i22.MapMarkerModel) onResolveButtonPressed;

  final _i21.Key? key;

  @override
  String toString() {
    return 'SingleMarkerRouteArgs{mapMarker: $mapMarker, onResolveButtonPressed: $onResolveButtonPressed, key: $key}';
  }
}

/// generated route for
/// [_i18.SplashPage]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute({List<_i19.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i18.SplashPage();
    },
  );
}
