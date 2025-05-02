import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/app_logo.png',
        height: getSize(context).width / 3,
        width: getSize(context).width / 3,
      ),
    );
  }
}
