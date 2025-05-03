import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/auth/widgets/login_phone_textfield.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_back_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_elevated_gradient_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_loading_indicator.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_logo.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_outline_child_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/keyboard_dismisser.dart';
import 'package:thuri_cycle/router.gr.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneFormKey = GlobalKey<FormState>();
  PhoneController phoneController = PhoneController(
    initialValue: const PhoneNumber(isoCode: IsoCode.DE, nsn: ''),
  );
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final safeTopPadding = MediaQuery.of(context).padding.top;

    return BlocProvider(
      create: (_) => getIt<AuthFormCubit>(),
      child: BlocListener<AuthFormCubit, AuthFormState>(
        listenWhen: (previous, current) =>
            previous.fbPhoneAuthLoginOptionOfSuccessOrFailure !=
            current.fbPhoneAuthLoginOptionOfSuccessOrFailure,
        listener: (context, state) {
          state.fbPhoneAuthLoginOptionOfSuccessOrFailure.fold(() {}, (either) {
            either.fold(
              (failure) {
                context.read<AuthFormCubit>().setIsLoadingToFalse();
                scaffoldMessengerKey.currentState
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(SnackBarHelper.createError(
                    message: failure.map(
                      serverError: (_) => context.l10n.serverError,
                      cancelledByUser: (_) => context.l10n.cancelled,
                      emailAlreadyInUse: (_) => context.l10n.emailAlreadyInUse,
                      invalidEmailAndPasswordCombination: (_) =>
                          context.l10n.invalidEmailPassword,
                      invalidPhoneNumber: (_) =>
                          context.l10n.invalidPhoneNumber,
                      tooManyRequests: (_) => context.l10n.tooManyRequests,
                    ),
                  ));
              },
              (_) async {
                context.read<AuthFormCubit>().setIsLoadingToFalse();

                final phoneNumber = phoneController.value.nsn.isNotEmpty
                    ? '+${phoneController.value.countryCode}${phoneController.value.nsn}'
                    : '';

                await context.router.push(
                  OtpRoute(
                    phoneNumber: phoneNumber,
                    authFormCubit: context.read<AuthFormCubit>(),
                  ),
                );
              },
            );
          });
        },
        child: Scaffold(
          body: KeyboardDismisserWidget(
            child: Form(
              key: phoneFormKey,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                    child: BlocBuilder<AuthFormCubit, AuthFormState>(
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: $constants.insets.offset),
                            //*--------------- LOGO ---------------//
                            Padding(
                              padding:
                                  EdgeInsets.only(top: $constants.insets.xl),
                              child: const CustomLogo(),
                            ),
                            //*--------------- WELCOME TEXT ---------------//
                            Padding(
                              padding: EdgeInsets.only(
                                top: $constants.insets.xl,
                                bottom: $constants.insets.md,
                              ),
                              child: Text(
                                context.l10n.welcome,
                                style:
                                    getTextTheme(context).titleLarge!.copyWith(
                                          fontSize:
                                              responsiveFontSize(context, 25.5),
                                        ),
                              ),
                            ),
                            //*----------------- PHONE ---------------------//
                            LoginPhoneTextField(
                              key: const Key('loginPhone'),
                              phoneController: phoneController,
                              focusNode: focusNode,
                            ),
                            //*----------------- AGREE TERMS ---------------------//
                            Padding(
                              padding:
                                  EdgeInsets.only(top: $constants.insets.sm),
                              child: RichText(
                                text: TextSpan(
                                  style: getTextTheme(context)
                                      .titleSmall!
                                      .copyWith(
                                        fontSize:
                                            responsiveFontSize(context, 12.75),
                                      ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          '${context.l10n.bySigningYouAgree} ',
                                    ),
                                    TextSpan(
                                      text: context.l10n.termsOfUse,
                                      style: getTextTheme(context)
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: responsiveFontSize(
                                              context,
                                              12.75,
                                            ),
                                            color: $constants.palette.appBlue,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                $constants.palette.appBlue,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          final launchUrlParsed = Uri.parse(
                                            'https://firebase.google.com/terms',
                                          );
                                          if (await canLaunchUrl(
                                            launchUrlParsed,
                                          )) {
                                            await launchUrl(launchUrlParsed);
                                          }
                                        },
                                    ),
                                    TextSpan(
                                      text: ' ${context.l10n.and} ',
                                      style: getTextTheme(context)
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: responsiveFontSize(
                                              context,
                                              12.75,
                                            ),
                                          ),
                                    ),
                                    TextSpan(
                                      text: context.l10n.privacyPolicy,
                                      style: getTextTheme(context)
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: responsiveFontSize(
                                              context,
                                              12.75,
                                            ),
                                            color: $constants.palette.appBlue,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                $constants.palette.appBlue,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          final launchUrlParsed = Uri.parse(
                                            'https://firebase.google.com/support/privacy',
                                          );
                                          if (await canLaunchUrl(
                                            launchUrlParsed,
                                          )) {
                                            await launchUrl(launchUrlParsed);
                                          }
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //*--------------- LOGIN BUTTON ---------------//
                            Padding(
                              padding: EdgeInsets.only(
                                top: $constants.insets.sm + 4,
                              ),
                              child: state.isLoading
                                  ? Center(
                                      child: CustomLoadingIndicator(
                                        isSizedBox: true,
                                        height: 50,
                                        width: 50,
                                        color: $constants.palette.main,
                                      ),
                                    )
                                  : CustomElevatedGradientButton(
                                      size: Size(
                                        getSize(context).width,
                                        getTabletType() ? 80 : 50,
                                      ),
                                      onPressed: () async {
                                        if (phoneController
                                            .value.nsn.isNotEmpty) {
                                          await context
                                              .read<AuthFormCubit>()
                                              .verifyPhone(
                                                '+${phoneController.value.countryCode}${phoneController.value.nsn}',
                                              );
                                        } else {
                                          if (context.mounted) {
                                            scaffoldMessengerKey.currentState
                                              ?..hideCurrentSnackBar()
                                              ..showSnackBar(
                                                SnackBarHelper.createError(
                                                  message: context.l10n
                                                      .phoneNumberIsNotValid,
                                                ),
                                              );
                                          }
                                        }
                                      },
                                      child: Text(
                                        context.l10n.login,
                                        style: getTextTheme(context)
                                            .titleMedium!
                                            .copyWith(
                                              fontSize: responsiveFontSize(
                                                context,
                                                14.5,
                                              ),
                                              color: $constants.palette.white,
                                            ),
                                      ),
                                    ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: $constants.insets.sm,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 0.5,
                                        color:
                                            getThemeData(context).canvasColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: $constants.insets.xs,
                                      ),
                                      child: Text(
                                        context.l10n.or,
                                        style: getTextTheme(context)
                                            .titleMedium!
                                            .copyWith(
                                              fontSize: responsiveFontSize(
                                                context,
                                                14.5,
                                              ),
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 0.5,
                                        color:
                                            getThemeData(context).canvasColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //*--------------- GOOGLE SIGN-IN BUTTON ---------------//
                            CustomOutlineChildButton(
                              borderWidth: 0.5,
                              borderColor: getThemeData(context).canvasColor,
                              borderRadius: BorderRadius.circular(
                                $constants.corners.md + 2,
                              ),
                              minimumSize: Size(
                                getSize(context).width,
                                getTabletType() ? 80 : 50,
                              ),
                              onPressed: () async {
                                await context
                                    .read<AuthFormCubit>()
                                    .signInWithGoogle();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/google.svg',
                                    height: getTabletType() ? 40 : 20,
                                    width: getTabletType() ? 40 : 20,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: $constants.insets.xs + 2,
                                      ),
                                      child: Text(
                                        context.l10n.signInWithGoogle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: getTextTheme(context)
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: responsiveFontSize(
                                                context,
                                                12.75,
                                              ),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //*--------------- APPLE SIGN-IN BUTTON ---------------//
                            SizedBox(height: $constants.insets.sm),
                            CustomOutlineChildButton(
                              borderWidth: 0.5,
                              borderColor: getThemeData(context).canvasColor,
                              borderRadius: BorderRadius.circular(
                                $constants.corners.md + 2,
                              ),
                              minimumSize: Size(
                                getSize(context).width,
                                getTabletType() ? 80 : 50,
                              ),
                              onPressed: () async {
                                if (UniversalPlatform.isIOS) {
                                  final isAvailable =
                                      await SignInWithApple.isAvailable();
                                  if (isAvailable) {
                                    if (context.mounted) {
                                      await context
                                          .read<AuthFormCubit>()
                                          .signInWithApple();
                                    }
                                  } else {
                                    if (context.mounted) {
                                      scaffoldMessengerKey.currentState
                                        ?..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          SnackBarHelper.createInformation(
                                            message: context.l10n
                                                .yourPhoneDoesntSupportAppleSignIn,
                                          ),
                                        );
                                    }
                                  }
                                } else {
                                  scaffoldMessengerKey.currentState
                                    ?..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBarHelper.createInformation(
                                        message:
                                            context.l10n.comingInNextUpdate,
                                      ),
                                    );
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/apple.svg',
                                    height: getTabletType() ? 40 : 20,
                                    width: getTabletType() ? 40 : 20,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: $constants.insets.xs + 2,
                                      ),
                                      child: Text(
                                        context.l10n.signInWithApple,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: getTextTheme(context)
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: responsiveFontSize(
                                                context,
                                                12.75,
                                              ),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: safeTopPadding,
                    left: 0,
                    child: Padding(
                      padding: EdgeInsets.only(left: $constants.insets.sm),
                      child: const CustomBackButton(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
