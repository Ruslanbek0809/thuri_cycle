import 'package:flutter/material.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

class MarkerTypeAppBarTitle extends StatelessWidget {
  const MarkerTypeAppBarTitle(this.markerType, {super.key});
  final MarkerType markerType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(markerType.getName(context)),
          const SizedBox(width: 12),
          markerType.getThemedIcon(context),
        ],
      ),
    );
  }
}
