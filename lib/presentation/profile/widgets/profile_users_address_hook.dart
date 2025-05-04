import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class ProfileUsersAddressHook extends HookWidget {
  const ProfileUsersAddressHook({
    required this.text,
    this.hintText,
    this.minLines,
    this.onDeleteField,
    this.onChanged,
    // this.onSubmitted,
    this.validator,
    super.key,
  });
  final String text;
  final String? hintText;
  final int? minLines;
  final VoidCallback? onDeleteField;
  final void Function(String)? onChanged;
  // final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: text);

    //* Effect to reset textController when state.addProductModel.price is empty or null
    useEffect(
      () {
        //* Cleanup function
        if (text.isEmpty) {
          textController.clear();
        } else {
          textController.text = text;
        }
        //* Specify the dependencies that trigger this effect
        return () {};
      },
      [text],
    );

    return TextFormField(
      controller: textController,
      style: getTextTheme(context).titleSmall!.copyWith(
            fontSize: responsiveFontSize(context, 14.5),
            fontWeight: FontWeight.w400,
          ),
      minLines: minLines,
      maxLines: null,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator ??
          (value) {
            return;
          },
      decoration: const InputDecoration()
          .applyDefaults(getThemeData(context).inputDecorationTheme)
          .copyWith(
            hintText: hintText ?? '',
            hintStyle: getTextTheme(context).titleMedium!.copyWith(
                  fontSize: responsiveFontSize(
                    context,
                    14.5,
                  ),
                  color: getThemeData(context).hintColor,
                ),
            suffixIcon: textController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      onDeleteField!();
                    },
                    icon: Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: getThemeData(context).canvasColor,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
              vertical: $constants.insets.xs + 2,
            ),
          ),
      onChanged: onChanged,
      // onSubmitted: onSubmitted,
    );
  }
}
