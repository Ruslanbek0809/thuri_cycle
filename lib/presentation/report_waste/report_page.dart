import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/report_waste/location/location_cubit.dart';
import 'package:thuri_cycle/application/report_waste/report/report_form_cubit.dart';
import 'package:thuri_cycle/domain/report_waste/location_info.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/error_messages.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/error_text.dart';

//TODO: Add login feature
//TODO: Implement send function using form
//TODO: Implement proper image adding
@RoutePage()
class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class ReportedResult {
  ReportedResult(this.newMapMarkerModel, this.errorAddingImages);
  final MapMarkerModel newMapMarkerModel;
  final String? errorAddingImages;
}

class _ReportPageState extends State<ReportPage> {
  List<Pair<Uint8List, String?>> images = [];
  MarkerType? markerType;

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

    final errorMessage = getErrorMessage(
      // isLoggedIn,
      locationInfo,
      whilePositionLoading: () {
        if (images.isEmpty) {
          return ErrorMessage.addImage;
        } else if (markerType == null) {
          return ErrorMessage.selectMarkerType;
        } else {
          return null;
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.l10n.report),
      ),
      body: BlocConsumer<ReportFormCubit, ReportFormState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Add Image Button
                  IconButton(
                    onPressed: () async {
                      // final image = await pickImage();
                      // if (image != null) {
                      //   context
                      //       .read<ReportFormCubit>()
                      //       .addImage(image.bytes, image.name);
                      // }
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                  // AddImagesWidget(
                  //   images,
                  //   loading
                  //       ? null
                  //       : (image) => setState(() => images.add(image)),
                  //   loading
                  //       ? null
                  //       : (index) => setState(() => images.removeAt(index)),
                  // ),
                  const SizedBox(
                    height: 12,
                    width: double
                        .infinity, // to make the column have maximum width
                  ),
                  DropdownButton<MarkerType>(
                    value: state.markerType,
                    onChanged: (type) =>
                        context.read<ReportFormCubit>().setMarkerType(type!),
                    items: MarkerType.values
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.toString()),
                          ),
                        )
                        .toList(),
                  ),
                  // DropdownButton(
                  //   hint: Text(context.l10n.markerType),
                  //   items: MarkerType.values
                  //       .where((element) => element != MarkerType.unknown)
                  //       .map(
                  //         (e) => DropdownMenuItem(
                  //           value: e,
                  //           child: Row(
                  //             children: [
                  //               e.getThemedIcon(context),
                  //               const SizedBox(width: 8),
                  //               Text(e.getName(context)),
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  //       .toList(growable: false),
                  //   onChanged: loading
                  //       ? null
                  //       : (MarkerType? newMarkerType) =>
                  //           setState(() => markerType = newMarkerType),
                  //   value: markerType,
                  // ),
                  const SizedBox(height: 12),
                  if (errorMessage != null)
                    Text(errorMessage.toLocalizedString(context.l10n)),
                  if (state.isSubmitting)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: state.isSubmitting
                          ? null
                          : () {
                              final pos = locationInfo?.position;
                              if (pos != null) {
                                context.read<ReportFormCubit>().submitReport(
                                      latitude: pos.latitude,
                                      longitude: pos.longitude,
                                    );
                              }
                            },
                      // onPressed: errorMessage == null ? send : null,
                      child: Text(context.l10n.send),
                    ),
                  ErrorText('Hey', context.l10n.errorReporting),
                  // ErrorText(error, context.l10n.errorReporting),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

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
