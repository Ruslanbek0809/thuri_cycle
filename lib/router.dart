import 'package:auto_route/auto_route.dart';
import 'package:thuri_cycle/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/splash',
          page: SplashRoute.page,
          initial: true,
        ),

        // // These route(s) should NOT be inside `AppWrapper`
        // AutoRoute(path: '/onboarding', page: OnboardingRoute.page),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: '/otp',
          page: OtpRoute.page,
        ),

        // Main bottom navigation wrapper
        AutoRoute(
          path: '/',
          page: AppWrapper.page,
          children: [
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(
              path: 'scan-waste',
              page: ScanWasteRoute.page,
            ),
            AutoRoute(
              path: 'map',
              page: const EmptyShellRoute('MapRoute'),
              children: [
                AutoRoute(path: '', page: MapRoute.page, initial: true),
                AutoRoute(
                  path: 'report',
                  page: ReportRoute.page,
                  meta: const {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: 'single-marker',
                  page: SingleMarkerRoute.page,
                  meta: const {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: 'resolve',
                  page: ResolveRoute.page,
                  meta: const {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: 'scoreboard',
                  page: ScoreboardRoute.page,
                  meta: const {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: 'settings',
                  page: SettingsRoute.page,
                  meta: const {'hideBottomNav': true},
                ),
              ],
            ),
            // AutoRoute(
            //   path: 'map',
            //   page: MapRoute.page,
            // ),

            // RecyclingGuideRoute
            AutoRoute(
              path: 'community',
              page: const EmptyShellRoute('CommunityRoute'),
              children: [
                AutoRoute(path: '', page: CommunityRoute.page, initial: true),
                AutoRoute(
                  path: ':single-article',
                  page: SingleArticleRoute.page,
                  meta: const {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: ':single-guide',
                  page: SingleGuideRoute.page,
                  meta: const {'hideBottomNav': true},
                ),
              ],
            ),
            // AutoRoute(path: 'community', page: CommunityRoute.page),
            AutoRoute(
              path: 'profile',
              page: ProfileRoute.page,
            ),
            // To access this page outside of profile
            AutoRoute(
              path: 'profile-user-edit',
              page: ProfileUserEditRoute.page,
              meta: const {'hideBottomNav': true},
            ),
          ],
        ),
      ];
}
