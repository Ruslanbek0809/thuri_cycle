import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/about_card_widget.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/switch_widget.dart';

//TODO: Add descriptions
@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBlocState = context.watch<AuthBloc>().state;

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AboutCardWidget(
                description: 'ThuriCycle description',
                // description: l10n.insignoDescription,
                svgAssetPath: 'assets/app_logo_svg.svg',
                urlString: 'https://github.com/Ruslanbek0809',
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AboutCardWidget(
                description: 'Description',
                // description: l10n.mindshubDescription,
                svgAssetPath: 'assets/app_logo_svg.svg',
                urlString: 'https://mindshub.it',
              ),
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            if (authBlocState == const AuthState.authenticated())
              SwitchWidget(
                checked: true,
                // checked: verifyTime.dateTime != null,
                title: context.l10n.acceptToReviewSwitchTitle,
                description: context.l10n.acceptToReviewSwitchDescription,
                // title: l10n.acceptToReviewSwitchTitle,
                // description: l10n.acceptToReviewSwitchDescription,
                onCheckedChanged: (acceptedToReview) async {
                  // if (acceptedToReview) {
                  //   var confirmed = await openAcceptToReviewDialog(context);
                  //   if (confirmed != true) {
                  //     return;
                  //   }
                  // }

                  // await get<Backend>().setAcceptedToReview(acceptedToReview);
                  // get<VerifyTimeProvider>()
                  //     .onAcceptedToReviewSettingChanged(acceptedToReview);
                },
              ),
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
