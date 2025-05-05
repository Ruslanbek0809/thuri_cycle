import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/application/report_waste/location/location_cubit.dart';
import 'package:thuri_cycle/domain/report_waste/location_info.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/router.gr.dart';

class MapControlsAndScoreboardWidget extends StatefulWidget {
  const MapControlsAndScoreboardWidget({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  State<MapControlsAndScoreboardWidget> createState() => _MapControlsAndScoreboardWidgetState();
}

class _MapControlsAndScoreboardWidgetState extends State<MapControlsAndScoreboardWidget>
    with SingleTickerProviderStateMixin<MapControlsAndScoreboardWidget> {
  static const Duration repositionAnimDuration = Duration(milliseconds: 200);
  late final AnimationController repositionAnim;

  @override
  void initState() {
    super.initState();
    repositionAnim = AnimationController(
      vsync: this,
      duration: repositionAnimDuration,
    );
  }

  @override
  void dispose() {
    repositionAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final locationState = context.watch<LocationCubit>().state;
    LocationInfoModel? locationInfo;

    locationState.maybeWhen(
      success: (info) => locationInfo = info,
      orElse: () => null,
    );

    return BlocListener<LocationCubit, LocationState>(
      listenWhen: (prev, curr) => prev != curr,
      listener: (context, state) {
        state.maybeWhen(
          success: (_) => repositionAnim.forward(),
          orElse: () => repositionAnim.reverse(),
        );
      },
      child: Padding(
        // the right padding is handled by children to allow the AnimatedBuilder shadow to expand
        padding: EdgeInsets.only(top: mediaQuery.padding.top),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 8,
                top: 8,
                right: 8 + mediaQuery.padding.right,
              ),
              child: FloatingActionButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                mini: true,
                onPressed: () async {
                  await context.router.push(
                    ScoreboardRoute(
                      mapCenter: locationInfo?.latLng ??
                          const LatLng(50.6844, 10.9255),
                    ),
                  );
                },
                // onPressed: () => Navigator.pushNamed(
                //   context,
                //   ScoreboardPage.routeName,
                //   arguments: position?.toLatLng() ?? widget.mapController.center,
                // ),
                heroTag: 'scoreboard',
                tooltip: context.l10n.scoreboard,
                backgroundColor: $constants.palette.main,
                child: Icon(
                  Icons.emoji_events,
                  color: $constants.palette.white,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: repositionAnim,
              builder: (_, child) => ClipRect(
                child: Align(
                  heightFactor: repositionAnim.value,
                  widthFactor: repositionAnim.value,
                  child: child,
                ),
              ),
              child: ScaleTransition(
                scale: repositionAnim,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    top: 8,
                    right: 8 + mediaQuery.padding.right,
                    bottom: 16,
                  ),
                  child: FloatingActionButton(
                    mini: true,
                    heroTag: 'reposition',
                    onPressed: widget.onTap,
                    tooltip: context.l10n.goToPosition,
                    backgroundColor: $constants.palette.main,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Icon(
                      Icons.filter_tilt_shift,
                      color: $constants.palette.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
