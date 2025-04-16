import 'dart:async';

import 'package:flipgoo_app/application/auth/profile_user_form/profile_user_form_cubit.dart';
import 'package:flipgoo_app/l10n/l10n.dart';
import 'package:flipgoo_app/presentation/auth/widgets/otp_pin_code_textfield.dart';
import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/aliases.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_bar_for_bottom_sheet.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_elevated_gradient_button.dart';
import 'package:flipgoo_app/presentation/core/widgets/custom/custom_loading_indicator.dart';
import 'package:flipgoo_app/presentation/core/widgets/keyboard_dismisser.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ProfileUsersPhoneVerifyModalBottomSheet extends StatefulWidget {
  const ProfileUsersPhoneVerifyModalBottomSheet({
    this.phoneNumber = '',
    this.profileUserType = ProfileUserType.user,
    this.onResendPressed,
    super.key,
  });

  final String phoneNumber;
  final ProfileUserType profileUserType;
  final Future<void> Function()? onResendPressed;

  @override
  State<ProfileUsersPhoneVerifyModalBottomSheet> createState() =>
      _ProfileUsersPhoneVerifyModalBottomSheetState();
}

class _ProfileUsersPhoneVerifyModalBottomSheetState
    extends State<ProfileUsersPhoneVerifyModalBottomSheet> {
  String get phoneNumber => widget.phoneNumber;

  ProfileUserType get profileUserType => widget.profileUserType;

  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileUserFormCubit, ProfileUserFormState>(
      listenWhen: (previous, current) =>
          previous.verifyPhoneNumberSuccessOrFailure !=
          current.verifyPhoneNumberSuccessOrFailure,
      listener: (context, state) {
        state.verifyPhoneNumberSuccessOrFailure.fold(
          () => null,
          (a) => a.fold(
            (alert) {
              scaffoldMessengerKey.currentState?..hideCurrentSnackBar()..showSnackBar(
                SnackBarHelper.createError(
                  message: alert.message,
                ),
              );
            },
            (r) async {
              await context
                  .read<ProfileUserFormCubit>()
                  .updateProfileUsersNewVerificationPhones(
                    r,
                    profileUserType,
                  );
              if (context.mounted) {
                Navigator.pop(context);
                scaffoldMessengerKey.currentState?..hideCurrentSnackBar()..showSnackBar(
                  SnackBarHelper.createSuccess(
                    message: context.l10n.phoneNumberVerifiedSuccess,
                  ),
                );
              }
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: getThemeData(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular($constants.corners.md * 2 + 4),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
        child: KeyboardDismisserWidget(
          child: SingleChildScrollView(
            controller: ModalScrollController.of(
              context,
            ), //* Syncs the scroll with the modal's drag
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, //* RENDERS exact height of all its children elements.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //*-------------- CUSTOM BAR for BOTTOM SHEET -------------- //
                const CustomBarForBottomSheet(),
                //*--------------- CONFIRM TEXT ---------------//
                Padding(
                  padding: EdgeInsets.only(bottom: $constants.insets.sm),
                  child: Text(
                    context.l10n.verification,
                    style: getTextTheme(context).titleLarge!.copyWith(
                          fontSize: responsiveFontSize(context, 25.5),
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: $constants.insets.lg + $constants.insets.xs,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: getTextTheme(context).titleMedium!.copyWith(
                            fontSize: responsiveFontSize(
                              context,
                              14.5,
                            ),
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${context.l10n.typeCodeSentTo} ',
                        ),
                        TextSpan(
                          text: phoneNumber,
                          style: getTextTheme(context).titleMedium!.copyWith(
                                fontSize: responsiveFontSize(context, 14.5),
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
                    onChanged: (value) {
                      // logIt.info
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: $constants.insets.lg),
                  child: RichText(
                    text: TextSpan(
                      style: getTextTheme(context).titleSmall!.copyWith(
                            fontSize: responsiveFontSize(context, 12.75),
                          ),
                      children: <TextSpan>[
                        TextSpan(text: '${context.l10n.didntGetCode} '),
                        TextSpan(
                          text: context.l10n.resend,
                          style: getTextTheme(context).titleSmall!.copyWith(
                                fontSize: responsiveFontSize(context, 12.75),
                                fontWeight: FontWeight.w500,
                                color: $constants.palette.appBlue,
                                decoration: TextDecoration.underline,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await widget.onResendPressed!();
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                //*--------------- CONTINUE BUTTON ---------------//
                BlocBuilder<ProfileUserFormCubit, ProfileUserFormState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: $constants.insets.lg + $constants.insets.xs,
                        bottom: $constants.insets.lg,
                      ),
                      child: state.isPhoneVerifying ||
                              state.isGettingPhoneVerificationCode
                          ? Center(
                              child: CustomLoadingIndicator(
                                isSizedBox: true,
                                height: 56,
                                width: 56,
                                color: $constants.palette.main,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: $constants.insets.lg + 2,
                              ),
                              child: CustomElevatedGradientButton(
                                onPressed: () async {
                                  final currentOtp = otpController.text;
                                  if (currentOtp.length != 6) {
                                    errorController!.add(
                                      ErrorAnimationType.shake,
                                    ); //* Triggering error shake animation}
                                  } else {
                                    focusNode.unfocus();
                                    logIt.verbose(
                                      'otpController.value: ${otpController.value}',
                                    );

                                    await context
                                        .read<ProfileUserFormCubit>()
                                        .verifyPhoneNumberWithCode(
                                          otpController.value.text,
                                          profileUserType,
                                        );
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
