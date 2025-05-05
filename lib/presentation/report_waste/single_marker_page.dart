import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
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

//TODO [optimization]: Work on canBeReported
@RoutePage()
class SingleMarkerPage extends StatefulWidget {
  const SingleMarkerPage({required this.mapMarker, super.key});
  final MapMarkerModel mapMarker;

  @override
  State<SingleMarkerPage> createState() => _SingleMarkerPageState();
}

// class MarkerPageArgs {
//   MarkerPageArgs(this.mapMarker, this.errorAddingImages);
//   final MapMarkerModel mapMarker;
//   final String? errorAddingImages;
// }

class _SingleMarkerPageState extends State<SingleMarkerPage> {
  MapMarkerModel get mapMarker => widget.mapMarker;

  String? markerError;
  String? resolveError;
  String? reportAsInappropriateError;

  @override
  void initState() {
    super.initState();
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
        locationInfo?.position?.map(mapMarker.isNearEnoughToResolve) ?? false;

    return BlocProvider(
      create: (_) => getIt<SingleMarkerFormCubit>()
        ..getUserModelByID(mapMarker.reportedBy, isReportedByUser: true)
        ..getUserModelByID(mapMarker.resolvedBy),
      child: Scaffold(
        appBar: AppBar(
          title: MarkerTypeAppBarTitle(mapMarker.markerType),
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
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pop(
              context,
              mapMarker,
            ); // pass the up-to-date loaded marker to the parent
            return false;
          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //*----------------- Map marker images ---------------------//
                  if (mapMarker.images.isNotEmpty)
                    MarkerPhotoListWidget(imageUrls: mapMarker.images),
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

                  //*----------------- Resolved no show || Login to resolve || Get closer to resolve ---------------------//
                  if (mapMarker.resolutionDate != null)
                    const SizedBox()
                  else if (authBlocState == const AuthState.unauthenticated())
                    Text(
                      context.l10n.loginToResolve,
                      textAlign: TextAlign.center,
                    )
                  else if (!nearEnoughToResolve)
                    Text(
                      context.l10n.getCloserToResolve,
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(height: $constants.insets.xs),
                  //*----------------- RESOLVE BUTTON ---------------------//
                  ElevatedButton(
                    onPressed: (mapMarker.resolutionDate == null &&
                            authBlocState == const AuthState.authenticated() &&
                            nearEnoughToResolve)
                        ? () {}
                        //TODO: Implement this
                        // ? openResolvePage
                        : null,
                    child: Text(
                      mapMarker.resolutionDate == null
                          ? context.l10n.resolve
                          : context.l10n.alreadyResolved,
                    ),
                  ),
                  //*----------------- Provides helpful info ---------------------//
                  if (mapMarker.resolutionDate == null)
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
                                  // onPressed: () => Navigator.pushNamed(
                                  //   context,
                                  //   UserPage.routeName,
                                  //   arguments: mapMarker.reportedBy,
                                  // ),
                                  child: Text(
                                    context.l10n.reportedBy(
                                      reportedByUserModel.username ??
                                          'Unknown', //TODO: Add translations
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
                                    // onPressed: () => Navigator.pushNamed(
                                    //   context,
                                    //   UserPage.routeName,
                                    //   arguments: mapMarker.resolvedBy,
                                    // ),
                                    child: Text(
                                      context.l10n.resolvedBy(
                                        resolvedByUserModel.username ??
                                            'Unknown', //TODO: Add translations
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
