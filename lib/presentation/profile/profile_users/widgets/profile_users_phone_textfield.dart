import 'package:flipgoo_app/l10n/l10n.dart';
import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_form_field/phone_form_field.dart';

class ProfileUsersPhoneTextField extends StatefulWidget {
  const ProfileUsersPhoneTextField({
    super.key,
    this.phoneController,
    this.defaultCountryIsoCode,
    this.filteredCountryIsoCodes,
    this.inputFormatters,
    this.textInputAction,
    this.hintText = '',
    this.isDeleteFieldAvailable = false,
    this.contentPadding,
    this.onDeleteField,
    this.onChanged,
    this.onSubmitted,
  });

  final PhoneController? phoneController;
  final IsoCode? defaultCountryIsoCode;
  final List<IsoCode>? filteredCountryIsoCodes;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String hintText;
  final bool isDeleteFieldAvailable;
  final EdgeInsets? contentPadding;
  final VoidCallback? onDeleteField;
  final void Function(PhoneNumber?)? onChanged;
  final dynamic Function(PhoneNumber)? onSubmitted;

  @override
  State<ProfileUsersPhoneTextField> createState() =>
      _ProfileUsersPhoneTextFieldState();
}

class _ProfileUsersPhoneTextFieldState
    extends State<ProfileUsersPhoneTextField> {
  PhoneController? get phoneController => widget.phoneController;

  IsoCode? get isoCode => widget.defaultCountryIsoCode;

  List<IsoCode>? get filteredCountryIsoCodes => widget.filteredCountryIsoCodes;

  bool get isDeleteFieldAvailable => widget.isDeleteFieldAvailable;

  EdgeInsets? get contentPadding => widget.contentPadding;

  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.addListener(() {
      onFocusChange(focus: focusNode.hasFocus);
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
          suffixIcon: isDeleteFieldAvailable
              ? IconButton(
                  onPressed: () {
                    widget.onDeleteField!();
                  },
                  icon: Icon(
                    CupertinoIcons.clear_circled_solid,
                    color: getThemeData(context).canvasColor,
                  ),
                )
              : null,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                horizontal: $constants.insets.sm,
                vertical: $constants.insets.xs + 2,
              ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      key: widget.key,
      controller: phoneController,
      countrySelectorNavigator: CountrySelectorNavigator.dialog(
        width: getSize(context).width - $constants.insets.offset,
        height: getSize(context).height - (getSize(context).height * 0.25),
        countries: filteredCountryIsoCodes,
        searchBoxTextStyle: const TextStyle(
          fontSize: 14.5,
        ),
        // countries: [
        //   IsoCode.GB,
        //   IsoCode.PL,
        //   IsoCode.DE,
        //   IsoCode.IT,
        //   IsoCode.ES,
        //   IsoCode.SK,
        //   IsoCode.NL,
        //   IsoCode.TM,
        // ],
      ),
      inputFormatters: widget.inputFormatters,
      autofillHints: const [AutofillHints.telephoneNumber],
      countryButtonStyle: CountryButtonStyle(
        flagSize: 24,
        textStyle: getTextTheme(context).titleMedium!.copyWith(
              fontSize: responsiveFontSize(
                context,
                14.5,
              ),
              color: getThemeData(context).hintColor,
            ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: widget.textInputAction,
      style: getTextTheme(context).titleMedium!.copyWith(
            fontSize: responsiveFontSize(context, 14.5),
            fontWeight: FontWeight.w400,
          ),
      decoration: getTextFieldDecoration(),
      validator: PhoneValidator.compose([
        PhoneValidator.required(
          context,
          errorText: context.l10n.required,
        ),
        PhoneValidator.validMobile(
          context,
          errorText: context.l10n.invalidPhoneNumber,
        ),
      ]),
      focusNode: focusNode,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
    );
  }
}
