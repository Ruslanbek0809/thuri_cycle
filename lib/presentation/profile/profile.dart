import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/app/app_cubit.dart';
import 'package:thuri_cycle/application/app/locale/locale_cubit.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
import 'package:thuri_cycle/application/profile/settings_form_cubit.dart';
import 'package:thuri_cycle/domain/profile/language/language.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.dart';
import 'package:thuri_cycle/infastructure/scroll_controller/scroll_controller_service.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/bottom_sheet_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/simple_dialog_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_divider.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_item_card.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_login_card.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_theme_item_card.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_updates_item_card.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_user_card.dart';
import 'package:thuri_cycle/router.gr.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    // fetchSettingsRelatedDataIfNotLoaded();
    context.read<SettingsFormCubit>().getAppVersion();
  }

  // //* If fetching of settings data wasn't success in HomePage, it will trigger this function.
  // //* If success, this fetches won't be triggered. See inside get function parts of cubits
  // Future<void> fetchSettingsRelatedDataIfNotLoaded() async {
  //   await context.read<CountryCubit>().getCountries();
  //   if (context.mounted) {
  //     await context.read<LanguageCubit>().getLanguages();
  //   }
  //   if (context.mounted) {
  //     await context.read<CurrencyCubit>().getCurrencies();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final profileUserFormCubit =
    //     BlocProvider.of<ProfileUserFormCubit>(context, listen: true);
    // final userModel = profileUserFormCubit.state.userModel;

    return MultiBlocListener(
      listeners: [
        //*------------------ SETTINGS RELATED LISTENERS ---------------------//
        BlocListener<SettingsFormCubit, SettingsFormState>(
          // listenWhen: (previous, current) =>
          //     previous.countryModel != current.countryModel ||
          //     previous.currencyModel != current.currencyModel,
          listener: (context, state) {
            // _pagingController.refresh();
          },
        ),
        // BlocListener<LanguageCubit, LanguageState>(
        //   listenWhen: (previous, current) => previous != current,
        //   listener: (context, state) {
        //     state.maybeWhen(
        //       success: (value) async {
        //         if (value.isNotEmpty) {
        //           await context
        //               .read<SettingsFormCubit>()
        //               .assignLanguages(value);
        //           if (context.mounted) {
        //             final selectedLanguage =
        //                 context.read<SettingsFormCubit>().state.languageModel;
        //             if (selectedLanguage != null) {
        //               final updatedSelectedLanguage = value.firstWhere(
        //                 (language) => language.id == selectedLanguage.id,
        //                 orElse: () => selectedLanguage,
        //               );

        //               await context
        //                   .read<SettingsFormCubit>()
        //                   .languageChanged(updatedSelectedLanguage);
        //             }
        //           }
        //         } else {
        //           await context.read<SettingsFormCubit>().assignLanguages([]);
        //         }
        //       },
        //       failed: (alert) async {
        //         scaffoldMessengerKey.currentState
        //           ?..hideCurrentSnackBar()
        //           ..showSnackBar(
        //             SnackBarHelper.createError(
        //               message: alert.message,
        //             ),
        //           );

        //         await context
        //             .read<SettingsFormCubit>()
        //             .assignLanguages([], showError: true);
        //       },
        //       orElse: () {},
        //     );
        //   },
        // ),
      ],
      child: BlocBuilder<SettingsFormCubit, SettingsFormState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? $constants.palette.secondaryBackground
                : $constants.palette.darkBackground,
            appBar: AppBar(
              leadingWidth: getTabletType() ? 80 : 56,
              title: Text(
                context.l10n.profile,
                style: getTextTheme(context).titleLarge!.copyWith(
                      fontSize: responsiveFontSize(
                        context,
                        22,
                      ),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
              ),
            ),
            body: BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, authState) => ListView(
                controller: ScrollControllerService().profileScrollController,
                children: [
                  SizedBox(height: $constants.insets.sm),
                  if (authState == const AuthState.authenticated())
                    const ProfileUserCard()
                  else
                    ProfileLoginCard(
                      onTap: () async {
                        await context.router.push(const LoginRoute());
                      },
                    ),
                  SizedBox(height: $constants.insets.xxs + 2),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        $constants.corners.md + 6,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: $constants.insets.xxs),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //*------------------ LANGUAGE ---------------------//
                          ProfileItemCard(
                            title: context.l10n.language,
                            svgName: 'assets/profile/language.svg',
                            value: 'English',
                            onTap: () async {
                              final languages = <LanguageModel>[
                                LanguageModel(
                                  id: 1,
                                  name: 'English',
                                  shortName: 'en',
                                ),
                                LanguageModel(
                                  id: 2,
                                  name: 'Deutsch',
                                  shortName: 'de',
                                ),
                              ];
                              await BottomSheetHelper.showLanguagesSheet(
                                context,
                                languages,
                                state.languageModel,
                              ).then<void>((value) async {
                                if (value == null) return;
                                // if (context.mounted) {
                                //   context.read<RestartCubit>().restartApp();
                                // }
                                if (context.mounted) {
                                  await context
                                      .read<SettingsFormCubit>()
                                      .languageChanged(value);
                                }
                                if (context.mounted) {
                                  await context
                                      .read<LocaleCubit>()
                                      .changeLocale(
                                        Locale(value.shortName ?? 'en'),
                                      );
                                }
                              });
                            },
                          ),
                          const CustomDivider(),
                          //*------------------ DARK MODE ---------------------//
                          BlocBuilder<AppCubit, AppState>(
                            buildWhen: (p, c) => p.theme != c.theme,
                            builder: (context, state) {
                              return ProfileThemeItemCard(
                                title: context.l10n.theme,
                                svgName: 'assets/profile/dark_mode.svg',
                                value: state.theme.mode.name[0].toUpperCase() +
                                    state.theme.mode.name.substring(1),
                                onTap: () async {
                                  await SimpleDialogHelper.showThemesDialog(
                                    context,
                                    state.theme.mode,
                                  ).then<void>((value) async {
                                    if (value == null) return;
                                    await getIt<AppCubit>().setThemeMode(
                                      mode: value,
                                    );
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: $constants.insets.xxs + 2),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        $constants.corners.md + 6,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: $constants.insets.xxs,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //TODO: Implement now
                          ProfileItemCard(
                            title: context.l10n.termsOfUse,
                            svgName: 'assets/profile/terms.svg',
                            onTap: () async {
                              // await context.router
                              //     .push(const TermsOfUseRoute());
                            },
                          ),
                          //TODO: Implement later on
                          // const CustomDivider(),
                          // ProfileItemCard(
                          //   title: context.l10n.privacyPolicy,
                          //   svgName: 'assets/profile/privacy.svg',
                          //   onTap: () async {
                          //     // await context.router
                          //     //     .push(const PrivacyPolicyRoute());
                          //   },
                          // ),
                          const CustomDivider(),
                          //TODO: Implement later on
                          // ProfileItemCard(
                          //   title: context.l10n.contactUs,
                          //   svgName: 'assets/profile/contact_us.svg',
                          //   onTap: () async {
                          //     // await context.router.push(const ContactUsRoute());
                          //   },
                          // ),
                          //TODO: Implement later on
                          // const CustomDivider(),
                          // ProfileItemCard(
                          //   title: context.l10n.rateUs,
                          //   svgName: 'assets/profile/rate_us.svg',
                          //   onTap: () async {
                          //     // await context
                          //     //     .read<SettingsFormCubit>()
                          //     //     .requestInAppReview();
                          //   },
                          // ),
                          //TODO: Implement later on
                          // const CustomDivider(),
                          // ProfileItemCard(
                          //   title: 'FAQ',
                          //   svgName: 'assets/profile/faq.svg',
                          //   onTap: () async {
                          //     // await context.router.push(const FaqRoute());
                          //   },
                          // ),
                          const CustomDivider(),
                          ProfileUpdatesItemCard(
                            title: context.l10n.appVersion,
                            svgName: 'assets/profile/updates.svg',
                            value: 'V ${state.packageInfo?.version}',
                            onTap: () async {
                              // context
                              //     .read<AuthBloc>()
                              //     .add(const AuthEvent.signedOut());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: $constants.insets.sm),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
