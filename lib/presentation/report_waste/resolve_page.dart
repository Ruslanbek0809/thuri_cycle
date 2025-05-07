import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
import 'package:thuri_cycle/application/auth/profile_user_form/profile_user_form_cubit.dart';
import 'package:thuri_cycle/application/report_waste/location/location_cubit.dart';
import 'package:thuri_cycle/application/report_waste/resolve/resolve_form_cubit.dart';
import 'package:thuri_cycle/domain/report_waste/location_info.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/dialog_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_elevated_gradient_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_loading_indicator.dart';
import 'package:thuri_cycle/presentation/report_waste/widgets/add_report_photos_widget.dart';
import 'package:thuri_cycle/router.gr.dart';

@RoutePage()
class ResolvePage extends StatefulWidget {
  const ResolvePage(this.mapMarker, {super.key});
  final MapMarkerModel mapMarker;

  @override
  State<ResolvePage> createState() => _ResolvePageState();
}

// class ResolvedResult {
//   final String? errorAddingImages;

//   ResolvedResult(this.errorAddingImages);
// }

class _ResolvePageState extends State<ResolvePage> {
  MapMarkerModel get mapMarker => widget.mapMarker;
  // List<Pair<Uint8List, String?>> images = [];
  bool loading = false;
  String? error;

  final Distance distance = const Distance();

  @override
  void initState() {
    super.initState();
    //TODO [optimization]: If possible try to move it just before MapPage (Use AutoRouteWrapper) (REMOVE this)
    context.read<ResolveFormCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    final authBlocState = context.watch<AuthBloc>().state;
    final profileUserFormCubitState =
        context.watch<ProfileUserFormCubit>().state;
    final userModel = profileUserFormCubitState.userModel;
    
    final locationState = context.watch<LocationCubit>().state;
    LocationInfoModel? locationInfo;

    locationState.maybeWhen(
      success: (info) => locationInfo = info,
      orElse: () => null,
    );

    // final errorMessage = getErrorMessage(
    //   isLoggedIn,
    //   position,
    //   whilePositionLoading: () => images.isEmpty ? ErrorMessage.addImage : null,
    //   afterPositionLoaded: () =>
    //       (position?.position?.map(marker.isNearEnoughToResolve) ?? false)
    //           ? null
    //           : ErrorMessage.tooFarToResolve,
    // );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.l10n.resolve),
      ),
      body: BlocConsumer<ResolveFormCubit, ResolveFormState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(() {}, (either) {
            either.fold(
              (failure) {
                scaffoldMessengerKey.currentState
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBarHelper.createError(
                      message: mapFailureToMessage(failure),
                    ),
                  );
              },
              (newMapMarker) async {
                scaffoldMessengerKey.currentState
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBarHelper.createSuccess(
                      message: context.l10n.resolvedSuccessfully,
                    ),
                  );

                //TODO [optimization]: If possible try to move it just before MapPage (Use AutoRouteWrapper) (REMOVE this)
                context.read<ResolveFormCubit>().reset();
              },
            );
          });
        },
        buildWhen: (p, c) => p != c,
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                        //TODO [optimization]: Don't let upload an image when submitting is ongoing
                        SizedBox(height: $constants.insets.sm + 2),
                        AddReportPhotosWidget(
                          state.resolvedImages,
                          (imageWithImageModel) => context
                              .read<ResolveFormCubit>()
                              .addImage(imageWithImageModel),
                          (index) => context
                              .read<ResolveFormCubit>()
                              .removeImageAt(index),
                        ),
                        const SizedBox(
                          height: 12,
                          width: double.infinity,
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
                        // const SizedBox(
                        //   height: 12,
                        //   width: double.infinity,
                        // ),
                        // if (errorMessage != null)
                        //   Text(errorMessage.toLocalizedString(l10n)),
                        // if (loading)
                        //   const CircularProgressIndicator()
                        // else
                        //   ElevatedButton(
                        //     onPressed: errorMessage == null ? resolve : null,
                        //     child: Text(l10n.resolve),
                        //   ),
                        // ErrorText(error, l10n.errorResolving),
                      ],
                    ),
                  ),
                ),
                //*----------------- SUBMIT BUTTON ---------------------//
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
                          if (authBlocState ==
                              const AuthState.unauthenticated()) {
                            if (context.mounted) {
                              await DialogHelper.showCustomAlertDialog(
                                context,
                                title: context.l10n.logIn,
                                content: context.l10n.loginToDoAction,
                                cancelText: context.l10n.cancel,
                                confirmText: context.l10n.logIn,
                              ).then<void>((value) async {
                                if (value ?? false) {
                                  if (context.mounted) {
                                    await context.router
                                        .push(const LoginRoute());
                                  }
                                }
                              });
                            }
                          } else {
                            // if (await checkRequiredFields(state) == true) {
                            final pos = locationInfo?.position;
                            if (pos != null) {
                              await context
                                  .read<ResolveFormCubit>()
                                  .submitReport(
                                    mapMarker: mapMarker,
                                    userId: userModel.uid,
                                  );
                            }
                            // }
                          }
                        },
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  // void resolve() {
  //   var markerId = widget.mapMarker.id;
  //   if (images.isEmpty) {
  //     return; // should be unreachable
  //   }

  //   setState(() {
  //     loading = true;
  //     error = null;
  //   });

  //   final backend = get<Backend>();
  //   backend.resolveMarker(widget.mapMarker.id).then(
  //     (markerUpdate) {
  //       get<AuthUserProvider>().addPoints(markerUpdate.earnedPoints);
  //       Future.wait(images.map(
  //           (e) => backend.addMarkerImage(markerId, e.first, e.second))).then(
  //         (_) => Navigator.pop(context, ResolvedResult(null)),
  //         onError: (e) => Navigator.pop(context, ResolvedResult(e.toString())),
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
