import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
import 'package:thuri_cycle/application/auth/profile_user_form/profile_user_form_cubit.dart';
import 'package:thuri_cycle/application/report_waste/location/location_cubit.dart';
import 'package:thuri_cycle/application/report_waste/single_marker_form_cubit/single_marker_form_cubit.dart';
import 'package:thuri_cycle/domain/report_waste/location_info.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/marker_photos_list_widget.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/marker_type_app_bar_title.dart';
import 'package:thuri_cycle/router.gr.dart';

//TODO [optimization]: Work on canBeReported
//TODO [optimization]: Work on openReportAsInappropriateDialog
//TODO [optimization]: Work on verification. Opinion: No, don’t delete after verification. Keep the marker for historical tracking and community trust.
@RoutePage()
class SingleMarkerPage extends StatefulWidget {
  const SingleMarkerPage({
    required this.mapMarker,
    required this.onResolveButtonPressed,
    super.key,
  });
  final MapMarkerModel mapMarker;
  final void Function(MapMarkerModel) onResolveButtonPressed;

  @override
  State<SingleMarkerPage> createState() => _SingleMarkerPageState();
}

// class MarkerPageArgs {
//   MarkerPageArgs(this.mapMarker, this.errorAddingImages);
//   final MapMarkerModel mapMarker;
//   final String? errorAddingImages;
// }

class _SingleMarkerPageState extends State<SingleMarkerPage> {
  late MapMarkerModel _mapMarker;

  String? markerError;
  String? resolveError;
  String? reportAsInappropriateError;

  @override
  void initState() {
    super.initState();

    _mapMarker = widget.mapMarker;
    // reload();
  }

  // void reload() {
  //   final backend = get<Backend>();
  //   backend.getMarker(widget.mapMarker.id).then(
  //         (value) => setState(() => marker = value),
  //         onError: (e) => markerError = e.toString(),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final authBlocState = context.watch<AuthBloc>().state;
    final locationState = context.watch<LocationCubit>().state;
    LocationInfoModel? locationInfo;

    locationState.maybeWhen(
      success: (info) => locationInfo = info,
      orElse: () => null,
    );

    final nearEnoughToResolve =
        locationInfo?.position?.map(_mapMarker.isNearEnoughToResolve) ?? false;

    return BlocProvider(
      create: (_) => getIt<SingleMarkerFormCubit>()
        ..getUserModelByID(_mapMarker.reportedBy, isReportedByUser: true)
        ..getUserModelByID(_mapMarker.resolvedBy),
      child: Scaffold(
        appBar: AppBar(
          title: MarkerTypeAppBarTitle(_mapMarker.markerType),
          actions:
              // isLoggedIn && (singleMarkerModel.canBeReported ?? false)
              //     ?
              [
            IconButton(
              onPressed: () {
                scaffoldMessengerKey.currentState
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBarHelper.createInformation(
                      message: context.l10n.comingInNextUpdate,
                    ),
                  );
              },
              // onPressed: openReportAsInappropriateDialog,
              icon: const Icon(Icons.report),
              tooltip: context.l10n.reportAsInappropriate,
            ),
          ],
          // : null,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //*----------------- Map marker images ---------------------//
                if (_mapMarker.images.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(bottom: $constants.insets.xs),
                    child: MarkerPhotoListWidget(imageUrls: _mapMarker.images),
                  ),
                // MarkerPhotoListWidget(
                //   singleMarkerModel.marker.images,
                //   singleMarkerModel.marker.images.map(
                //     (image) => imageFromNetwork(
                //         imageId: image, height: AddImagesWidget.imageHeight),
                //   ),
                // ),
                // ErrorText(markerError, l10n.errorLoading),
                // ErrorText(
                //   widget.errorAddingImages,
                //   l10n.errorUploadingReportImages,
                //   topPadding: $constants.insets.sm,
                // ),
                // ErrorText(
                //   resolveError,
                //   l10n.errorUploadingResolveImages,
                //   topPadding: $constants.insets.sm,
                // ),
                // ErrorText(
                //   reportAsInappropriateError,
                //   l10n.errorReportingAsInappropriate,
                //   topPadding: $constants.insets.sm,
                // ),

                //*----------------- Awaiting Verification ---------------------//
                // if (_mapMarker.resolutionDate != null
                //     //  && !_mapMarker.isVerified
                //     )
                //   Padding(
                //     padding: EdgeInsets.symmetric(
                //       horizontal: $constants.insets.sm,
                //       vertical: $constants.insets.sm - 4,
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(
                //           MdiIcons.clockAlertOutline,
                //           color: Colors.orange,
                //         ),
                //         SizedBox(width: $constants.insets.xs),
                //         Expanded(
                //           child: Text(
                //             context.l10n.resolutionPendingVerification,
                //             style: theme.textTheme.bodyMedium?.copyWith(
                //               color: Colors.orange[800],
                //               fontWeight: FontWeight.w600,
                //             ),
                //             textAlign: TextAlign.center,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),

                if (_mapMarker.resolutionDate != null
                    // && !_mapMarker.isVerified
                    )
                  Card(
                    color: Colors.orange.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        $constants.corners.md + 2,
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(
                      $constants.insets.sm,
                      $constants.insets.sm + 4,
                      $constants.insets.sm,
                      $constants.insets.sm,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all($constants.insets.sm - 4),
                      child: Row(
                        children: [
                          Icon(
                            MdiIcons.clockAlertOutline,
                            color: Colors.orange,
                          ),
                          SizedBox(width: $constants.insets.sm - 4),
                          Expanded(
                            child: Text(
                              context.l10n.resolutionPendingVerification,
                              style: getTextTheme(context).titleSmall!.copyWith(
                                    fontSize:
                                        responsiveFontSize(context, 12.75),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange[800],
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                //*----------------- Resolved no show || Login to resolve || Get closer to resolve ---------------------//
                if (_mapMarker.resolutionDate != null)
                  const SizedBox()
                else if (authBlocState == const AuthState.unauthenticated())
                  Padding(
                    padding: EdgeInsets.only(bottom: $constants.insets.xs),
                    child: Text(
                      context.l10n.loginToResolve,
                      textAlign: TextAlign.center,
                    ),
                  )
                else if (!nearEnoughToResolve)
                  Padding(
                    padding: EdgeInsets.only(bottom: $constants.insets.xs),
                    child: Text(
                      context.l10n.getCloserToResolve,
                      textAlign: TextAlign.center,
                    ),
                  ),
                //*----------------- RESOLVE BUTTON ---------------------//
                BlocBuilder<ProfileUserFormCubit, ProfileUserFormState>(
                  buildWhen: (previous, current) =>
                      previous.userModel != current.userModel,
                  builder: (context, state) {
                    // final currentUser = state.userModel;
                    // final isReportedByCurrentUser =
                    //     mapMarker.reportedBy == currentUser.uid;

                    return
                        // isReportedByCurrentUser
                        //     ? const SizedBox.shrink()
                        //     :
                        ElevatedButton(
                      onPressed: (_mapMarker.resolutionDate == null &&
                              authBlocState ==
                                  const AuthState.authenticated() &&
                              nearEnoughToResolve)
                          ? () async {
                              final newMapMarker =
                                  await context.router.push<MapMarkerModel?>(
                                ResolveRoute(mapMarker: _mapMarker),
                              );
                              if (newMapMarker != null && context.mounted) {
                                //TODO [optimizations]: Handle this better w/o using setState
                                setState(() {
                                  _mapMarker = newMapMarker;
                                });

                                widget.onResolveButtonPressed(newMapMarker);
                                if (context.mounted) {
                                  scaffoldMessengerKey.currentState
                                    ?..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBarHelper.createSuccess(
                                        message:
                                            context.l10n.resolvedSuccessfully,
                                        duration: const Duration(seconds: 4),
                                      ),
                                    );
                                }
                                await context
                                    .read<SingleMarkerFormCubit>()
                                    .getUserModelByID(_mapMarker.resolvedBy);
                              }
                            }
                          // ? openResolvePage
                          : null,
                      child: Text(
                        _mapMarker.resolutionDate == null
                            ? context.l10n.resolve
                            : context.l10n.alreadyResolved,
                      ),
                    );
                  },
                ),
                //*----------------- Provides helpful info ---------------------//
                if (_mapMarker.resolutionDate == null)
                  Padding(
                    padding: EdgeInsets.only(
                      top: $constants.insets.xs,
                      left: $constants.insets.sm,
                      right: $constants.insets.sm,
                    ),
                    child: Text(
                      context.l10n.usePpe,
                      style: theme.textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(height: $constants.insets.xs),
                //*----------------- ReportedByUser & ResolvedByUser ---------------------//
                BlocBuilder<SingleMarkerFormCubit, SingleMarkerFormState>(
                  buildWhen: (p, c) => p != c,
                  builder: (context, state) {
                    final reportedByUserModel = state.reportedByUser;
                    final resolvedByUserModel = state.resolvedByUser;
                    return state.isLoading
                        ? const CircularProgressIndicator()
                        : OverflowBar(
                            overflowAlignment: OverflowBarAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  scaffoldMessengerKey.currentState
                                    ?..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBarHelper.createInformation(
                                        message:
                                            context.l10n.comingInNextUpdate,
                                      ),
                                    );
                                },
                                //TODO [optimizations]: Implement this user page later
                                // onPressed: () => Navigator.pushNamed(
                                //   context,
                                //   UserPage.routeName,
                                //   arguments: mapMarker.reportedBy,
                                // ),
                                child: Text(
                                  context.l10n.reportedBy(
                                    reportedByUserModel.username ??
                                        'Unknown', //TODO [optimizations]: Add translations
                                  ),
                                ),
                              ),
                              if (resolvedByUserModel != null &&
                                  resolvedByUserModel.username != null)
                                TextButton(
                                  onPressed: () {
                                    scaffoldMessengerKey.currentState
                                      ?..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        SnackBarHelper.createInformation(
                                          message:
                                              context.l10n.comingInNextUpdate,
                                        ),
                                      );
                                  },
                                  //TODO [optimizations]: Implement this user page later
                                  // onPressed: () => Navigator.pushNamed(
                                  //   context,
                                  //   UserPage.routeName,
                                  //   arguments: mapMarker.resolvedBy,
                                  // ),
                                  child: Text(
                                    context.l10n.resolvedBy(
                                      resolvedByUserModel.username ??
                                          'Unknown', //TODO [optimizations]: Add translations
                                    ),
                                  ),
                                ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void openResolvePage() {
  //   Navigator.pushNamed(context, ResolvePage.routeName, arguments: marker!)
  //       .then((value) {
  //     if (value is ResolvedResult) {
  //       setState(() {
  //         resolveError = value.errorAddingImages;

  //         final m = marker;
  //         if (m != null) {
  //           // temporarily update value while everything is being reloaded
  //           marker = Marker(
  //             m.id,
  //             m.latitude,
  //             m.longitude,
  //             m.type,
  //             m.creationDate,
  //             DateTime.now(),
  //             m.reportedByUser,
  //             null /* will be updated after reloading */,
  //             m.images,
  //             m.canBeReported,
  //           );
  //         }
  //       });
  //       reload();
  //     }
  //   });
  // }

  // void openReportAsInappropriateDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => const ReportAsInappropriateDialog(),
  //   ).then((value) {
  //     if (value is bool && value == true) {
  //       setState(() {
  //         final m = marker;
  //         if (m != null) {
  //           // make sure the user won't be able to report again
  //           marker = Marker(
  //             m.id,
  //             m.latitude,
  //             m.longitude,
  //             m.type,
  //             m.creationDate,
  //             m.resolutionDate,
  //             m.reportedByUser,
  //             m.resolvedByUser,
  //             m.images,
  //             false,
  //           );
  //         }
  //       });

  //       get<Backend>().reportAsInappropriate(marker!.id).then(
  //         (value) {
  //           /* reported successfully */
  //         },
  //         onError: (e) {
  //           setState(() {
  //             reportAsInappropriateError = e.toString();

  //             final m = marker;
  //             if (m != null) {
  //               // allow reporting again
  //               marker = Marker(
  //                 m.id,
  //                 m.latitude,
  //                 m.longitude,
  //                 m.type,
  //                 m.creationDate,
  //                 m.resolutionDate,
  //                 m.reportedByUser,
  //                 m.resolvedByUser,
  //                 m.images,
  //                 true,
  //               );
  //             }
  //           });
  //         },
  //       );
  //     }
  //   });
  // }
}
