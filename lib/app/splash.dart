import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

import 'package:thuri_cycle/router.gr.dart';

//TODO: Add proper splash (plus configure the duration)
@RoutePage()
class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    //* Initializing SharedPreferences early to use its data when needed.
    final prefsFuture = useMemoized(SharedPreferences.getInstance);

    useEffect(
      () {
        Future<void> navigateToNextPage() async {
          // final prefs = await prefsFuture;
          // final isOnboardingSeen =
          //     prefs.getBool($constants.isOnboardingSeen) ?? false;

          // if (!isOnboardingSeen) {
          //   if (context.mounted) {
          //     await context.router.replace(const OnboardingRoute());
          //   }
          // } else {
          if (context.mounted) {
            await context.router.replace(const AppWrapper());
          }
          // }
        }

        //* Setting a timer for the duration of the GIF (3 seconds).
        final timer = Timer(const Duration(seconds: 1), navigateToNextPage);

        //* Cleanup the timer to prevent memory leaks.
        return timer.cancel;
      },
      [prefsFuture],
    );

    return Scaffold(
      backgroundColor: $constants.palette.main,
      body: FutureBuilder<SharedPreferences>(
        future: prefsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Container(),
              // CustomImage(
              //   image: 'assets/splash.gif',
              //   width: getSize(context).width,
              //   height: getSize(context).height,
              // ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
