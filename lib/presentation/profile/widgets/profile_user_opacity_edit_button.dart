import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

class ProfileUserOpacityEditButton extends StatelessWidget {
  const ProfileUserOpacityEditButton({this.onTap, super.key});
  final Future<void> Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: $constants.palette.black.withOpacity(0.3),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: EdgeInsets.all($constants.insets.xxs + 2),
          child: SvgPicture.asset(
            'assets/profile_edit.svg',
            height: 16,
            width: 16,
          ),
        ),
      ),
    );
  }
}
