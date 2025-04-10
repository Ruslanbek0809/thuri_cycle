import 'dart:async';

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
import 'package:thuri_cycle/infastructure/scroll_controller/scroll_controller_service.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/dialog_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/router.gr.dart';

@RoutePage()
class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> with WidgetsBindingObserver {
  @override
  void initState() {
    //* REMOVES splash screen after initialization.
    FlutterNativeSplash.remove();

    WidgetsBinding.instance.addObserver(this);
    super.initState();

    // initFirebase();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    talker.error('AppWrapper AppWrapper state: $state');
    super.didChangeAppLifecycleState(state);
  }

  @override
  Future<void> didChangePlatformBrightness() async {
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBlocState = BlocProvider.of<AuthBloc>(context, listen: true)
        .state; //* listen parameter LISTENS for realtime changes on AuthCubit

    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false,
      // navigatorObservers: () => [AutoRouteObserver()],
      navigatorObservers: () =>
          AutoRouterDelegate.of(context).navigatorObservers(),
      routes: const [
        HomeRoute(),
        ScanWasteRoute(),
        ReportWasteRoute(),
        RecyclingGuideRoute(),
        ProfileRoute(),
      ],
      animationDuration: const Duration(milliseconds: 100),
      transitionBuilder: (context, child, animation) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: ReverseAnimation(animation),
          child: child,
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        //* hideBottomNav is used to hide bottom navigation on particular routes
        final hideBottomNav =
            context.topRouteMatch.meta['hideBottomNav'] == true;
        if (hideBottomNav) return const SizedBox.shrink();
        return NavigationBarTheme(
          data: getThemeData(context).navigationBarTheme.copyWith(
            labelTextStyle: WidgetStateProperty.resolveWith((state) {
              if (state.contains(WidgetState.selected)) {
                return $constants.textStyle.navBarTextStyle(context);
              }
              return $constants.textStyle.navBarTextStyle(
                context,
                color: $constants.palette.navigationColor,
              );
            }),
          ),
          child: NavigationBar(
            height: getTabletType() ? 120 : 60,
            labelPadding: EdgeInsets.zero,
            selectedIndex: tabsRouter.activeIndex,
            elevation: 16,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (index) async {
              if (index == 3) {
                if (authBlocState == const AuthState.unauthenticated()) {
                  if (context.mounted) {
                    await DialogHelper.showCustomAlertDialog(
                      context,
                      title: context.l10n.logIn,
                      content: context.l10n.loginToDoAction,
                      cancelText: context.l10n.cancel,
                      confirmText: context.l10n.logIn,
                    ).then<void>((value) async {
                      if (value ?? false) {
                        if (context.mounted) {
                          await context.router.push(const LoginRoute());
                        }
                      }
                    });
                  }
                } else {
                  if (tabsRouter.activeIndex == index) {
                    unawaited(
                      ScrollControllerService()
                          .reportWastaScrollController
                          .animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          ),
                    );
                  }
                  tabsRouter.setActiveIndex(index);
                }

                //     // if (Theme.of(context).platform == TargetPlatform.iOS) {
                //     //   await SnackBarHelper.createInformation(
                //     //     message: context.l10n.comingInNextUpdate,
                //     //   ).show(context);
                //     // } else {
                //     // //* NOT LOGGED-IN
                //     // if (authBlocState == const AuthState.unauthenticated()) {
                //     //   await DialogHelper.showCustomAlertDialog(
                //     //     context,
                //     //     title: context.l10n.logIn,
                //     //     content: context.l10n.loginToDoAction,
                //     //     cancelText: context.l10n.cancel,
                //     //     confirmText: context.l10n.logIn,
                //     //   ).then<void>((value) async {
                //     //     if (value ?? false) {
                //     //       await context.router.push(const LoginRoute());
                //     //     }
                //     //   });
                //     // } else {
                //     // tabsRouter.setActiveIndex(index);
                //     //  }
                //     // }
                //   } else {
                //responsiveFontSize(implement properly
                // if (tabsRouter.activeIndex == index) {
                //   unawaited(
                //     ScrollControllerService().profileScrollController.animateTo(
                //           0,
                //           duration: const Duration(milliseconds: 500),
                //           curve: Curves.easeInOut,
                //         ),
                //   );
                // }

                tabsRouter.setActiveIndex(index);
              }
            },
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: $constants.navigation.bottomNavigationItems(
              context,
              tabsRouter.activeIndex,
            ),
          ),
        );
      },
    );
  }

  //TODO: If needed, additional firebase configurations
  // Future<void> initFirebase() async {
  //   await initFirebaseDynamicLinks();
  //   await context.read<ProfileUserFormCubit>().getProfileUser();
  //   context.read<HomeCubit>().initialMessage(context);
  //   context.read<HomeCubit>().initFcmForegroundMessage(context);
  //   context.read<HomeCubit>().initFcmNotificationPressedMessage(context);
  // }

  // Future<void> initFirebaseDynamicLinks() async {
  //   final firebaseDynamicLinkService = getIt<FirebaseDynamicLinkService>();

  //   await firebaseDynamicLinkService.handleAppOpenedByDynamicLinks(
  //     context: context,
  //     onLinkSuccess: handleLinkSuccess,
  //   );

  //   if (context.mounted) {
  //     await firebaseDynamicLinkService.handleBFDynamicLinks(
  //       context: context,
  //       onLinkSuccess: handleLinkSuccess,
  //     );
  //   }
  // }

  // Future<void> handleLinkSuccess() async {
  //   if (!mounted) return;
  //   await context.read<HomeCubit>().initFcmToken();
  //   if (mounted) {
  //     await context.read<ProfileUserFormCubit>().getProfileUser();
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return RepaintBoundary(
  //     key: _key,
  //     child: const AutoRouter(),
  //   );
  //   // BlocListener<AuthCubit, AuthState>(
  //   //   listener: (context, state) {
  //   //     //* REMOVES splash screen after initialization.
  //   //     FlutterNativeSplash.remove();

  //   //     context.router.replaceAll([const SplashLottieRoute()]);
  //   //     // state.whenOrNull(
  //   //     //   authenticated: (_) {
  //   //     //     context.router.replaceAll([const AppNavigator()]);
  //   //     //   },
  //   //     //   unauthenticated: () {
  //   //     //     context.router.replaceAll([const LoginRoute()]);
  //   //     //   },
  //   //     // );
  //   //   },
  //   //   child: RepaintBoundary(
  //   //     key: _key,
  //   //     child: const AutoRoute(),
  //   //   ),
  //   // );
  // }
}
