// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i16;
import 'package:thuri_cycle/app/app_wrapper.dart' as _i1;
import 'package:thuri_cycle/app/onboarding.dart' as _i7;
import 'package:thuri_cycle/app/splash.dart' as _i13;
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart'
    as _i17;
import 'package:thuri_cycle/domain/community/article/article.dart' as _i15;
import 'package:thuri_cycle/domain/report_waste/map_marker.dart' as _i18;
import 'package:thuri_cycle/presentation/auth/login.dart' as _i5;
import 'package:thuri_cycle/presentation/auth/otp.dart' as _i8;
import 'package:thuri_cycle/presentation/community/article_page.dart' as _i2;
import 'package:thuri_cycle/presentation/community/community_page.dart' as _i3;
import 'package:thuri_cycle/presentation/home/home.dart' as _i4;
import 'package:thuri_cycle/presentation/profile/profile.dart' as _i9;
import 'package:thuri_cycle/presentation/report_waste/map_page.dart' as _i6;
import 'package:thuri_cycle/presentation/report_waste/marker/single_marker_page.dart'
    as _i12;
import 'package:thuri_cycle/presentation/report_waste/report_page.dart' as _i10;
import 'package:thuri_cycle/presentation/scan_waste/scan_waste.dart' as _i11;

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i14.PageRouteInfo<void> {
  const AppWrapper({List<_i14.PageRouteInfo>? children})
    : super(AppWrapper.name, initialChildren: children);

  static const String name = 'AppWrapper';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppWrapper();
    },
  );
}

/// generated route for
/// [_i2.ArticlePage]
class ArticleRoute extends _i14.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    required _i15.Article article,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         ArticleRoute.name,
         args: ArticleRouteArgs(article: article, key: key),
         initialChildren: children,
       );

  static const String name = 'ArticleRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleRouteArgs>();
      return _i2.ArticlePage(article: args.article, key: args.key);
    },
  );
}

class ArticleRouteArgs {
  const ArticleRouteArgs({required this.article, this.key});

  final _i15.Article article;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ArticleRouteArgs{article: $article, key: $key}';
  }
}

/// generated route for
/// [_i3.CommunityPage]
class CommunityRoute extends _i14.PageRouteInfo<void> {
  const CommunityRoute({List<_i14.PageRouteInfo>? children})
    : super(CommunityRoute.name, initialChildren: children);

  static const String name = 'CommunityRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.CommunityPage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.MapPage]
class MapRoute extends _i14.PageRouteInfo<void> {
  const MapRoute({List<_i14.PageRouteInfo>? children})
    : super(MapRoute.name, initialChildren: children);

  static const String name = 'MapRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.MapPage();
    },
  );
}

/// generated route for
/// [_i7.OnboardingPage]
class OnboardingRoute extends _i14.PageRouteInfo<void> {
  const OnboardingRoute({List<_i14.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i8.OtpPage]
class OtpRoute extends _i14.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    required String phoneNumber,
    required _i17.AuthFormCubit authFormCubit,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
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

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i14.WrappedRoute(
        child: _i8.OtpPage(
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

  final _i17.AuthFormCubit authFormCubit;

  final _i16.Key? key;

  @override
  String toString() {
    return 'OtpRouteArgs{phoneNumber: $phoneNumber, authFormCubit: $authFormCubit, key: $key}';
  }
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfilePage();
    },
  );
}

/// generated route for
/// [_i10.ReportPage]
class ReportRoute extends _i14.PageRouteInfo<void> {
  const ReportRoute({List<_i14.PageRouteInfo>? children})
    : super(ReportRoute.name, initialChildren: children);

  static const String name = 'ReportRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.ReportPage();
    },
  );
}

/// generated route for
/// [_i11.ScanWastePage]
class ScanWasteRoute extends _i14.PageRouteInfo<void> {
  const ScanWasteRoute({List<_i14.PageRouteInfo>? children})
    : super(ScanWasteRoute.name, initialChildren: children);

  static const String name = 'ScanWasteRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.ScanWastePage();
    },
  );
}

/// generated route for
/// [_i12.SingleMarkerPage]
class SingleMarkerRoute extends _i14.PageRouteInfo<SingleMarkerRouteArgs> {
  SingleMarkerRoute({
    required _i18.MapMarkerModel mapMarker,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         SingleMarkerRoute.name,
         args: SingleMarkerRouteArgs(mapMarker: mapMarker, key: key),
         initialChildren: children,
       );

  static const String name = 'SingleMarkerRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleMarkerRouteArgs>();
      return _i12.SingleMarkerPage(mapMarker: args.mapMarker, key: args.key);
    },
  );
}

class SingleMarkerRouteArgs {
  const SingleMarkerRouteArgs({required this.mapMarker, this.key});

  final _i18.MapMarkerModel mapMarker;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SingleMarkerRouteArgs{mapMarker: $mapMarker, key: $key}';
  }
}

/// generated route for
/// [_i13.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.SplashPage();
    },
  );
}
