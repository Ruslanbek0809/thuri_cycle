import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:insigno_frontend/networking/authentication.dart';
import 'package:insigno_frontend/networking/backend.dart';
import 'package:insigno_frontend/networking/data/map_marker.dart';
import 'package:insigno_frontend/networking/data/marker.dart';
import 'package:insigno_frontend/page/marker/add_images_widget.dart';
import 'package:insigno_frontend/page/marker/image_list_widget.dart';
import 'package:insigno_frontend/page/marker/report_as_inappropriate_dialog.dart';
import 'package:insigno_frontend/page/marker/resolve_page.dart';
import 'package:insigno_frontend/page/user/user_page.dart';
import 'package:insigno_frontend/page/util/marker_type_app_bar_title.dart';
import 'package:insigno_frontend/provider/location_provider.dart';
import 'package:insigno_frontend/util/error_text.dart';
import 'package:insigno_frontend/util/image.dart';
import 'package:insigno_frontend/util/nullable.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/domain/report_waste/single_marker.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_image.dart';
import 'package:thuri_cycle/presentation/report_waste/marker/widgets/marker_photos_list_widget.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/add_images_widget.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/error_text.dart';

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
        title: MarkerTypeAppBarTitle(mapMarker.type),
        actions: isLoggedIn && (singleMarkerModel.canBeReported ?? false)
            ? [
                IconButton(
                  onPressed: openReportAsInappropriateDialog,
                  icon: const Icon(Icons.report),
                  tooltip: l10n.reportAsInappropriate,
                ),
              ]
            : null,
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
                if (singleMarkerModel.marker.images?.isNotEmpty == true)
                  MarkerPhotoListWidget(
                    singleMarkerModel!.marker!.images.map(
                      (image) => CustomImage(
                        image: image,
                        // width: getSize(context).width,
                        height: AddImagesWidget.imageHeight,
                      ),
                    ),
                  ),
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
                if (singleMarkerModel!.marker == null || marker?.resolutionDate != null)
                  const SizedBox() // do not show any error if the marker is already resolved
                else if (!isLoggedIn)
                  Text(context.l10n.loginToResolve, textAlign: TextAlign.center)
                else if (!nearEnoughToResolve)
                  Text(
                    context.l10n.getCloserToResolve,
                    textAlign: TextAlign.center,
                  ),
                if (marker == null) const CircularProgressIndicator(),
                if (marker != null)
                  ElevatedButton(
                    onPressed: (marker?.resolutionDate == null &&
                            isLoggedIn &&
                            nearEnoughToResolve)
                        ? openResolvePage
                        : null,
                    child: Text(
                      marker?.resolutionDate == null
                          ? context.l10n.resolve
                          : context.l10n.alreadyResolved,
                    ),
                  ),
                // Provides helpful info
                if (marker != null && marker?.resolutionDate == null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: Text(
                      context.l10n.usePpe,
                      style: theme.textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (marker != null) const SizedBox(height: 8),
                if (marker != null)
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
                          context.l10n.reportedBy(marker!.reportedByUser.name),
                        ),
                      ),
                      if (marker!.resolvedByUser != null)
                        TextButton(
                          onPressed: () {},
                          // onPressed: () => Navigator.pushNamed(
                          //   context,
                          //   UserPage.routeName,
                          //   arguments: mapMarker.resolvedBy,
                          // ),
                          child: Text(
                            context.l10n
                                .resolvedBy(marker!.resolvedByUser!.name),
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
