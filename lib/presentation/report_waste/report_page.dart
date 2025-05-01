import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/report_waste/location/location_cubit.dart';
import 'package:thuri_cycle/application/report_waste/report/report_form_cubit.dart';
import 'package:thuri_cycle/domain/report_waste/location_info.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/bottom_sheet_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_elevated_gradient_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_loading_indicator.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/add_report_photos_widget.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/error_messages.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/report_marker_type_card.dart';

//TODO: Add login feature
//TODO: Implement send function using form
//TODO: Implement proper image adding
@RoutePage()
class ReportPage extends StatefulWidget {
  const ReportPage({super.key});
//  implements AutoRouteWrapper
  // required this.reportFormCubit,
  // final ReportFormCubit reportFormCubit;

  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   return BlocProvider.value(value: reportFormCubit, child: this);
  // }

  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => getIt<ReportFormCubit>(),
  //     child: this,
  //   );
  // }

  @override
  State<ReportPage> createState() => _ReportPageState();
}

// class ReportedResult {
//   ReportedResult(this.newMapMarkerModel, this.errorAddingImages);
//   final MapMarkerModel newMapMarkerModel;
//   final String? errorAddingImages;
// }

class _ReportPageState extends State<ReportPage> {
  List<Pair<Uint8List, String?>> images = [];
  MarkerType? markerType;

  @override
  void initState() {
    super.initState();
    context
        .read<ReportFormCubit>()
        .reset(); //TODO [optimization]: If possible try to move it just before MapPage (Use AutoRouteWrapper) (REMOVE this)
  }

  @override
  Widget build(BuildContext context) {
    final locationState =
        BlocProvider.of<LocationCubit>(context, listen: true).state;
    LocationInfoModel? locationInfo;

    locationState.maybeWhen(
      success: (info) => locationInfo = info,
      orElse: () => null,
    );

    // final isLoggedIn = watchStream(
    //         (Authentication authentication) => authentication.getIsLoggedInStream(),
    //         get<Authentication>().isLoggedIn())
    //     .data;

    // final errorMessage = getErrorMessage(
    //   // isLoggedIn,
    //   locationInfo,
    //   whilePositionLoading: () {
    //     if (images.isEmpty) {
    //       return ErrorMessage.addImage;
    //     } else if (markerType == null) {
    //       return ErrorMessage.selectMarkerType;
    //     } else {
    //       return null;
    //     }
    //   },
    // );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? $constants.palette.secondaryBackground
          : $constants.palette.darkBackground,
      appBar: AppBar(
        leadingWidth: getTabletType() ? 74 : 58,
        title: Text(
          context.l10n.report,
          style: getTextTheme(context).titleLarge!.copyWith(
                fontSize: responsiveFontSize(context, 22),
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: BlocConsumer<ReportFormCubit, ReportFormState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all($constants.insets.sm),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //*----------------- MARKER TYPE ---------------------//
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            $constants.corners.md + 6,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all($constants.insets.sm),
                          child: ReportMarkerTypeCard(
                            label: context.l10n.wasteType,
                            // label: context.l10n.selectWasteType,
                            markerType: state.markerType,
                            onTap: state.isSubmitting
                                ? null
                                : () async {
                                    if (MarkerType.values.isNotEmpty) {
                                      await BottomSheetHelper
                                          .showMarkerTypesSheet(
                                        context,
                                        MarkerType.values,
                                        state.markerType,
                                      ).then<void>((value) async {
                                        if (value == null) return;
                                        if (context.mounted) {
                                          context
                                              .read<ReportFormCubit>()
                                              .setMarkerType(value);
                                        }
                                      });
                                    }
                                  },
                          ),
                        ),
                      ),
                      // DropdownButton<MarkerType>(
                      //   hint: Text(context.l10n.markerType),
                      //   value: state.markerType,
                      //   onChanged: state.isSubmitting
                      //       ? null
                      //       : (type) => context
                      //           .read<ReportFormCubit>()
                      //           .setMarkerType(type!),
                      //   items: MarkerType.values
                      //       .where((element) => element != MarkerType.unknown)
                      //       .map(
                      //     (markerType) {
                      //       return DropdownMenuItem(
                      //         value: markerType,
                      //         child: Row(
                      //           children: [
                      //             markerType.getThemedIcon(context),
                      //             const SizedBox(width: 8),
                      //             Text(markerType.getName(context)),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ).toList(),
                      // ),
                      SizedBox(height: $constants.insets.sm + 2),
                      //*----------------- PHOTOS UPLOAD GUIDE ---------------------//
                      SizedBox(
                        width: getSize(context).width,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              $constants.corners.md + 6,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: $constants.insets.sm,
                              vertical: $constants.insets.xs + 2,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.l10n.addPhotos,
                                  style: getTextTheme(context)
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: responsiveFontSize(
                                          context,
                                          16,
                                        ),
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                SizedBox(height: $constants.insets.xxs),
                                Text(
                                  context.l10n.chooseClearPhotos,
                                  style: getTextTheme(context)
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize:
                                            responsiveFontSize(context, 12),
                                        color: $constants.palette.search,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //*----------------- PHOTOS UPLOAD SECTION ---------------------//
                      SizedBox(height: $constants.insets.sm + 2),
                      AddReportPhotosWidget(
                        state.images,
                        (imageWithImageModel) => context
                            .read<ReportFormCubit>()
                            .addImage(imageWithImageModel),
                        (index) => context
                            .read<ReportFormCubit>()
                            .removeImageAt(index),
                      ),
                      const SizedBox(
                        height: 12,
                        width: double
                            .infinity, // to make the column have maximum width
                      ),
                      //TODO: Handle this
                      // if (errorMessage != null)
                      //   Text(errorMessage.toLocalizedString(context.l10n)),

                      // if (state.isSubmitting)
                      //   const CircularProgressIndicator()
                      // else
                      //   ElevatedButton(
                      //     onPressed: state.isSubmitting
                      //         ? null
                      //         : () {
                      //             final pos = locationInfo?.position;
                      //             if (pos != null) {
                      //               context
                      //                   .read<ReportFormCubit>()
                      //                   .submitReport(
                      //                     latitude: pos.latitude,
                      //                     longitude: pos.longitude,
                      //                   );
                      //             }
                      //           },
                      //     child: Text(context.l10n.send),
                      //   ),
                      // ErrorText(error, context.l10n.errorReporting),
                    ],
                  ),
                ),
              ),
              //*----------------- PUBLISH BUTTON ---------------------//
              if (state.isSubmitting)
                Card(
                  shape: const RoundedRectangleBorder(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: $constants.insets.sm + 4,
                      horizontal: $constants.insets.sm,
                    ),
                    child: Center(
                      child: CustomLoadingIndicator(
                        isSizedBox: true,
                        height: 56,
                        width: 56,
                        color: $constants.palette.main,
                      ),
                    ),
                  ),
                )
              else
                Card(
                  shape: const RoundedRectangleBorder(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: $constants.insets.sm + 4,
                      horizontal: $constants.insets.sm,
                    ),
                    child: CustomElevatedGradientButton(
                      child: Text(
                        context.l10n.send,
                        style: getTextTheme(context).titleMedium!.copyWith(
                              fontSize: responsiveFontSize(
                                context,
                                14.5,
                              ),
                              color: $constants.palette.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      onPressed: () async {
                        // if (await checkRequiredFields(state) == true) {
                        //   if (context.mounted) {
                        //     await context
                        //         .read<AddProductFormCubit>()
                        //         .addProduct();
                        //   }
                        // }
                      },
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  // Future<bool> checkRequiredFields(
  //   BuildContext context,
  //   AddProductFormState state,
  // ) async {
  //   if (state.addProductModel.category == null) {
  //     await showSnackBar(context.l10n.categoryIsRequired);
  //     return false;
  //   } else if (state.addProductModel.subcategory == null) {
  //     await showSnackBar(context.l10n.subcategoryIsRequired);
  //     return false;
  //   } else if (state.addProductModel.productName?.isEmpty ?? true) {
  //     await showSnackBar(context.l10n.nameIsRequired);
  //     return false;
  //   } else if (state.addProductModel.price == null) {
  //     await showSnackBar(context.l10n.priceIsRequired);
  //     return false;
  //   }
  //   if ((state.addProductModel.isSelectedFromMap != null &&
  //           state.addProductModel.isSelectedFromMap! == true &&
  //           state.addProductModel.location != null &&
  //           state.addProductModel.location!.isEmpty == true) ||
  //       state.addProductModel.isSelectedFromMap == false &&
  //           state.addProductModel.address == null) {
  //     await showSnackBar(context.l10n.locationIsRequired);
  //     return false;
  //   }
  //   return true;
  // }

  // Future<void> showSnackBar(String message) async {
  //   scaffoldMessengerKey.currentState
  //     ?..hideCurrentSnackBar()
  //     ..showSnackBar(
  //       SnackBarHelper.createError(
  //         message: message,
  //         snackBarPosition: 'top',
  //       ),
  //     );
  //   return;
  // }

  // void send() async {
  //   var pos = get<LocationProvider>().lastLocationInfo().position;
  //   var mt = markerType;
  //   if (pos == null ||
  //       images.isEmpty ||
  //       mt == null ||
  //       mt == MarkerType.unknown) {
  //     return; // this should be unreachable, since "Send" should be hidden
  //   }

  //   setState(() {
  //     loading = true;
  //     error = null;
  //   });

  //   final backend = get<Backend>();
  //   backend.addMarker(pos.latitude, pos.longitude, mt).then(
  //     (markerUpdate) {
  //       // get<AuthUserProvider>().addPoints(markerUpdate.earnedPoints);

  //       // temporary map marker used only locally
  //       var mapMarker = MapMarker(
  //         markerUpdate.id,
  //         pos.latitude,
  //         pos.longitude,
  //         mt,
  //         DateTime.now(),
  //         null,
  //         -1 /* TODO we don't know our user id */,
  //         null,
  //       );
  //       Future.wait(
  //         images.map(
  //           (e) => backend.addMarkerImage(markerUpdate.id, e.first, e.second),
  //         ),
  //       ).then(
  //         (_) => Navigator.pop(context, ReportedResult(mapMarker, null)),
  //         onError: (e) =>
  //             Navigator.pop(context, ReportedResult(mapMarker, e.toString())),
  //       );
  //     },
  //     onError: (e) {
  //       setState(() {
  //         loading = false;
  //         error = e.toString();
  //       });
  //     },
  //   );
  // }
}
