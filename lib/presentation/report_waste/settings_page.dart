import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_text_button.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/about_card_widget.dart';

//TODO [optimization]: Check descriptions and update the links
@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final verifyTime = watchStream(
    //       (VerifyTimeProvider provider) => provider.getVerifyTimeStream(),
    //       get<VerifyTimeProvider>().getVerifyTime(),
    //     ).data ??
    //     get<VerifyTimeProvider>().getVerifyTime();

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settings)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.xs),
              child: AboutCardWidget(
                description: context.l10n.thuriCycleDescription,
                svgAssetPath: 'assets/app_logo_svg.svg',
                urlString: 'https://github.com/Ruslanbek0809',
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.xs),
              child: AboutCardWidget(
                description: context.l10n.personalDescription,
                svgAssetPath: 'assets/app_logo_svg.svg',
                urlString: 'https://github.com/Ruslanbek0809',
              ),
            ),
            //*------------------ Become a Verifier BUTTON ---------------------//
            Padding(
              padding: EdgeInsets.only(
                top: $constants.insets.sm,
              ),
              child: CustomTextButton(
                backgroundColor: $constants.palette.main,
                borderRadius: BorderRadius.circular(
                  $constants.corners.md + 2,
                ),
                minimumSize: Size(
                  getSize(context).width - (($constants.insets.sm + 4) * 2),
                  getTabletType() ? 80 : 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      MdiIcons.shieldCheckOutline,
                      color: $constants.palette.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: $constants.insets.xs,
                    ),
                    Text(
                      context.l10n.becomeVerifier,
                      style: getTextTheme(context).titleSmall!.copyWith(
                            fontSize: responsiveFontSize(
                              context,
                              12.75,
                            ),
                            fontWeight: FontWeight.w400,
                            color: $constants.palette.white,
                          ),
                    ),
                  ],
                ),
                onPressed: () async {
                  // TODO [optimization]: Implement this
                  scaffoldMessengerKey.currentState
                    ?..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBarHelper.createInformation(
                        message: context.l10n.comingInNextUpdate,
                      ),
                    );
                },
              ),
            ),
            const Divider(height: 1),
            // if (authBlocState == const AuthState.authenticated())
            //   SwitchWidget(
            //     checked: true,
            //     // checked: verifyTime.dateTime != null,
            //     title: context.l10n.acceptToReviewSwitchTitle,
            //     description: context.l10n.acceptToReviewSwitchDescription,
            //     // title: l10n.acceptToReviewSwitchTitle,
            //     // description: l10n.acceptToReviewSwitchDescription,
            //     onCheckedChanged: (acceptedToReview) async {
            //       // if (acceptedToReview) {
            //       //   var confirmed = await openAcceptToReviewDialog(context);
            //       //   if (confirmed != true) {
            //       //     return;
            //       //   }
            //       // }

            //       // await get<Backend>().setAcceptedToReview(acceptedToReview);
            //       // get<VerifyTimeProvider>()
            //       //     .onAcceptedToReviewSettingChanged(acceptedToReview);
            //     },
            //   ),
            // InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, IntroductionPage.routeName);
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: Text(l10n.replayIntroduction),
            //   ),
            // ),
            // const Divider(height: 1),
            // const SizedBox(height: 8),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: ServerHostWidget(),
            // ),
            if (kDebugMode) const SizedBox(height: 8),
            if (kDebugMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: const Text('Crash sync'),
                    onPressed: () => throw Exception('Synccc'),
                  ),
                  TextButton(
                    child: const Text('Crash async'),
                    onPressed: () => Future.delayed(
                      Duration.zero,
                      () => throw Exception('Asynccc'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
