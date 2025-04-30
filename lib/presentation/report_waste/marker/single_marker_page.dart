import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/domain/report_waste/single_marker.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/report_waste/marker/widgets/marker_photos_list_widget.dart';
import 'package:thuri_cycle/presentation/report_waste/marker/widgets/marker_type_app_bar_title.dart';

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
  late SingleMarkerModel singleMarkerModel;
  String? markerError;
  String? resolveError;
  String? reportAsInappropriateError;

  @override
  void initState() {
    super.initState();
    singleMarkerModel = SingleMarkerModel(
      marker: widget.mapMarker,
      reportedByUser: const UserModel(uid: '12'),
      canBeReported: true,
      resolvedByUser: const UserModel(uid: '12'),
    );
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

    // final MapMarker mapMarker = (marker ?? widget.mapMarker);
    // final position = watchStream(
    //   (LocationProvider location) => location.getLocationStream(),
    //   get<LocationProvider>().lastLocationInfo(),
    // ).data;
    // final bool isLoggedIn = watchStream(
    //       (Authentication authentication) =>
    //           authentication.getIsLoggedInStream(),
    //       get<Authentication>().isLoggedIn(),
    //     ).data ??
    //     false;
    // final bool nearEnoughToResolve =
    //     position?.position?.map(mapMarker.isNearEnoughToResolve) ?? false;

    return Scaffold(
      appBar: AppBar(
        title: MarkerTypeAppBarTitle(singleMarkerModel.marker.markerType),
        actions:
            // isLoggedIn && (singleMarkerModel.canBeReported ?? false)
            //     ?
            [
          IconButton(
            onPressed: () {},
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
            singleMarkerModel,
          ); // pass the up-to-date loaded marker to the parent
          return false;
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (singleMarkerModel.marker.images?.isNotEmpty ?? false)
                  MarkerPhotoListWidget(
                    imageUrls: singleMarkerModel.marker.images ?? [],
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
                //   topPadding: 16,
                // ),
                // ErrorText(
                //   resolveError,
                //   l10n.errorUploadingResolveImages,
                //   topPadding: 16,
                // ),
                // ErrorText(
                //   reportAsInappropriateError,
                //   l10n.errorReportingAsInappropriate,
                //   topPadding: 16,
                // ),
                const SizedBox(
                  height: 16,
                  width:
                      double.infinity, // to make the column have maximum width
                ),
                if (singleMarkerModel.marker.resolutionDate != null)
                  const SizedBox(), // do not show any error if the marker is already resolved
                // else if (!isLoggedIn)
                Text(context.l10n.loginToResolve, textAlign: TextAlign.center),
                // else if (!nearEnoughToResolve)
                Text(
                  context.l10n.getCloserToResolve,
                  textAlign: TextAlign.center,
                ),
                // if (singleMarkerModel.marker == null) const CircularProgressIndicator(),
                ElevatedButton(
                  onPressed: () {},
                  // onPressed:
                  //     (singleMarkerModel.marker?.resolutionDate == null &&
                  //             isLoggedIn &&
                  //             nearEnoughToResolve)
                  //         ? openResolvePage
                  //         : null,
                  child: Text(
                    singleMarkerModel.marker.resolutionDate == null
                        ? context.l10n.resolve
                        : context.l10n.alreadyResolved,
                  ),
                ),
                // Provides helpful info
                if (singleMarkerModel.marker.resolutionDate == null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: Text(
                      context.l10n.usePpe,
                      style: theme.textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 8),
                OverflowBar(
                  overflowAlignment: OverflowBarAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      // onPressed: () => Navigator.pushNamed(
                      //   context,
                      //   UserPage.routeName,
                      //   arguments: mapMarker.reportedBy,
                      // ),
                      child: Text(
                        context.l10n.reportedBy(
                          singleMarkerModel.reportedByUser.name ??
                              'No Reported user',
                        ),
                      ),
                    ),
                    if (singleMarkerModel.resolvedByUser != null)
                      TextButton(
                        onPressed: () {},
                        // onPressed: () => Navigator.pushNamed(
                        //   context,
                        //   UserPage.routeName,
                        //   arguments: mapMarker.resolvedBy,
                        // ),
                        child: Text(
                          context.l10n.resolvedBy(
                            singleMarkerModel.resolvedByUser?.name ??
                                'No Resolved user',
                          ),
                        ),
                      ),
                  ],
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
