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
              // meta: const {'hideBottomNav': true},
            ),
            AutoRoute(
              path: 'report-waste',
              page: ReportWasteRoute.page,
            ),
            AutoRoute(
              path: 'recycling-guide',
              page: RecyclingGuideRoute.page,
            ),
            AutoRoute(
              path: 'profile',
              page: ProfileRoute.page,
            ),
          ],
        ),
      ];
}
