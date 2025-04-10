import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomInfoEditWithLabelHook extends HookWidget {
  const CustomInfoEditWithLabelHook({
    required this.text,
    this.labelText,
    this.minLines,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    super.key,
  });

  final String text;
  final String? labelText;
  final int? minLines;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

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
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator ??
              (value) {
                return;
              },
          decoration: const InputDecoration()
              .applyDefaults(getThemeData(context).inputDecorationTheme)
              .copyWith(
                hintText: labelText ?? '',
                hintStyle: getTextTheme(context).titleMedium!.copyWith(
                      fontSize: responsiveFontSize(
                        context,
                        14.5,
                      ),
                      color: getThemeData(context).hintColor,
                    ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.sm,
                  vertical: $constants.insets.xs + 4,
                ),
              ),
          onChanged: onChanged,
          // onSubmitted: onSubmitted,
        ),
      ],
    );
  }
}
