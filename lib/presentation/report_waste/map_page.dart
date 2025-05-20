import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thuri_cycle/application/report_waste/location/location_cubit.dart';
import 'package:thuri_cycle/application/report_waste/map_marker_form_cubit.dart';
import 'package:thuri_cycle/domain/report_waste/location_info.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/bottom_controls_widget.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/fast_markers_layer.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/map_controls_scoreboard_widget.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/settings_controls_widget.dart';
import 'package:thuri_cycle/router.gr.dart';

//TODO: Look for changes from old project for this page and apply any needed features from it if needed
@RoutePage()
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

// const LatLng defaultInitialCoordinates = LatLng(50.6844, 10.9255);
// const double defaultInitialZoom = 16;

class _MapPageState extends State<MapPage> with WidgetsBindingObserver {
  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    context.read<LocationCubit>().initialize();
    context.read<MapMarkerFormCubit>()
      ..initInitPositionAndGetMarkersFromFB()
      ..connectToMapStream(mapController.mapEventStream);
    // context.read<MapMarkerFormCubit>().initFcmToken();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      await context.read<MapMarkerFormCubit>().saveCurrentMapPosition(
            mapController.camera.center,
            mapController.camera.zoom,
          );
    }
  }

  @override
  Future<bool> didPopRoute() async {
    await context.read<MapMarkerFormCubit>().saveCurrentMapPosition(
          mapController.camera.center,
          mapController.camera.zoom,
        );
    return super.didPopRoute();
  }

  @override
  Widget build(BuildContext context) {
    // Uncomment to test the rendering performance with lots of markers
    /*markers = <MapMarker>[];
    for (int i = 0; i < 100; ++i) {
      for (int j = 0; j < 100; ++j) {
        markers.add(MapMarker(
          0,
          45.7555 + .0009 * i,
          11.0033 + .0009 * j,
          MarkerType.values[(i+j) % MarkerType.values.length],
          DateTime(2023),
          DateTime(2023),
          0,
          0,
        ));
      }
    }*/

    return Scaffold(
      body: BlocBuilder<MapMarkerFormCubit, MapMarkerFormState>(
        builder: (context, state) {
          return FlutterMap(
            mapController: mapController,
            options: MapOptions(
              interactionOptions: const InteractionOptions(
                flags:
                    (InteractiveFlag.all | InteractiveFlag.doubleTapDragZoom) &
                        ~InteractiveFlag.rotate,
              ),
              initialCenter: state.initialLatLng,
              initialZoom: state.initialZoom,
              // OSM supports at most the zoom value 19
              maxZoom: 18.45,
              onTap: (tapPosition, tapLatLng) async {
                final minMarker = context
                    .read<MapMarkerFormCubit>()
                    .getClosestMarker(tapLatLng);
                if (minMarker == null) {
                  return;
                }

                final markerScale =
                    markerScaleFromMapZoom(mapController.camera.zoom);
                final screenPoint =
                    mapController.camera.latLngToScreenOffset(minMarker.latLng);
                final dx = (tapPosition.global.dx - screenPoint.dx).abs();
                final dy = (tapPosition.global.dy - screenPoint.dy)
                    .abs(); //TODO: Check changes here in this file 1 more time
                if (max(dx, dy) < markerScale * 0.7) {
                  await context.router.push(
                    SingleMarkerRoute(
                      mapMarker: minMarker,
                      onResolveButtonPressed: (newMapMarkerModel) async {
                        if (context.mounted) {
                          context
                              .read<MapMarkerFormCubit>()
                              .addOrReplaceMarker(newMapMarkerModel);
                        }
                      },
                    ),
                  );
                  // openMarkerPage(minMarker);
                }
              },
            ),
            children: [
              //*----------------- Part of flutter_map package ---------------------//
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              //TODO [optimization]: Fix very first time not loading error
              //TODO [optimization]: Reimplement listener part here commented
              //TODO [optimization]: Optimize getCurrentOrLastKnownLocationInfo usage and its initial latLong assignment (also checkout saveCurrentMapPosition in MapControlsAndScoreboardWidget)
              //TODO [optimization]: Add more features of LocationProvider
              //*----------------- CURRENT LOCATION ---------------------//
              BlocBuilder<LocationCubit, LocationState>(
                // listenWhen: (prev, curr) => prev != curr,
                // listener: (context, locationState) {
                //   if (state.isNewInitialPositionLocked) {
                //     locationState.maybeWhen(
                //       success: (_) {
                //         context
                //             .read<MapMarkerFormCubit>()
                //             .initInitPositionAndGetMarkersFromFB(
                //               isNewSaveNewMapPosition: true,
                //               center: mapController.camera.center,
                //               zoom: mapController.camera.zoom,
                //             );
                //         context
                //             .read<MapMarkerFormCubit>()
                //             .setIsNewInitialPositionLockedToTrue();
                //       },
                //       orElse: () => talker
                //           .verbose('MapPage BlocConsumer LocationCubit ERROR'),
                //     );
                //   }
                // },
                builder: (context, state) {
                  return BlocBuilder<LocationCubit, LocationState>(
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: Container.new,
                        success: (locationInfoModel) {
                          final latLng = locationInfoModel.latLng;
                          if (latLng == null) {
                            return Container();
                          }
                          return MarkerLayer(
                            markers: [
                              Marker(
                                rotate: true,
                                point: latLng,
                                child: SvgPicture.asset(
                                  'assets/current_location1.svg',
                                ),
                                // Icon(
                                //   Icons.my_location,
                                //   size: getTabletType() ? 52 : 26,
                                //   color: Theme.of(context).primaryColor,
                                // ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
              //*----------------- Lays out markers on the map ---------------------//
              FastMarkersLayer(
                context.read<MapMarkerFormCubit>().visibleMarkers,
              ),
              //*----------------- RECOGNITION TEXT ---------------------//
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  ' © OpenStreetMap contributors',
                  style: TextStyle(
                    color: Color.fromARGB(255, 127, 127, 127),
                  ), // theme-independent grey
                ),
              ),
              //*----------------- MAP CONTROLS & SCOREBOARD ---------------------//
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  final locationInfoModel = state.maybeWhen(
                    success: (locationInfoModel) => locationInfoModel,
                    orElse: () => null,
                  );

                  return Align(
                    alignment: Alignment.topRight,
                    child: MapControlsAndScoreboardWidget(
                      onTap: () async {
                        if (locationInfoModel != null &&
                            locationInfoModel.position != null) {
                          mapController.move(
                            locationInfoModel.latLng!,
                            $constants.defaultInitialZoom,
                          );
                          await context
                              .read<MapMarkerFormCubit>()
                              .saveCurrentMapPosition(
                                mapController.camera.center,
                                mapController.camera.zoom,
                              );
                        }
                      },
                    ),
                  );
                },
              ),
              //*----------------- SETTINGS CONTROLS ---------------------//
              Align(
                alignment: Alignment.topLeft,
                child: SettingsControlsWidget(
                  () {
                    scaffoldMessengerKey.currentState
                      ?..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBarHelper.createInformation(
                          message: context.l10n.comingInNextUpdate,
                        ),
                      );
                  },
                  // () => mapMarkerProvider.openMarkerFiltersDialog(
                  //   context,
                  //   mapController.camera.center,
                  // ),
                ),
              ),
              //TODO: initStateFeatures??
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomControlsWidget(
                  onAddWidgetPressed: () async {
                    final mapMarkerModel =
                        await context.router.push<MapMarkerModel?>(
                      const ReportRoute(),
                    );
                    if (mapMarkerModel != null) {
                      if (context.mounted) {
                        context
                            .read<MapMarkerFormCubit>()
                            .addOrReplaceMarker(mapMarkerModel);

                        scaffoldMessengerKey.currentState
                          ?..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBarHelper.createSuccess(
                              message: context.l10n.reportedSuccessfully,
                            ),
                          );
                      }
                    }
                  },
                ),
              ),
              // Random quotes or motivational sentences in the middle
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: PillWidget(),
              // ),
              // const Align(
              //   alignment: Alignment.bottomLeft,
              //   child: AdditionalPointsWidget(),
              // ),
            ],
          );
        },
      ),
    );
  }

  // void openMarkerPage(MapMarker m, [String? errorAddingImages]) {
  //   Navigator.pushNamed(
  //     context,
  //     MarkerPage.routeName,
  //     arguments: MarkerPageArgs(m, errorAddingImages),
  //   ).then((value) {
  //     if (value is MapMarker) {
  //       // The marker may have been resolved, or its data might have changed, so update it
  //       setState(
  //         () => context.read<MapMarkerFormCubit>().addOrReplaceMarker(value),
  //       );
  //     }
  //   });
  // }

  // void openReportPage() {
  //   Navigator.pushNamed(context, ReportPage.routeName).then((value) {
  //     if (value is ReportedResult) {
  //       setState(
  //         () => context
  //             .read<MapMarkerFormCubit>()
  //             .addOrReplaceMarker(value.newMapMarker),
  //       );
  //       openMarkerPage(value.newMapMarker, value.errorAddingImages);
  //     }
  //   });
  // }
}
