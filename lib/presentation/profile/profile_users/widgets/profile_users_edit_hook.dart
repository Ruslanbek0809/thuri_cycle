import 'package:flipgoo_app/presentation/core/utils/constants.dart';
import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileUsersEditHook extends HookWidget {
  const ProfileUsersEditHook({
    required this.text,
    this.hintText,
    this.minLines,
    this.textInputAction = TextInputAction.next,
    this.isDeleteFieldAvailable = false,
    this.onDeleteField,
    this.onChanged,
    this.onSubmitted,
    this.isReadOnly,
    super.key,
  });

  final String text;
  final String? hintText;
  final int? minLines;
  final TextInputAction textInputAction;
  final bool isDeleteFieldAvailable;
  final VoidCallback? onDeleteField;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: text);

    return TextField(
      controller: textController,
      style: getTextTheme(context).titleSmall!.copyWith(
            fontSize: responsiveFontSize(context, 14.5),
            fontWeight: FontWeight.w400,
          ),
      minLines: minLines,
      maxLines: null,
      textInputAction: textInputAction,
      readOnly: isReadOnly ?? false,
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
            suffixIcon: isDeleteFieldAvailable
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
              horizontal: $constants.insets.md,
              vertical: $constants.insets.sm + 4,
            ),
          ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
