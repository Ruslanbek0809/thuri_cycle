import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/router.gr.dart';

//TODO [optimization]: Add filter dialog
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
              onPressed: () async {
                await context.router.push(const SettingsRoute());
              },
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
