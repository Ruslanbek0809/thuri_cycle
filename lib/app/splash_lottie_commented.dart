// import 'package:auto_route/auto_route.dart';
// import 'package:flipgoo_app/presentation/core/utils/constants.dart';
// import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
// import 'package:flipgoo_app/presentation/routes/router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:lottie/lottie.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashLottiePage extends HookWidget {
//   const SplashLottiePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final animationController = useAnimationController();

//     //* Initializing SharedPreferences early to use its data when needed.
//     final prefsFuture = useMemoized(SharedPreferences.getInstance);

//     useEffect(
//       () {
//         //* Configuration and event listener setup.
//         Future<void> handleAnimationStatus(AnimationStatus status) async {
//           if (status == AnimationStatus.completed) {
//             final prefs = await prefsFuture;
//             final isOnboardingSeen =
//                 prefs.getBool($constants.isOnboardingSeen) ?? false;
//             final isWelcomeCountrySeen =
//                 prefs.getBool($constants.isWelcomeCountrySeen) ?? false;

//             if (!isWelcomeCountrySeen) {
//               if (context.mounted) {
//                 await context.router.replace(const WelcomeCountryRoute());
//               }
//             } else if (!isOnboardingSeen) {
//               if (context.mounted) {
//                 await context.router.replace(const OnboardingRoute());
//               }
//             } else {
//               if (context.mounted) {
//                 await context.router.replace(const AppNavigator());
//               }
//             }
//           }
//         }

//         //* Listen to the animation status
//         animationController.addStatusListener(handleAnimationStatus);

//         //* Remove listener to prevent memory leaks
//         return () =>
//             animationController.removeStatusListener(handleAnimationStatus);
//       },
//       [animationController],
//     );

//     return Scaffold(
//       backgroundColor: $constants.palette.main,
//       body: FutureBuilder<SharedPreferences>(
//         future: prefsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Center(
//               child: Lottie.asset(
//                 'assets/splash.json',
//                 height: getSize(context).height,
//                 width: getSize(context).width,
//                 frameRate: FrameRate.max,
//                 alignment: Alignment.center,
//                 controller: animationController,
//                 onLoaded: (composition) {
//                   //* Only start the animation if the context is still mounted
//                   if (context.mounted) {
//                     animationController
//                       ..duration = composition.duration
//                       ..forward();
//                   }
//                 },
//               ),
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
