import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class LoginPhoneTextField extends StatefulWidget {
  const LoginPhoneTextField({
    super.key,
    this.phoneController,
    this.inputFormatters,
    this.hintText = '',
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
  });

  final PhoneController? phoneController;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final FocusNode? focusNode;
  final void Function(PhoneNumber?)? onChanged;
  final dynamic Function(PhoneNumber)? onSubmitted;

  @override
  State<LoginPhoneTextField> createState() => _LoginPhoneTextFieldState();
}

class _LoginPhoneTextFieldState extends State<LoginPhoneTextField> {
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
    super.didChangeDependencies();
  }

  void onFocusChange({required bool focus}) {
    setState(() {});
  }

  InputDecoration getTextFieldDecoration() {
    return const InputDecoration()
        .applyDefaults(getThemeData(context).inputDecorationTheme)
        .copyWith(
          hintText: widget.hintText,
          hintStyle: getTextTheme(context).titleMedium!.copyWith(
                fontSize: responsiveFontSize(
                  context,
                  14.5,
                ),
                color: getThemeData(context).hintColor,
              ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm,
            vertical: $constants.insets.sm + 2,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      key: widget.key,
      controller: widget.phoneController,
      countrySelectorNavigator: CountrySelectorNavigator.dialog(
        width: getSize(context).width - $constants.insets.offset,
        height: getSize(context).height - (getSize(context).height * 0.25),
        searchBoxTextStyle: const TextStyle(fontSize: 14.5),
        countries: [
          IsoCode.DE,
        ],
      ),
      inputFormatters: widget.inputFormatters,
      autofillHints: const [AutofillHints.telephoneNumber],
      countryButtonStyle: CountryButtonStyle(
        flagSize: 24,
        textStyle: getTextTheme(context).titleMedium!.copyWith(
              fontSize: responsiveFontSize(context, 14.5),
              color: getThemeData(context).hintColor,
            ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: TextInputAction.done,
      style: getTextTheme(context).titleMedium!.copyWith(
            fontSize: responsiveFontSize(context, 14.5),
          ),
      decoration: getTextFieldDecoration(),
      validator: PhoneValidator.compose([
        PhoneValidator.required(context, errorText: context.l10n.required),
        PhoneValidator.validMobile(
          context,
          errorText: context.l10n.invalidPhoneNumber,
        ),
      ]),
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
    );
  }
}
