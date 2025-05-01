import 'package:flutter/material.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

//TODO: Add SettingsPage
class SettingsControlsWidget extends StatelessWidget {
  const SettingsControlsWidget(this.onFilterPressed, {super.key});
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8 + MediaQuery.of(context).padding.left,
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: FloatingActionButton(
              mini: true,
              heroTag: 'settings',
              onPressed: () {},
              // onPressed: () =>
              //     Navigator.pushNamed(context, SettingsPage.routeName),
              tooltip: context.l10n.settings,
              backgroundColor: $constants.palette.main,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Icon(
                Icons.settings,
                color: $constants.palette.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: FloatingActionButton(
              mini: true,
              heroTag: 'filter',
              onPressed: onFilterPressed,
              tooltip: context.l10n.filterMarkers,
              backgroundColor: $constants.palette.main,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Icon(
                Icons.filter_alt,
                color: $constants.palette.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
