import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class GoogleAppleCard extends StatelessWidget {
  const GoogleAppleCard({
    required this.svgName,
    required this.title,
    this.onTap,
    super.key,
  });

  final String svgName;
  final String title;
  final Future<void> Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular($constants.corners.md + 2),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: $constants.insets.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(svgName, height: 20),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: $constants.insets.xs + 2),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getTextTheme(context).titleSmall!.copyWith(
                          fontSize: responsiveFontSize(context, 12.75),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
