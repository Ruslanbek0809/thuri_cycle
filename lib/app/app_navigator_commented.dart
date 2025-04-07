// import 'dart:async';

// import 'package:animations/animations.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flipgoo_app/application/auth/auth_bloc.dart';
// import 'package:flipgoo_app/application/auth/profile_user_form/profile_user_form_cubit.dart';
// import 'package:flipgoo_app/application/cart/cart_cubit.dart';
// import 'package:flipgoo_app/application/home/home_cubit.dart';
// import 'package:flipgoo_app/application/profile/settings_form_cubit.dart';
// import 'package:flipgoo_app/application/video/video_listing_feed_video_playback_cubit.dart';
// import 'package:flipgoo_app/domain/profile/in_app_subscriptions/in_app_subscriptions_app_data.dart';
// import 'package:flipgoo_app/infrastructure/core/dependency_injection/di.dart';
// import 'package:flipgoo_app/infrastructure/core/firebase/firebase_dynamic_link_service.dart';
// import 'package:flipgoo_app/infrastructure/core/scroll_controller/scroll_controller_service.dart';
// import 'package:flipgoo_app/l10n/l10n.dart';
// import 'package:flipgoo_app/presentation/core/utils/constants.dart';
// import 'package:flipgoo_app/presentation/core/utils/helpers/dialog_helper.dart';
// import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
// import 'package:flipgoo_app/presentation/routes/router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
// import 'package:universal_platform/universal_platform.dart';

// @RoutePage()
// class AppNavigator extends StatefulWidget {
//   const AppNavigator({super.key});

//   @override
//   State<AppNavigator> createState() => _AppNavigatorState();
// }

// class _AppNavigatorState extends State<AppNavigator> {
//   final AudioPlayer _audioPlayer = AudioPlayer();

//   @override
//   void initState() {
//     super.initState();

//     _audioPlayer
//       ..setSource(AssetSource('sounds/tap.wav'))
//       ..setVolume(0.2)
//       ..setAudioContext(
//         AudioContext(
//           iOS: AudioContextIOS(
//             options: const {
//               AVAudioSessionOptions.mixWithOthers,
//             },
//           ),
//         ),
//       );
//     initInAppSubscriptions();
//     initFirebase();

//     //* LISTENS to AuthBloc state to determine login status.
//     //* If authenticated, then fetches remote data of getCartInfo().
//     //* Otherwise, it has already fetched local carts in app.file via getCartInfo()
//     context.read<AuthBloc>().stream.listen((authState) {
//       if (authState == const AuthState.authenticated()) {
//         context.read<CartCubit>().getCartInfo(isUserLoggedIn: true);
//       }
//     });
//   }

//   Future<void> initFirebase() async {
//     await initFirebaseDynamicLinks();
//     await context.read<ProfileUserFormCubit>().getProfileUser();
//     context.read<HomeCubit>().initialMessage(context);
//     context.read<HomeCubit>().initFcmForegroundMessage(context);
//     context.read<HomeCubit>().initFcmNotificationPressedMessage(context);
//   }

//   Future<void> initFirebaseDynamicLinks() async {
//     final firebaseDynamicLinkService = getIt<FirebaseDynamicLinkService>();

//     await firebaseDynamicLinkService.handleAppOpenedByDynamicLinks(
//       context: context,
//       onLinkSuccess: handleLinkSuccess,
//     );

//     if (context.mounted) {
//       await firebaseDynamicLinkService.handleBFDynamicLinks(
//         context: context,
//         onLinkSuccess: handleLinkSuccess,
//       );
//     }
//   }

//   Future<void> handleLinkSuccess() async {
//     if (!mounted) return;
//     await context.read<HomeCubit>().initFcmToken();
//     if (mounted) {
//       await context.read<ProfileUserFormCubit>().getProfileUser();
//     }
//   }

//   Future<void> initInAppSubscriptions() async {
//     final appUserID = await Purchases.appUserID;
//     inAppSubscriptionsAppData.appUserID = appUserID;
//     Purchases.addCustomerInfoUpdateListener(updateCustomerInfo);
//   }

//   Future<void> updateCustomerInfo(CustomerInfo customerInfo) async {
//     //* Simplified to only fetch necessary info
//     final entitlements = customerInfo.entitlements.all;
//     setState(() {
//       inAppSubscriptionsAppData.premiumEntitlementIsActive =
//           entitlements[$constants.premiumEntitlementID]?.isActive ?? false;
//       inAppSubscriptionsAppData.businessEntitlementIsActive =
//           entitlements[$constants.businessEntitlementID]?.isActive ?? false;
//       inAppSubscriptionsAppData.freeEntitlementIsActive =
//           entitlements[$constants.freeEntitlementID]?.isActive ?? false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authBlocState = BlocProvider.of<AuthBloc>(context, listen: true)
//         .state; //* listen parameter LISTENS for realtime changes on AuthCubit

//     final profileUserFormCubit =
//         BlocProvider.of<ProfileUserFormCubit>(context, listen: true);
//     final userModel = profileUserFormCubit.state.userModel;

//     final cartCubit = context.watch<CartCubit>();
//     final totalCartItems = cartCubit.state.carts.fold<int>(
//       0,
//       (sum, cartModel) => sum + (cartModel.cartItems?.length ?? 0),
//     );

//     final settingsFormCubit = context.watch<SettingsFormCubit>();
//     final totalNotifications = settingsFormCubit.state.notificationsCount;

//     return AutoTabsScaffold(
//       resizeToAvoidBottomInset: false,
//       navigatorObservers: () => [AutoRouteObserver()],
//       routes: const [
//         HomeRoute(),
//         VideoReelsRoute(),
//         // CategoriesRoute(),
//         AddProductRoute(),
//         InboxRoute(),
//         ProfileRoute(),
//       ],
//       animationDuration: const Duration(milliseconds: 100),
//       transitionBuilder: (context, child, animation) {
//         //* Animations package transitions
//         return FadeThroughTransition(
//           animation: animation,
//           secondaryAnimation: ReverseAnimation(animation),
//           child: child,
//         );
//       },
//       bottomNavigationBuilder: (context, tabsRouter) {
//         //* hideBottomNav is used to hide bottom navigation on particular routes
//         final hideBottomNav =
//             context.topRouteMatch.meta['hideBottomNav'] == true;
//         if (hideBottomNav) return const SizedBox.shrink();
//         return NavigationBarTheme(
//           data: getThemeData(context).navigationBarTheme.copyWith(
//             labelTextStyle: WidgetStateProperty.resolveWith((state) {
//               if (state.contains(WidgetState.selected)) {
//                 return TextStyle(
//                   color: $constants.palette.main,
//                   fontSize: responsiveFontSize(context, 12),
//                   fontWeight: FontWeight.w700,
//                   overflow: TextOverflow.ellipsis,
//                 );
//               }
//               return TextStyle(
//                 color: $constants.palette.navigationColor,
//                 fontSize: responsiveFontSize(context, 12),
//                 fontWeight: FontWeight.w700,
//                 overflow: TextOverflow.ellipsis,
//               );
//             }),
//           ),
//           child: NavigationBar(
//             height: getTabletType() ? 120 : 60,
//             labelPadding: EdgeInsets.zero,
//             selectedIndex: tabsRouter.activeIndex,
//             elevation: 16,
//             indicatorColor: Colors.transparent,
//             onDestinationSelected: (index) async {
//               if (tabsRouter.activeIndex != index) {
//                 if (UniversalPlatform.isIOS) {
//                   unawaited(_audioPlayer.seek(Duration.zero));
//                   unawaited(_audioPlayer.resume());
//                 } else {
//                   unawaited(_audioPlayer.stop());
//                   unawaited(_audioPlayer.play(AssetSource('sounds/tap.wav')));
//                 }
//               }

//               if (index != 1) {
//                 unawaited(
//                   context
//                       .read<VideoListingFeedVideoPlaybackCubit>()
//                       .pauseVideo(),
//                 );
//               }

//               // if (index == 1 &&
//               //     authBlocState == const AuthState.authenticated()) {
//               //   unawaited(context.read<CartCubit>().syncLocalCartsWithRemote());
//               // }

//               //* If AddProductRoute() selected
//               if (index == 0) {
//                 if (tabsRouter.activeIndex == index) {
//                   if (ScrollControllerService().homeScrollController.offset <=
//                       0) {
//                     unawaited(context.read<HomeCubit>().getHomeData());
//                   } else {
//                     unawaited(
//                       ScrollControllerService().homeScrollController.animateTo(
//                             0,
//                             duration: const Duration(milliseconds: 500),
//                             curve: Curves.easeInOut,
//                           ),
//                     );
//                   }
//                 }
//                 tabsRouter.setActiveIndex(index);
//               } else if (index == 2) {
//                 //* NOT LOGGED-IN
//                 if (authBlocState == const AuthState.unauthenticated()) {
//                   if (context.mounted) {
//                     await DialogHelper.showCustomAlertDialog(
//                       context,
//                       title: context.l10n.logIn,
//                       content: context.l10n.loginToDoAction,
//                       cancelText: context.l10n.cancel,
//                       confirmText: context.l10n.logIn,
//                     ).then<void>((value) async {
//                       if (value ?? false) {
//                         await context.router.push(const LoginRoute());
//                       }
//                     });
//                   }
//                 } else if (userModel.availability != null &&
//                     (userModel.availability?.maxPosts ?? 0) == 0) {
//                   if (context.mounted) {
//                     await DialogHelper.showCustomAlertDialog(
//                       context,
//                       title: context.l10n.goToSubscriptions,
//                       content: context.l10n.goToSubscriptionsInfo,
//                       confirmText: context.l10n.viewPlans,
//                       isSingleButton: true,
//                     ).then<void>((value) async {
//                       if (value ?? false) {
//                         //* NAVIGATES BETWEEN BOTTOM NAV SCREENS (Here to CategoriesPage)
//                         await context.navigateTo(
//                           const ProfileRoute(
//                             children: [
//                               ProfileRoute(),
//                               SubscriptionsRoute(),
//                             ],
//                           ),
//                         );
//                       }
//                     });
//                   }
//                 } else {
//                   await context.router.push(const AddProductRoute());
//                 }
//               } else if (index == 3) {
//                 if (authBlocState == const AuthState.unauthenticated()) {
//                   if (context.mounted) {
//                     await DialogHelper.showCustomAlertDialog(
//                       context,
//                       title: context.l10n.logIn,
//                       content: context.l10n.loginToDoAction,
//                       cancelText: context.l10n.cancel,
//                       confirmText: context.l10n.logIn,
//                     ).then<void>((value) async {
//                       if (value ?? false) {
//                         await context.router.push(const LoginRoute());
//                       }
//                     });
//                   }
//                 } else {
//                   if (tabsRouter.activeIndex == index) {
//                     unawaited(
//                       ScrollControllerService().inboxScrollController.animateTo(
//                             0,
//                             duration: const Duration(milliseconds: 500),
//                             curve: Curves.easeInOut,
//                           ),
//                     );
//                   }

//                   unawaited(context
//                       .read<HomeCubit>()
//                       .notificationBadgeUpdate(context, 0),);
//                   tabsRouter.setActiveIndex(index);
//                 }

//                 // if (Theme.of(context).platform == TargetPlatform.iOS) {
//                 //   await SnackBarHelper.createInformation(
//                 //     message: context.l10n.comingInNextUpdate,
//                 //   ).show(context);
//                 // } else {
//                 // //* NOT LOGGED-IN
//                 // if (authBlocState == const AuthState.unauthenticated()) {
//                 //   await DialogHelper.showCustomAlertDialog(
//                 //     context,
//                 //     title: context.l10n.logIn,
//                 //     content: context.l10n.loginToDoAction,
//                 //     cancelText: context.l10n.cancel,
//                 //     confirmText: context.l10n.logIn,
//                 //   ).then<void>((value) async {
//                 //     if (value ?? false) {
//                 //       await context.router.push(const LoginRoute());
//                 //     }
//                 //   });
//                 // } else {
//                 // tabsRouter.setActiveIndex(index);
//                 //  }
//                 // }
//               } else {
//                 if (tabsRouter.activeIndex == index) {
//                   unawaited(
//                     ScrollControllerService().profileScrollController.animateTo(
//                           0,
//                           duration: const Duration(milliseconds: 500),
//                           curve: Curves.easeInOut,
//                         ),
//                   );
//                 }

//                 tabsRouter.setActiveIndex(index);
//               }
//             },
//             labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//             destinations: $constants.navigation.bottomNavigationItems(
//               context,
//               tabsRouter.activeIndex,
//               totalCartItems,
//               totalNotifications,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
