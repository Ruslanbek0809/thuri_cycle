import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
import 'package:thuri_cycle/application/auth/profile_user_form/profile_user_form_cubit.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/dialog_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/snackbar_helper.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_bordered_avatar_image.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_elevated_gradient_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_image.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_loading_indicator.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_opacity_back_button.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_svg_avatar.dart';
import 'package:thuri_cycle/presentation/core/widgets/keyboard_dismisser.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_users_circle_avatar_picked_file.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_users_edit_with_label_hook.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_users_phone_textfield.dart';
import 'package:thuri_cycle/presentation/profile/widgets/profile_users_svg_item_card.dart';

@RoutePage()
class ProfileUserEditPage extends StatefulWidget {
  const ProfileUserEditPage({super.key});

  @override
  State<ProfileUserEditPage> createState() => _ProfileUserEditPageState();
}

class _ProfileUserEditPageState extends State<ProfileUserEditPage> {
  bool isBottomSheetOpen = false;

  @override
  void initState() {
    super.initState();
    context.read<ProfileUserFormCubit>().initialAssignOfUserModelForEditing();
  }

  @override
  Widget build(BuildContext context) {
    final safeTopPadding = MediaQuery.of(context).padding.top;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          unauthenticated: (_) {
            talker.warning('UserInfoPage [AuthBloc] unauthenticated');
            context.router.popUntilRoot();
          },
          orElse: () {},
        );
      },
      child: BlocConsumer<ProfileUserFormCubit, ProfileUserFormState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          //* SUCCESS or FAILURE listener for FORM type of BLOC
          state.failureOrSuccessOption.fold(
            () => null,
            (a) => a.fold(
              (failure) {
                scaffoldMessengerKey.currentState
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBarHelper.createError(
                      message: mapFailureToMessage(failure),
                    ),
                  );
              },
              (r) async {
                scaffoldMessengerKey.currentState
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBarHelper.createSuccess(
                      // title: 'Hey, ${r.userName}',
                      message: context.l10n.successUpdateInfo,
                      duration: const Duration(seconds: 2),
                    ),
                  );
              },
            ),
          );
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? $constants.palette.secondaryBackground
                : $constants.palette.darkBackground,
            body: KeyboardDismisserWidget(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                //*------------------ PROFILE BACKGROUND IMAGE---------------------//
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CustomImage(
                                      image: 'assets/background.jpg',
                                      height: getSize(context).height *
                                          (getTabletType() ? 0.3 : 0.27),
                                      width: getSize(context).width,
                                    ),
                                  ],
                                ),
                                //*------------------ PROFILE USER INFO ---------------------//
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        getThemeData(context).cardTheme.color,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                        $constants.corners.md + 6,
                                      ),
                                      bottomRight: Radius.circular(
                                        $constants.corners.md + 6,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                    $constants.insets.sm,
                                    $constants.insets.lg + $constants.insets.sm,
                                    $constants.insets.sm,
                                    $constants.insets.sm,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //*------------------ USER NAME HOOK ---------------------//
                                      ProfileUsersEditWithLabelHook(
                                        text: state
                                                .userModelForEditing.username ??
                                            '',
                                        labelText: context.l10n.username,
                                        textInputAction: TextInputAction.done,
                                        onChanged: context
                                            .read<ProfileUserFormCubit>()
                                            .userNameChanged,
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return context.l10n.required;
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: $constants.insets.sm),
                                      //*------------------ USER PHONE ---------------------//
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              bottom: $constants.insets.xxs + 2,
                                            ),
                                            child: Text(
                                              context.l10n.phoneNumber,
                                              style: getTextTheme(context)
                                                  .titleMedium!
                                                  .copyWith(
                                                    fontSize:
                                                        responsiveFontSize(
                                                      context,
                                                      14.5,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                          //*------------------ USER MAIN PHONE / VERIFY ---------------------//
                                          ProfileUsersPhoneTextField(
                                            key: const Key(
                                              'userPhone',
                                            ),
                                            isReadOnly: true,
                                            phoneController: state.userPhone,
                                            textInputAction:
                                                TextInputAction.done,
                                            onChanged: (
                                              PhoneNumber? value,
                                            ) {
                                              // context
                                              //     .read<
                                              //         ProfileUserFormCubit>()
                                              //     .userPhoneValueChanged(
                                              //       value,
                                              //     );
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: $constants.insets.sm),
                                      //*------------------ EMAIL ---------------------//
                                      ProfileUsersEditWithLabelHook(
                                        text: state.userModelForEditing.email ??
                                            '',
                                        labelText: context.l10n.email,
                                        textInputAction: TextInputAction.done,
                                        isReadOnly: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            //*------------------ PROFILE USER IMAGE ---------------------//
                            Positioned(
                              top: getSize(context).height *
                                      (getTabletType() ? 0.3 : 0.27) -
                                  (getTabletType() ? 128 : 64),
                              left: 0,
                              right: 0,
                              child: state.userModelForEditing.profilePicture !=
                                          null &&
                                      state.userImageWithFileModel == null
                                  ? GestureDetector(
                                      onTap: !state.isLoading
                                          ? () async {
                                              //TODO [optimization]: Add photo uploading functionality later
                                              scaffoldMessengerKey.currentState
                                                ?..hideCurrentSnackBar()
                                                ..showSnackBar(
                                                  SnackBarHelper
                                                      .createInformation(
                                                    message: context.l10n
                                                        .comingInNextUpdate,
                                                  ),
                                                );
                                              // //TODO: Implement IOS cupertino bottom sheet
                                              // await showMaterialModalBottomSheet<
                                              //     void>(
                                              //   context: context,
                                              //   builder: (context) =>
                                              //       ProfileUsersImagePickerBottomSheet(
                                              //     isDeleteAvailable: (state
                                              //                     .userImageWithFileModel !=
                                              //                 null ||
                                              //             state.userModelForEditing
                                              //                     .profilePicture !=
                                              //                 null) &&
                                              //         state.isDeleteUserImageTriggered ==
                                              //             false,
                                              //     onTap: (pickedFile) async {
                                              //       await context
                                              //           .read<
                                              //               ProfileUserFormCubit>()
                                              //           .userImageWithFileModelPicked(
                                              //             pickedFile,
                                              //           );
                                              //     },
                                              //     onDeleteImageTap:
                                              //         (pickedFile) async {
                                              //       await context
                                              //           .read<
                                              //               ProfileUserFormCubit>()
                                              //           .userImageWithFileModelPicked(
                                              //             pickedFile,
                                              //             isDeleteImageTriggered:
                                              //                 true,
                                              //           );
                                              //     },
                                              //   ),
                                              // );
                                            }
                                          : () {},
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ClipOval(
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: $constants.palette.black
                                                    .withOpacity(0.5),
                                                backgroundBlendMode:
                                                    BlendMode.darken,
                                              ),
                                              child: ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return LinearGradient(
                                                    colors: [
                                                      Colors.transparent,
                                                      $constants.palette.black
                                                          .withOpacity(0.25),
                                                    ],
                                                    begin: Alignment.center,
                                                    end: Alignment.center,
                                                  ).createShader(bounds);
                                                },
                                                blendMode: BlendMode.srcATop,
                                                child: state.userModelForEditing
                                                                .profilePicture !=
                                                            null &&
                                                        state.isDeleteUserImageTriggered ==
                                                            false
                                                    ? CustomBorderedAvatarImage(
                                                        image: state
                                                            .userModelForEditing
                                                            .profilePicture,
                                                        radius: 42.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            width: 3,
                                                            color: getThemeData(
                                                              context,
                                                            ).scaffoldBackgroundColor,
                                                          ),
                                                        ),
                                                        size: Size(
                                                          getTabletType()
                                                              ? 208
                                                              : 104,
                                                          getTabletType()
                                                              ? 208
                                                              : 104,
                                                        ),
                                                      )
                                                    : CustomSvgAvatar(
                                                        width: getTabletType()
                                                            ? 208
                                                            : 104,
                                                        height: getTabletType()
                                                            ? 208
                                                            : 104,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            width: 3,
                                                            color: getThemeData(
                                                              context,
                                                            ).scaffoldBackgroundColor,
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: $constants.palette.black
                                                .withOpacity(0.5),
                                            shape: const CircleBorder(),
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                $constants.insets.xxs + 1,
                                              ),
                                              child: Icon(
                                                Icons.camera_alt_outlined,
                                                color: $constants.palette.white,
                                                size: getTabletType() ? 40 : 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: !state.isLoading
                                          ? () async {
                                              //TODO [optimization]: Add photo uploading functionality later
                                              scaffoldMessengerKey.currentState
                                                ?..hideCurrentSnackBar()
                                                ..showSnackBar(
                                                  SnackBarHelper
                                                      .createInformation(
                                                    message: context.l10n
                                                        .comingInNextUpdate,
                                                  ),
                                                );
                                              // //TODO: Implement IOS cupertino bottom sheet
                                              // await showMaterialModalBottomSheet<
                                              //     void>(
                                              //   context: context,
                                              //   builder: (context) =>
                                              //       ProfileUsersImagePickerBottomSheet(
                                              //     isDeleteAvailable: (state
                                              //                     .userImageWithFileModel !=
                                              //                 null ||
                                              //             state.userModelForEditing
                                              //                     .profilePicture !=
                                              //                 null) &&
                                              //         state.isDeleteUserImageTriggered ==
                                              //             false,
                                              //     onTap: (pickedFile) async {
                                              //       await context
                                              //           .read<
                                              //               ProfileUserFormCubit>()
                                              //           .userImageWithFileModelPicked(
                                              //             pickedFile,
                                              //           );
                                              //     },
                                              //     onDeleteImageTap:
                                              //         (pickedFile) async {
                                              //       await context
                                              //           .read<
                                              //               ProfileUserFormCubit>()
                                              //           .userImageWithFileModelPicked(
                                              //             pickedFile,
                                              //             isDeleteImageTriggered:
                                              //                 true,
                                              //           );
                                              //     },
                                              //   ),
                                              // );
                                            }
                                          : () {},
                                      child: ProfileUsersCircleAvatarPickedFile(
                                        pickedFile:
                                            state.userImageWithFileModel?.file,
                                      ),
                                    ),
                            ),
                            Positioned(
                              top: safeTopPadding + $constants.insets.sm,
                              left: $constants.insets.sm,
                              child: const CustomOpacityBackButton(),
                            ),
                          ],
                        ),
                        // SizedBox(height: $constants.insets.xxs + 2),
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(
                        //       $constants.corners.md + 6,
                        //     ),
                        //   ),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       ProfileUsersItemCard(
                        //         title: context.l10n.hideMyPhone,
                        //         content: context.l10n.hideMyPhoneInfo,
                        //         value: state.userModelForEditing.mobileHidden ??
                        //             false,
                        //         onChanged: context
                        //             .read<ProfileUserFormCubit>()
                        //             .mobileHiddenChanged,
                        //       ),
                        //       Container(
                        //         height: 0.5,
                        //         margin: EdgeInsets.symmetric(
                        //           horizontal: $constants.insets.sm,
                        //         ),
                        //         padding: EdgeInsets.symmetric(
                        //           vertical: $constants.insets.xxs,
                        //         ),
                        //         color: getThemeData(context).canvasColor,
                        //       ),
                        //       ProfileUsersItemCard(
                        //         title: context.l10n.hideMyEmail,
                        //         content: context.l10n.hideMyEmailInfo,
                        //         value: state.userModelForEditing.emailHidden ??
                        //             false,
                        //         onChanged: context
                        //             .read<ProfileUserFormCubit>()
                        //             .emailHiddenChanged,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //TODO [optimization]: Implement delete later (+related map markers should be handled)
                        // SizedBox(height: $constants.insets.xxs + 2),
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(
                        //       $constants.corners.md + 6,
                        //     ),
                        //   ),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       ProfileUsersSvgItemCard(
                        //         title: context.l10n.deleteMyAccount,
                        //         svgName: 'assets/profile/delete.svg',
                        //         onTap: () async {
                        //           await DialogHelper.showCustomAlertDialog(
                        //             context,
                        //             title: context.l10n.deleteAccount,
                        //             content: context.l10n.deleteAccountInfo,
                        //             cancelText: context.l10n.cancel,
                        //             confirmText: context.l10n.delete,
                        //           ).then<void>((value) async {
                        //             if (value ?? false) {
                        //               await context
                        //                   .read<ProfileUserFormCubit>()
                        //                   .deleteUser();
                        //             }
                        //           });
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: $constants.insets.xxs + 2),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              $constants.corners.md + 6,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileUsersSvgItemCard(
                                title: context.l10n.logout,
                                svgName: 'assets/profile/log_out.svg',
                                onTap: () async {
                                  await DialogHelper.showCustomAlertDialog(
                                    context,
                                    title: context.l10n.logOut,
                                    content: context.l10n.logOutInfo,
                                    cancelText: context.l10n.cancel,
                                    confirmText: context.l10n.logOut,
                                  ).then<void>((value) async {
                                    if (value ?? false) {
                                      context
                                          .read<AuthBloc>()
                                          .add(const AuthEvent.signedOut());
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: $constants.insets.sm),
                      ],
                    ),
                  ),
                  //*--------------- SAVE BUTTON ---------------//
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x10000000),
                          blurRadius: 2,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Card(
                      shape: const RoundedRectangleBorder(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: $constants.insets.sm + 4,
                          horizontal: $constants.insets.sm,
                        ),
                        child: state.isLoading
                            ? Center(
                                child: CustomLoadingIndicator(
                                  isSizedBox: true,
                                  height: 56,
                                  width: 56,
                                  color: $constants.palette.main,
                                ),
                              )
                            : CustomElevatedGradientButton(
                                onPressed: state.userModelForEditing.uid !=
                                            null ||
                                        !state.isLoading
                                    ? () async {
                                        if (await checkRequiredFields(state) ==
                                            true) {
                                          if (context.mounted) {
                                            await context
                                                .read<ProfileUserFormCubit>()
                                                .updateProfileUser();
                                          }
                                        }
                                      }
                                    : () {},
                                child: Text(
                                  context.l10n.save,
                                  style: getTextTheme(context)
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: responsiveFontSize(
                                          context,
                                          14.5,
                                        ),
                                        color: $constants.palette.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool> checkRequiredFields(ProfileUserFormState state) async {
    if (state.userModelForEditing.username?.isEmpty ?? true) {
      await showSnackBar(context.l10n.usernameIsRequired);
      return false;
    }

    return true;
  }

  Future<void> showSnackBar(String message) async {
    scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBarHelper.createError(
          message: message,
        ),
      );
    return;
  }
}
