import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileUsersEditWithLabelHook extends HookWidget {
  const ProfileUsersEditWithLabelHook({
    required this.text,
    this.labelText,
    this.hintText,
    this.minLines,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.validator,
    this.isReadOnly,
    super.key,
  });

  final String text;
  final String? labelText;
  final String? hintText;
  final int? minLines;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: text);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //*------------------ ITEM LABEL ---------------------//
        Padding(
          padding: EdgeInsets.only(bottom: $constants.insets.xs),
          child: Text(
            labelText ?? '',
            style: getTextTheme(context).titleMedium!.copyWith(
                  fontSize: responsiveFontSize(
                    context,
                    14.5,
                  ),
                ),
          ),
        ),
        //*------------------ ITEM TEXTFIELD ---------------------//
        TextFormField(
          controller: textController,
          style: getTextTheme(context).titleSmall!.copyWith(
                fontSize: responsiveFontSize(context, 14.5),
                fontWeight: FontWeight.w400,
              ),
          minLines: minLines,
          maxLines: null,
          textInputAction: textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator ??
              (value) {
                return;
              },
          readOnly: isReadOnly ?? false,
          decoration: const InputDecoration()
              .applyDefaults(getThemeData(context).inputDecorationTheme)
              .copyWith(
                hintText: hintText ?? labelText ?? '',
                hintStyle: getTextTheme(context).titleMedium!.copyWith(
                      fontSize: responsiveFontSize(
                        context,
                        14.5,
                      ),
                      color: getThemeData(context).hintColor,
                    ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.sm,
                  vertical: $constants.insets.xs + 2,
                ),
              ),
          onChanged: onChanged,
          // onSubmitted: onSubmitted,
        ),
      ],
    );
  }
}
