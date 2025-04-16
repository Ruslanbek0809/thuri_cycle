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
import 'package:thuri_cycle/app/onboarding.dart' as _i6;
import 'package:thuri_cycle/app/splash.dart' as _i13;
import 'package:thuri_cycle/presentation/auth/login.dart' as _i5;
import 'package:thuri_cycle/presentation/home/home.dart' as _i4;
import 'package:thuri_cycle/presentation/profile/profile.dart' as _i7;
import 'package:thuri_cycle/presentation/profile/profile_users/profile_user/profile_user_edit_info.dart'
    as _i8;
import 'package:thuri_cycle/presentation/profile/profile_users/profile_user/profile_user_view.dart'
    as _i9;
import 'package:thuri_cycle/presentation/recycling_guide/article_page.dart'
    as _i2;
import 'package:thuri_cycle/presentation/recycling_guide/article_widgets/article/article.dart'
    as _i15;
import 'package:thuri_cycle/presentation/recycling_guide/community_page.dart'
    as _i3;
import 'package:thuri_cycle/presentation/recycling_guide/recycling_guide.dart'
    as _i10;
import 'package:thuri_cycle/presentation/report_waste/report_waste.dart'
    as _i11;
import 'package:thuri_cycle/presentation/scan_waste/scan_waste.dart' as _i12;

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
/// [_i6.OnboardingPage]
class OnboardingRoute extends _i14.PageRouteInfo<void> {
  const OnboardingRoute({List<_i14.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfilePage();
    },
  );
}

/// generated route for
/// [_i8.ProfileUserEditInfoPage]
class ProfileUserEditInfoRoute extends _i14.PageRouteInfo<void> {
  const ProfileUserEditInfoRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileUserEditInfoRoute.name, initialChildren: children);

  static const String name = 'ProfileUserEditInfoRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileUserEditInfoPage();
    },
  );
}

/// generated route for
/// [_i9.ProfileUserViewPage]
class ProfileUserViewRoute
    extends _i14.PageRouteInfo<ProfileUserViewRouteArgs> {
  ProfileUserViewRoute({
    required InvalidType userProfile,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         ProfileUserViewRoute.name,
         args: ProfileUserViewRouteArgs(userProfile: userProfile, key: key),
         initialChildren: children,
       );

  static const String name = 'ProfileUserViewRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileUserViewRouteArgs>();
      return _i9.ProfileUserViewPage(
        userProfile: args.userProfile,
        key: args.key,
      );
    },
  );
}

class ProfileUserViewRouteArgs {
  const ProfileUserViewRouteArgs({required this.userProfile, this.key});

  final InvalidType userProfile;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ProfileUserViewRouteArgs{userProfile: $userProfile, key: $key}';
  }
}

/// generated route for
/// [_i10.RecyclingGuidePage]
class RecyclingGuideRoute extends _i14.PageRouteInfo<void> {
  const RecyclingGuideRoute({List<_i14.PageRouteInfo>? children})
    : super(RecyclingGuideRoute.name, initialChildren: children);

  static const String name = 'RecyclingGuideRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.RecyclingGuidePage();
    },
  );
}

/// generated route for
/// [_i11.ReportWastePage]
class ReportWasteRoute extends _i14.PageRouteInfo<void> {
  const ReportWasteRoute({List<_i14.PageRouteInfo>? children})
    : super(ReportWasteRoute.name, initialChildren: children);

  static const String name = 'ReportWasteRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.ReportWastePage();
    },
  );
}

/// generated route for
/// [_i12.ScanWastePage]
class ScanWasteRoute extends _i14.PageRouteInfo<void> {
  const ScanWasteRoute({List<_i14.PageRouteInfo>? children})
    : super(ScanWasteRoute.name, initialChildren: children);

  static const String name = 'ScanWasteRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.ScanWastePage();
    },
  );
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
