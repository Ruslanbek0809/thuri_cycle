import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class ProfileUserInfoNameHook extends HookWidget {
  const ProfileUserInfoNameHook({
    required this.text,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    super.key,
  });
  final String text;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: text);

    useEffect(
      () {
        // Execute onChanged callback when the text changes
        if (onChanged != null) {
          onChanged!(textController.text);
        }
        return null;
      },
      [text],
    ); // Only re-run the effect if text changes

    return TextField(
      controller: textController,
      style: getTextTheme(context).titleMedium!.copyWith(
            fontSize: responsiveFontSize(context, 14.5),
          ),
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration()
          .applyDefaults(getThemeData(context).inputDecorationTheme)
          .copyWith(
            hintText: hintText,
            hintStyle: getTextTheme(context).titleMedium!.copyWith(
                  fontSize: responsiveFontSize(context, 14.5),
                  color: getThemeData(context).hintColor,
                ),
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
