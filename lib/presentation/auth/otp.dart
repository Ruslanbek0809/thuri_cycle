import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
import 'package:thuri_cycle/application/auth/auth_form/auth_form_cubit.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/auth/widgets/otp_pin_code_textfield.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_back_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_elevated_gradient_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_loading_indicator.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_logo.dart';
import 'package:thuri_cycle/presentation/core/widgets/keyboard_dismisser.dart';

//TODO: Fix otp page duplication issue when code is resent
@RoutePage()
class OtpPage extends StatefulWidget implements AutoRouteWrapper {
  const OtpPage({
    required this.phoneNumber,
    required this.authFormCubit,
    super.key,
  });

  final String phoneNumber;
  final AuthFormCubit authFormCubit;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: authFormCubit, child: this);
  }

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  AuthFormCubit get authFormCubit => widget.authFormCubit;

  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final safeTopPadding = MediaQuery.of(context).padding.top;
    final safeBottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: KeyboardDismisserWidget(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: $constants.insets.sm,
              ),
              child: MultiBlocListener(
                listeners: [
                  //*----------------- OTP verification BlocListener ---------------------//
                  BlocListener<AuthFormCubit, AuthFormState>(
                    listenWhen: (previous, current) =>
                        previous.otpVerificationOptionOfSuccessOrFailure !=
                        current.otpVerificationOptionOfSuccessOrFailure,
                    listener: (context, state) {
                      state.otpVerificationOptionOfSuccessOrFailure.fold(
                        () {},
                        (either) {
                          either.fold(
                            (failure) {
                              context
                                  .read<AuthFormCubit>()
                                  .setIsLoadingToFalse();
                              scaffoldMessengerKey.currentState
                                ?..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBarHelper.createError(
                                    message: failure.map(
                                      serverError: (_) =>
                                          context.l10n.serverError,
                                      cancelledByUser: (_) =>
                                          context.l10n.cancelled,
                                      emailAlreadyInUse: (_) =>
                                          context.l10n.emailAlreadyInUse,
                                      invalidEmailAndPasswordCombination: (_) =>
                                          context.l10n.invalidEmailPassword,
                                      invalidPhoneNumber: (_) =>
                                          context.l10n.invalidPhoneNumber,
                                      tooManyRequests: (_) =>
                                          context.l10n.tooManyRequests,
                                    ),
                                  ),
                                );
                            },
                            (_) async {
                              context
                                  .read<AuthFormCubit>()
                                  .setIsLoadingToFalse();
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.authCheckRequested());
                              if (context.mounted) {
                                scaffoldMessengerKey.currentState
                                  ?..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBarHelper.createSuccess(
                                      message: context.l10n.successLoggedIn,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                              }
                              context.router.popUntilRoot();
                              // await context.router
                              //     .replaceAll([const AppWrapperRoute()]);
                            },
                          );
                        },
                      );
                    },
                  ),
                  //*----------------- OTP resend BlocListener ---------------------//
                  BlocListener<AuthFormCubit, AuthFormState>(
                    listenWhen: (p, c) =>
                        p.fbPhoneAuthLoginOptionOfSuccessOrFailure !=
                        c.fbPhoneAuthLoginOptionOfSuccessOrFailure,
                    listener: (context, state) {
                      state.fbPhoneAuthLoginOptionOfSuccessOrFailure.fold(
                        () {},
                        (either) => either.fold(
                          (failure) {
                            if (state.isResend) {
                              final message = failure.maybeMap(
                                serverError: (_) => context.l10n.serverError,
                                invalidPhoneNumber: (_) =>
                                    context.l10n.invalidPhoneNumber,
                                tooManyRequests: (_) =>
                                    context.l10n.tooManyRequests,
                                // Add others if needed
                                orElse: () => context.l10n.authFailed,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(message)),
                              );
                            }
                          },
                          (_) {
                            if (state.isResend) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(context.l10n.otpCodeResent),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
                child: BlocConsumer<AuthFormCubit, AuthFormState>(
                  listenWhen: (previous, current) =>
                      previous.otpVerificationOptionOfSuccessOrFailure !=
                      current.otpVerificationOptionOfSuccessOrFailure,
                  listener: (context, state) {
                    state.otpVerificationOptionOfSuccessOrFailure.fold(
                      () {},
                      (either) {
                        either.fold(
                          (failure) {
                            context.read<AuthFormCubit>().setIsLoadingToFalse();
                            scaffoldMessengerKey.currentState
                              ?..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBarHelper.createError(
                                  message: failure.map(
                                    serverError: (_) =>
                                        context.l10n.serverError,
                                    cancelledByUser: (_) =>
                                        context.l10n.cancelled,
                                    emailAlreadyInUse: (_) =>
                                        context.l10n.emailAlreadyInUse,
                                    invalidEmailAndPasswordCombination: (_) =>
                                        context.l10n.invalidEmailPassword,
                                    invalidPhoneNumber: (_) =>
                                        context.l10n.invalidPhoneNumber,
                                    tooManyRequests: (_) =>
                                        context.l10n.tooManyRequests,
                                  ),
                                ),
                              );
                          },
                          (_) async {
                            context.read<AuthFormCubit>().setIsLoadingToFalse();
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.authCheckRequested());
                            context.router.popUntilRoot();
                            // await context.router
                            //     .replaceAll([const AppWrapperRoute()]);
                          },
                        );
                      },
                    );
                  },
                  buildWhen: (p, c) => p != c,
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: $constants.insets.offset),
                        //*--------------- LOGO ---------------//
                        Padding(
                          padding: EdgeInsets.only(top: $constants.insets.xl),
                          child: const CustomLogo(),
                        ),
                        //*--------------- CONFIRM TEXT ---------------//
                        Padding(
                          padding: EdgeInsets.only(
                            top: $constants.insets.xxl,
                            bottom: $constants.insets.sm,
                          ),
                          child: Text(
                            context.l10n.confirmation,
                            style: getTextTheme(context).titleLarge!.copyWith(
                                  fontSize: responsiveFontSize(context, 25.5),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: $constants.insets.md,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: getTextTheme(context)
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: responsiveFontSize(context, 14.5),
                                  ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${context.l10n.typeCodeSentTo} ',
                                ),
                                TextSpan(
                                  text: widget.phoneNumber,
                                  style: getTextTheme(context)
                                      .titleMedium!
                                      .copyWith(
                                        fontSize:
                                            responsiveFontSize(context, 14.5),
                                        fontWeight: FontWeight.w600,
                                        color: $constants.palette.main,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //*----------------- PinCodeTextField ---------------------//
                        SizedBox(
                          width: getSize(context).width,
                          child: OtpPinCodeTextField(
                            key: const Key('otp'),
                            otpController: otpController,
                            errorController: errorController,
                            length: 6,
                            textInputAction: TextInputAction.done,
                            focusNode: focusNode,
                            onChanged: (value) {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: $constants.insets.xxs),
                          child: RichText(
                            text: TextSpan(
                              style: getTextTheme(context).titleSmall!.copyWith(
                                    fontSize:
                                        responsiveFontSize(context, 12.75),
                                  ),
                              children: <TextSpan>[
                                TextSpan(text: '${context.l10n.didntGetCode} '),
                                TextSpan(
                                  text: context.l10n.resend,
                                  style: getTextTheme(context)
                                      .titleSmall!
                                      .copyWith(
                                        fontSize:
                                            responsiveFontSize(context, 12.75),
                                        fontWeight: FontWeight.w500,
                                        color: $constants.palette.appBlue,
                                        decoration: TextDecoration.underline,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      if (widget.phoneNumber.isNotEmpty) {
                                        talker.verbose(
                                          'TapGestureRecognizer(), state.forceResendingToken: ${state.forceResendingToken}',
                                        );
                                        await context
                                            .read<AuthFormCubit>()
                                            .verifyPhone(
                                              widget.phoneNumber,
                                              forceResendingToken:
                                                  state.forceResendingToken,
                                              isResend: true,
                                            );
                                      }
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        // const Spacer(),
                        //*--------------- CONTINUE BUTTON ---------------//
                        Padding(
                          padding: EdgeInsets.only(
                            top: $constants.insets.xl - $constants.insets.xs,
                            bottom: safeBottomPadding + $constants.insets.xxl,
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
                                  size: Size(getSize(context).width, 50),
                                  onPressed: () async {
                                    final currentOtp = otpController.text;
                                    if (currentOtp.length != 6) {
                                      errorController!.add(
                                        ErrorAnimationType.shake,
                                      ); //* Triggering error shake animation}
                                    } else {
                                      focusNode.unfocus();
                                      talker.verbose(
                                        'otpController.value: ${otpController.value}',
                                      );
                                      await context
                                          .read<AuthFormCubit>()
                                          .verifyFbOtp(currentOtp);
                                    }
                                  },
                                  child: Text(
                                    context.l10n.continuee,
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
                      ],
                    );
                  },
                ),
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
    );
  }
}
