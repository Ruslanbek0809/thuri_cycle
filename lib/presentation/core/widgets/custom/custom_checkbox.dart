import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    this.title,
    this.titleWidget,
    super.key,
  });

  final bool value;
  final void Function(bool?) onChanged;
  final String? title;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: value
              ? $constants.palette.main
              : getThemeData(context).canvasColor,
        ),
        borderRadius: BorderRadius.circular(
          $constants.corners.md + 2,
        ),
        color: value
            ? const Color(0x0F2688EB)
            : getThemeData(context).inputDecorationTheme.fillColor,
      ),
      child: Theme(
        data: ThemeData(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: CheckboxListTile(
          title: titleWidget ?? Text(
            title ?? '',
            style: getTextTheme(context).titleMedium!.copyWith(
                  fontSize: responsiveFontSize(
                    context,
                    14.5,
                  ),
                ),
          ),
          // side: BorderSide.none,
          value: value,
          activeColor: $constants.palette.main,
          checkColor: $constants.palette.white,
          dense: true,
          contentPadding: EdgeInsets.fromLTRB(
            $constants.insets.sm,
            $constants.insets.xxs - 2,
            $constants.insets.xxs,
            $constants.insets.xxs - 2,
          ),
          side: BorderSide(
            color: getThemeData(context).canvasColor,
          ),
          checkboxShape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            side: BorderSide(
              color: getThemeData(context).canvasColor,
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
