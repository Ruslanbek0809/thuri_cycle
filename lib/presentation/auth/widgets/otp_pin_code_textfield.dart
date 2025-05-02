import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class OtpPinCodeTextField extends StatefulWidget {
  const OtpPinCodeTextField({
    this.otpController,
    this.errorController,
    this.length,
    super.key,
    this.textInputAction,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onCompleted,
    this.onSubmitted,
  });

  final TextEditingController? otpController;
  final StreamController<ErrorAnimationType>? errorController;
  final int? length;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final void Function(String)? onCompleted;
  final void Function(String)? onSubmitted;

  @override
  State<OtpPinCodeTextField> createState() => _OtpPinCodeTextFieldState();
}

class _OtpPinCodeTextFieldState extends State<OtpPinCodeTextField> {
  late Color _textFieldBackgroundColor;

  @override
  void initState() {
    widget.focusNode!.addListener(() {
      onFocusChange(focus: widget.focusNode!.hasFocus);
    });
    super.initState();
  }

  @override
  void dispose() {
    // widget.focusNode!.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _textFieldBackgroundColor =
        getCustomOnPrimaryColor(context).withOpacity(0.05);
    super.didChangeDependencies();
  }

  void onFocusChange({required bool focus}) {
    setState(() {
      _textFieldBackgroundColor = focus
          ? getCustomOnPrimaryColor(context).withOpacity(0.1)
          : getCustomOnPrimaryColor(context).withOpacity(0.05);
    });
  }

  InputDecoration getTextFieldDecoration() {
    return const InputDecoration()
        .applyDefaults(getThemeData(context).inputDecorationTheme)
        .copyWith(
          fillColor: _textFieldBackgroundColor,
          errorMaxLines: 2,
        );
  }

  PinTheme getPinTheme() {
    return PinTheme(
      shape: PinCodeFieldShape.box,
      borderWidth: 1,
      borderRadius: BorderRadius.circular($constants.corners.sm + 1),
      fieldHeight: (getSize(context).width - 100) / 6,
      fieldWidth: (getSize(context).width - 100) / 6,
      activeFillColor: Colors.transparent,
      disabledColor: $constants.palette.mainFade,
      inactiveFillColor: Colors.transparent,
      inactiveColor: $constants.palette.mainFade,
      selectedFillColor: Colors.transparent,
      selectedColor: $constants.palette.mainFade,
      activeColor: $constants.palette.mainFade,
      errorBorderColor: $constants.palette.appRed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      key: widget.key,
      appContext: context,
      controller: widget.otpController,
      length: widget.length ?? 6,
      enableActiveFill: true,
      backgroundColor: Colors.transparent,
      animationType: AnimationType.fade,
      animationDuration: const Duration(milliseconds: 300),
      errorAnimationController: widget.errorController,
      errorTextSpace: 24,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: widget.textInputAction!,
      textStyle: getTextTheme(context).titleMedium!.copyWith(
            fontSize: responsiveFontSize(
              context,
              14.5,
            ),
            fontWeight: FontWeight.w600,
          ),
      cursorColor: $constants.palette.mainFade,
      pinTheme: getPinTheme(),
      pastedTextStyle: getTextTheme(context).titleMedium!.copyWith(
            fontSize: responsiveFontSize(
              context,
              14.5,
            ),
            fontWeight: FontWeight.w600,
          ),
      beforeTextPaste: (text) {
        // logIt.info('Allowing to paste $text');
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      focusNode: widget.focusNode,
      onChanged: widget.onChanged!,
      onTap: widget.onTap,
      onCompleted: widget.onCompleted,
      onSubmitted: widget.onSubmitted,
    );
  }
}
