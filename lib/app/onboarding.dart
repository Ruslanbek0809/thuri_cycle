import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
// import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // final settingsFormCubit = getIt<SettingsFormCubit>();

  // @override
  // void initState() {
  //   super.initState();
  //   disableOnboarding();
  // }

  // Future<void> disableOnboarding() async {
  //   await settingsFormCubit.disableOnboarding();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container()),
      // OnBoardingSlider(
      //   finishButtonText: context.l10n.finish,
      //   onFinish: () async {
      //     await context.router.replace(const AppNavigator());
      //   },
      //   finishButtonStyle: FinishButtonStyle(
      //     backgroundColor: $constants.palette.main,
      //     elevation: 1,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(
      //         $constants.corners.md + 2,
      //       ),
      //     ),
      //   ),
      //   middle: SvgPicture.asset(
      //     'assets/logo_icon_text.svg',
      //     height: getTabletType() ? 64 : 32,
      //     width: getSize(context).width * 0.34,
      //     colorFilter: ColorFilter.mode(
      //       Theme.of(context).brightness == Brightness.light
      //           ? $constants.palette.black
      //           : $constants.palette.white,
      //       BlendMode.srcIn,
      //     ),
      //   ),
      //   skipTextButton: Text(
      //     context.l10n.skip,
      //     style: getTextTheme(context).titleMedium!.copyWith(
      //           fontSize: 16,
      //           color: $constants.palette.main,
      //         ),
      //   ),
      //   trailing: const SizedBox.shrink(),
      //   trailingFunction: () {},
      //   controllerColor: $constants.palette.main,
      //   totalPage: 4,
      //   headerBackgroundColor: getThemeData(context).scaffoldBackgroundColor,
      //   pageBackgroundColor: getThemeData(context).scaffoldBackgroundColor,
      //   centerBackground: true,
      //   background: [
      //     Padding(
      //       padding: EdgeInsets.only(top: $constants.insets.xl),
      //       child: Image.asset(
      //         'assets/onboarding/onboarding_1.png',
      //         height: getSize(context).height * 0.45,
      //         width: getSize(context).width * 0.8,
      //         fit: BoxFit.contain,
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: $constants.insets.xl),
      //       child: Image.asset(
      //         'assets/onboarding/onboarding_4.png',
      //         height: getSize(context).height * 0.45,
      //         width: getSize(context).width * 0.8,
      //         fit: BoxFit.contain,
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: $constants.insets.xl),
      //       child: Image.asset(
      //         'assets/onboarding/onboarding_2.png',
      //         height: getSize(context).height * 0.45,
      //         width: getSize(context).width * 0.8,
      //         fit: BoxFit.contain,
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: $constants.insets.xl),
      //       child: Image.asset(
      //         'assets/onboarding/onboarding_3.png',
      //         height: getSize(context).height * 0.45,
      //         width: getSize(context).width * 0.8,
      //         fit: BoxFit.contain,
      //       ),
      //     ),
      //   ],
      //   speed: 1.8,
      //   pageBodies: [
      //     //*--------------- ONBOARDING 1 ---------------//
      //     Container(
      //       alignment: Alignment.center,
      //       width: getSize(context).width,
      //       padding: EdgeInsets.symmetric(horizontal: $constants.insets.lg),
      //       child: Column(
      //         children: <Widget>[
      //           SizedBox(height: getSize(context).height * 0.58),
      //           Text(
      //             context.l10n.onboarding1Title,
      //             textAlign: TextAlign.center,
      //             style: getTextTheme(context).titleLarge!.copyWith(
      //                   fontSize: responsiveFontSize(context, 24),
      //                   fontWeight: FontWeight.w800,
      //                 ),
      //           ),
      //           SizedBox(height: $constants.insets.xs),
      //           Text(
      //             context.l10n.onboarding1Description,
      //             textAlign: TextAlign.center,
      //             style: getTextTheme(context).titleMedium!.copyWith(
      //                   fontSize: responsiveFontSize(
      //                     context,
      //                     16,
      //                   ),
      //                   color: $constants.palette.search,
      //                 ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     //*--------------- ONBOARDING 2 ---------------//
      //     Container(
      //       alignment: Alignment.center,
      //       width: getSize(context).width,
      //       padding: EdgeInsets.symmetric(horizontal: $constants.insets.lg),
      //       child: Column(
      //         children: <Widget>[
      //           SizedBox(height: getSize(context).height * 0.58),
      //           Text(
      //             context.l10n.sellWithAI,
      //             textAlign: TextAlign.center,
      //             style: getTextTheme(context).titleLarge!.copyWith(
      //               fontSize: responsiveFontSize(context, 24),
      //               fontWeight: FontWeight.w800,
      //             ),
      //           ),
      //           SizedBox(height: $constants.insets.xs),
      //           Text(
      //             context.l10n.aIDescription,
      //             textAlign: TextAlign.center,
      //             style: getTextTheme(context).titleMedium!.copyWith(
      //               fontSize: responsiveFontSize(
      //                 context,
      //                 16,
      //               ),
      //               color: $constants.palette.search,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     //*--------------- ONBOARDING 3 ---------------//
      //     Container(
      //       alignment: Alignment.center,
      //       width: getSize(context).width,
      //       padding: EdgeInsets.symmetric(horizontal: $constants.insets.lg),
      //       child: Column(
      //         children: <Widget>[
      //           SizedBox(height: getSize(context).height * 0.58),
      //           Text(
      //             context.l10n.onboarding2Title,
      //             textAlign: TextAlign.center,
      //             style: getTextTheme(context).titleLarge!.copyWith(
      //                   fontSize: responsiveFontSize(context, 24),
      //                   fontWeight: FontWeight.w800,
      //                 ),
      //           ),
      //           SizedBox(height: $constants.insets.xs),
      //           Text(
      //             context.l10n.onboarding2Description,
      //             textAlign: TextAlign.center,
      //             style: getTextTheme(context).titleMedium!.copyWith(
      //                   fontSize: responsiveFontSize(
      //                     context,
      //                     16,
      //                   ),
      //                   color: $constants.palette.search,
      //                 ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     //*--------------- ONBOARDING 4 ---------------//
      //     Container(
      //       alignment: Alignment.center,
      //       width: getSize(context).width,
      //       padding: EdgeInsets.symmetric(horizontal: $constants.insets.lg),
      //       child: Column(
      //         children: <Widget>[
      //           SizedBox(height: getSize(context).height * 0.58),
      //           Text(
      //             context.l10n.onboarding3Title,
      //             textAlign: TextAlign.center,
      //             style: getTextTheme(context).titleLarge!.copyWith(
      //                   fontSize: responsiveFontSize(context, 24),
      //                   fontWeight: FontWeight.w800,
      //                 ),
      //           ),
      //           SizedBox(height: $constants.insets.xs),
      //           Text(
      //             context.l10n.onboarding3Description,
      //             textAlign: TextAlign.center,
      //             style: getTextTheme(context).titleMedium!.copyWith(
      //                   fontSize: responsiveFontSize(
      //                     context,
      //                     16,
      //                   ),
      //                   color: $constants.palette.search,
      //                 ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
