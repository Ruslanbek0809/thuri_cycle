// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i15;
import 'package:thuri_cycle/app/app_wrapper.dart' as _i1;
import 'package:thuri_cycle/app/onboarding.dart' as _i7;
import 'package:thuri_cycle/app/splash.dart' as _i12;
import 'package:thuri_cycle/domain/report_waste/map_marker.dart' as _i16;
import 'package:thuri_cycle/presentation/auth/login.dart' as _i5;
import 'package:thuri_cycle/presentation/home/home.dart' as _i4;
import 'package:thuri_cycle/presentation/profile/profile.dart' as _i8;
import 'package:thuri_cycle/presentation/recycling_guide/article_page.dart'
    as _i2;
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart'
    as _i14;
import 'package:thuri_cycle/presentation/recycling_guide/community_page.dart'
    as _i3;
import 'package:thuri_cycle/presentation/report_waste/map_page.dart' as _i6;
import 'package:thuri_cycle/presentation/report_waste/marker/single_marker_page.dart'
    as _i11;
import 'package:thuri_cycle/presentation/report_waste/report_page.dart' as _i9;
import 'package:thuri_cycle/presentation/scan_waste/scan_waste.dart' as _i10;

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i13.PageRouteInfo<void> {
  const AppWrapper({List<_i13.PageRouteInfo>? children})
    : super(AppWrapper.name, initialChildren: children);

  static const String name = 'AppWrapper';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppWrapper();
    },
  );
}

/// generated route for
/// [_i2.ArticlePage]
class ArticleRoute extends _i13.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    required _i14.Article article,
    _i15.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         ArticleRoute.name,
         args: ArticleRouteArgs(article: article, key: key),
         initialChildren: children,
       );

  static const String name = 'ArticleRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleRouteArgs>();
      return _i2.ArticlePage(article: args.article, key: args.key);
    },
  );
}

class ArticleRouteArgs {
  const ArticleRouteArgs({required this.article, this.key});

  final _i14.Article article;

  final _i15.Key? key;

  @override
  String toString() {
    return 'ArticleRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [_i3.CommunityPage]
class CommunityRoute extends _i13.PageRouteInfo<void> {
  const CommunityRoute({List<_i13.PageRouteInfo>? children})
    : super(CommunityRoute.name, initialChildren: children);

  static const String name = 'CommunityRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.CommunityPage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.MapPage]
class MapRoute extends _i13.PageRouteInfo<void> {
  const MapRoute({List<_i13.PageRouteInfo>? children})
    : super(MapRoute.name, initialChildren: children);

  static const String name = 'MapRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.MapPage();
    },
  );
}

/// generated route for
/// [_i7.OnboardingPage]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute({List<_i13.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfilePage();
    },
  );
}

/// generated route for
/// [_i9.ReportPage]
class ReportRoute extends _i13.PageRouteInfo<void> {
  const ReportRoute({List<_i13.PageRouteInfo>? children})
    : super(ReportRoute.name, initialChildren: children);

  static const String name = 'ReportRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.ReportPage();
    },
  );
}

/// generated route for
/// [_i10.ScanWastePage]
class ScanWasteRoute extends _i13.PageRouteInfo<void> {
  const ScanWasteRoute({List<_i13.PageRouteInfo>? children})
    : super(ScanWasteRoute.name, initialChildren: children);

  static const String name = 'ScanWasteRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.ScanWastePage();
    },
  );
}

/// generated route for
/// [_i11.SingleMarkerPage]
class SingleMarkerRoute extends _i13.PageRouteInfo<SingleMarkerRouteArgs> {
  SingleMarkerRoute({
    required _i16.MapMarkerModel mapMarker,
    _i15.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         SingleMarkerRoute.name,
         args: SingleMarkerRouteArgs(mapMarker: mapMarker, key: key),
         initialChildren: children,
       );

  static const String name = 'SingleMarkerRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleMarkerRouteArgs>();
      return _i11.SingleMarkerPage(mapMarker: args.mapMarker, key: args.key);
    },
  );
}

class SingleMarkerRouteArgs {
  const SingleMarkerRouteArgs({required this.mapMarker, this.key});

  final _i16.MapMarkerModel mapMarker;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SingleMarkerRouteArgs{mapMarker: $mapMarker, key: $key}';
  }
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashPage();
    },
  );
}
