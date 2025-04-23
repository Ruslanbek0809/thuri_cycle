import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/report_waste/location/location_cubit.dart';
import 'package:thuri_cycle/l10n/l10n.dart';

class MapControlsWidget extends StatefulWidget {
  const MapControlsWidget({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  State<MapControlsWidget> createState() => _MapControlsWidgetState();
}

class _MapControlsWidgetState extends State<MapControlsWidget>
    with SingleTickerProviderStateMixin<MapControlsWidget> {
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
                heroTag: 'scoreboard',
                onPressed: () {},
                // onPressed: () => Navigator.pushNamed(
                //   context,
                //   ScoreboardPage.routeName,
                //   arguments: position?.toLatLng() ?? widget.mapController.center,
                // ),
                tooltip: context.l10n.scoreboard,
                mini: true,
                child: const Icon(Icons.emoji_events),
              ),
            ),
            AnimatedBuilder(
              animation: repositionAnim,
              builder: (_, child) => ClipRect(
                child: Align(
                  alignment: Alignment.center,
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
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    heroTag: 'reposition',
                    onPressed: widget.onTap,
                    tooltip: context.l10n.goToPosition,
                    mini: true,
                    child: const Icon(Icons.filter_tilt_shift),
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
