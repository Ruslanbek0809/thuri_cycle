import 'package:auto_route/auto_route.dart';
import 'package:thuri_cycle/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // Show splash page first
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
                AutoRoute(path: ':article', page: ArticleRoute.page),
              ],
            ),
            // AutoRoute(path: 'community', page: CommunityRoute.page),
            AutoRoute(
              path: 'profile',
              page: ProfileRoute.page,
            ),
          ],
        ),
      ];
}
