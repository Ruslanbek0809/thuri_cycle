// import 'package:auto_route/auto_route.dart';
// import 'package:flipgoo_app/application/auth/auth_bloc.dart';
// import 'package:flipgoo_app/application/auth/profile_user_form/profile_user_form_cubit.dart';
// import 'package:flipgoo_app/application/profile/settings_form_cubit.dart';
// import 'package:flipgoo_app/domain/hive/hive_country.dart';
// import 'package:flipgoo_app/l10n/l10n.dart';
// import 'package:flipgoo_app/library/countries_country_code_map.dart';
// import 'package:flipgoo_app/presentation/core/utils/constants.dart';
// import 'package:flipgoo_app/presentation/core/utils/helpers/dialog_helper.dart';
// import 'package:flipgoo_app/presentation/core/utils/helpers/snackbar_helper.dart';
// import 'package:flipgoo_app/presentation/core/utils/methods/aliases.dart';
// import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_bordered_avatar_image.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_elevated_gradient_button.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_image.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_loading_indicator.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_lottie_avatar.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_opacity_back_button.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_outline_child_button.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_svg_icon.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_text_button.dart';
// import 'package:flipgoo_app/presentation/core/widgets/keyboard_dismisser.dart';
// import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_address_hook.dart';
// import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_background_image_picked_file.dart';
// import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_circle_avatar_picked_file.dart';
// import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_edit_with_label_hook.dart';
// import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_image_picker_bottom_sheet.dart';
// import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_item_card.dart';
// import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_phone_textfield.dart';
// import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_phone_verify_modal_bottom_sheet.dart';
// import 'package:flipgoo_app/presentation/profile/profile_users/widgets/profile_users_svg_item_card.dart';
// import 'package:flipgoo_app/presentation/routes/router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:phone_form_field/phone_form_field.dart';

//TODO: Background image should be static
//TODO: Add lottie custom avatar???
// @RoutePage()
// class ProfileUserEditInfoPage extends StatefulWidget {
//   const ProfileUserEditInfoPage({super.key});

//   @override
//   State<ProfileUserEditInfoPage> createState() =>
//       _ProfileUserEditInfoPageState();
// }

// class _ProfileUserEditInfoPageState extends State<ProfileUserEditInfoPage> {
//   final _formKey = GlobalKey<FormState>();
//   bool isBottomSheetOpen = false;

//   @override
//   Widget build(BuildContext context) {
//     final safeTopPadding = MediaQuery.of(context).padding.top;
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         state.maybeMap(
//           unauthenticated: (_) {
//             logIt.warn('UserInfoPage [AuthBloc] unauthenticated');
//             context.router.popUntilRoot();
//           },
//           orElse: () {},
//         );
//       },
//       child: BlocConsumer<ProfileUserFormCubit, ProfileUserFormState>(
//         listenWhen: (previous, current) =>
//             previous.cancelSubscriptionOptionOfSuccessOrFailure !=
//                 current.cancelSubscriptionOptionOfSuccessOrFailure ||
//             previous.getPhoneVerificationCodeSuccessOrFailure !=
//                 current.getPhoneVerificationCodeSuccessOrFailure ||
//             previous.deleteUserOptionOfSuccessOrFailure !=
//                 current.deleteUserOptionOfSuccessOrFailure ||
//             previous.optionOfSuccessOrFailure !=
//                 current.optionOfSuccessOrFailure,
//         listener: (context, state) {
//           //* SUCCESS or FAILURE listener for FORM type of BLOC
//           state.optionOfSuccessOrFailure.fold(
//             () => null,
//             (a) => a.fold(
//               (alert) {
//                 scaffoldMessengerKey.currentState
//                   ?..hideCurrentSnackBar()
//                   ..showSnackBar(
//                     SnackBarHelper.createError(
//                       message: alert.message,
//                     ),
//                   );
//               },
//               (r) async {
//                 scaffoldMessengerKey.currentState
//                   ?..hideCurrentSnackBar()
//                   ..showSnackBar(
//                     SnackBarHelper.createSuccess(
//                       title: 'Hey, ${r.firstName}',
//                       message: context.l10n.successUpdateInfo,
//                       duration: const Duration(seconds: 2),
//                     ),
//                   );
//               },
//             ),
//           );
//           state.getPhoneVerificationCodeSuccessOrFailure.fold(
//             () => null,
//             (a) => a.fold(
//               (alert) {
//                 scaffoldMessengerKey.currentState
//                   ?..hideCurrentSnackBar()
//                   ..showSnackBar(
//                     SnackBarHelper.createError(
//                       message: alert.message,
//                     ),
//                   );
//               },
//               (r) async {
//                 // UniversalPlatform.isIOS
//                 //     ? showCupertinoModalBottomSheet(
//                 //         context: context,
//                 //         expand: true,
//                 //         enableDrag: false,
//                 //         backgroundColor: Colors.transparent,
//                 //         builder: (context) => const FilterCupertinoModalBottomSheet(),
//                 //       )
//                 //     :
//                 if (!isBottomSheetOpen) {
//                   isBottomSheetOpen = true;
//                   await showMaterialModalBottomSheet<void>(
//                     context: context,
//                     builder: (context) =>
//                         ProfileUsersPhoneVerifyModalBottomSheet(
//                       phoneNumber: r,
//                       onResendPressed: () async {
//                         await context
//                             .read<ProfileUserFormCubit>()
//                             .getPhoneVerificationCode(r);
//                       },
//                     ),
//                   ).whenComplete(() {
//                     isBottomSheetOpen = false;
//                   });
//                 }
//               },
//             ),
//           );
//           state.deleteUserOptionOfSuccessOrFailure.fold(
//             () => null,
//             (a) => a.fold(
//               (alert) {
//                 scaffoldMessengerKey.currentState
//                   ?..hideCurrentSnackBar()
//                   ..showSnackBar(
//                     SnackBarHelper.createError(
//                       message: alert.message,
//                     ),
//                   );
//               },
//               (r) async {
//                 scaffoldMessengerKey.currentState
//                   ?..hideCurrentSnackBar()
//                   ..showSnackBar(
//                     SnackBarHelper.createSuccess(
//                       title: context.l10n.success,
//                       message: context.l10n.accountDeleteSuccess,
//                       duration: const Duration(seconds: 2),
//                     ),
//                   );

//                 context.read<AuthBloc>().add(const AuthEvent.signedOut());
//               },
//             ),
//           );
//           state.cancelSubscriptionOptionOfSuccessOrFailure.fold(
//             () => null,
//             (a) => a.fold(
//               (alert) {
//                 scaffoldMessengerKey.currentState
//                   ?..hideCurrentSnackBar()
//                   ..showSnackBar(
//                     SnackBarHelper.createError(
//                       message: alert.message,
//                     ),
//                   );
//               },
//               (r) async {
//                 scaffoldMessengerKey.currentState
//                   ?..hideCurrentSnackBar()
//                   ..showSnackBar(
//                     SnackBarHelper.createSuccess(
//                       message: context.l10n.yourSubscriptionCancelledSuccess,
//                     ),
//                   );
//                 if (context.mounted) {
//                   await context.router.maybePop();
//                 }
//               },
//             ),
//           );
//         },
//         buildWhen: (previous, current) => previous != current,
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: Theme.of(context).brightness == Brightness.light
//                 ? $constants.palette.secondaryBackground
//                 : $constants.palette.darkBackground,
//             body: KeyboardDismisserWidget(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: ListView(
//                       padding: EdgeInsets.zero,
//                       physics: const ClampingScrollPhysics(),
//                       children: [
//                         Stack(
//                           children: [
//                             Column(
//                               children: [
//                                 //*------------------ PROFILE BACKGROUND IMAGE---------------------//
//                                 // if (state.userModel.subscription != null &&
//                                 //     state.userModel.subscription!.type == 'free')
//                                 //   CustomImage(
//                                 //     image: state.userModelForEditing.wallpaper ??
//                                 //         getProfileBackground(context),
//                                 //     height: getSize(context).height *
//                                 //         (getTabletType() ? 0.3 : 0.27),
//                                 //     width: getSize(context).width,
//                                 //   )
//                                 // else if (state.userModelForEditing.wallpaper !=
//                                 //         null &&
//                                 //     state.userBackgroundImageFile == null)
//                                 if (state.userModelForEditing.wallpaper !=
//                                         null &&
//                                     state.userBackgroundImageFile == null)
//                                   Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       CustomImage(
//                                         image:
//                                             (state.isDeleteUserBackgroundImageTriggered ==
//                                                         true
//                                                     ? getProfileBackground(
//                                                         context)
//                                                     : state.userModelForEditing
//                                                         .wallpaper) ??
//                                                 getProfileBackground(context),
//                                         height: getSize(context).height *
//                                             (getTabletType() ? 0.3 : 0.27),
//                                         width: getSize(context).width,
//                                       ),
//                                       Positioned(
//                                         top: safeTopPadding +
//                                             $constants.insets.sm,
//                                         right: $constants.insets.sm,
//                                         child: Card(
//                                           color: $constants.palette.black
//                                               .withOpacity(0.5),
//                                           shape: const CircleBorder(),
//                                           child: Padding(
//                                             padding: EdgeInsets.all(
//                                                 $constants.insets.xxs + 1),
//                                             child: InkWell(
//                                               onTap: !state.isLoading
//                                                   ? () async {
//                                                       //TODO: Implement IOS cupertino bottom sheet
//                                                       await showMaterialModalBottomSheet<
//                                                           void>(
//                                                         context: context,
//                                                         builder: (context) =>
//                                                             ProfileUsersImagePickerBottomSheet(
//                                                           isDeleteAvailable: (state
//                                                                           .userBackgroundImageFile !=
//                                                                       null ||
//                                                                   state.userModelForEditing
//                                                                           .wallpaper !=
//                                                                       null) &&
//                                                               state.isDeleteUserBackgroundImageTriggered ==
//                                                                   false,
//                                                           onTap:
//                                                               (pickedFile) async {
//                                                             await context
//                                                                 .read<
//                                                                     ProfileUserFormCubit>()
//                                                                 .userBackgroundImageFilePicked(
//                                                                   pickedFile,
//                                                                 );
//                                                           },
//                                                           onDeleteImageTap:
//                                                               (pickedFile) async {
//                                                             await context
//                                                                 .read<
//                                                                     ProfileUserFormCubit>()
//                                                                 .userBackgroundImageFilePicked(
//                                                                   pickedFile,
//                                                                   isDeleteImageTriggered:
//                                                                       true,
//                                                                 );
//                                                           },
//                                                         ),
//                                                       );
//                                                     }
//                                                   : () {},
//                                               borderRadius:
//                                                   BorderRadius.circular(100),
//                                               child: Icon(
//                                                 Icons.camera_alt_outlined,
//                                                 color: $constants.palette.white,
//                                                 size: getTabletType() ? 40 : 20,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 else
//                                   ProfileUsersBackgroundImagePickedFile(
//                                     pickedFile: state.userBackgroundImageFile,
//                                     onTap: !state.isLoading
//                                         ? () async {
//                                             //TODO: Implement IOS cupertino bottom sheet
//                                             await showMaterialModalBottomSheet<
//                                                 void>(
//                                               context: context,
//                                               builder: (context) =>
//                                                   ProfileUsersImagePickerBottomSheet(
//                                                 isDeleteAvailable: (state
//                                                                 .userBackgroundImageFile !=
//                                                             null ||
//                                                         state.userModelForEditing
//                                                                 .wallpaper !=
//                                                             null) &&
//                                                     state.isDeleteUserBackgroundImageTriggered ==
//                                                         false,
//                                                 onTap: (pickedFile) async {
//                                                   await context
//                                                       .read<
//                                                           ProfileUserFormCubit>()
//                                                       .userBackgroundImageFilePicked(
//                                                         pickedFile,
//                                                       );
//                                                 },
//                                                 onDeleteImageTap:
//                                                     (pickedFile) async {
//                                                   await context
//                                                       .read<
//                                                           ProfileUserFormCubit>()
//                                                       .userBackgroundImageFilePicked(
//                                                         pickedFile,
//                                                         isDeleteImageTriggered:
//                                                             true,
//                                                       );
//                                                 },
//                                               ),
//                                             );
//                                           }
//                                         : () {},
//                                   ),
//                                 //*------------------ PROFILE USER INFO ---------------------//
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color:
//                                         getThemeData(context).cardTheme.color,
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(
//                                           $constants.corners.md + 6),
//                                       bottomRight: Radius.circular(
//                                           $constants.corners.md + 6),
//                                     ),
//                                   ),
//                                   padding: EdgeInsets.fromLTRB(
//                                     $constants.insets.sm,
//                                     $constants.insets.lg + $constants.insets.sm,
//                                     $constants.insets.sm,
//                                     $constants.insets.sm,
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       //*------------------ USER NAME HOOK ---------------------//
//                                       ProfileUsersEditWithLabelHook(
//                                         text: state.userModelForEditing
//                                                 .firstName ??
//                                             '',
//                                         labelText: context.l10n.fullName,
//                                         onChanged: context
//                                             .read<ProfileUserFormCubit>()
//                                             .firstNameChanged,
//                                         validator: (value) {
//                                           if (value != null && value.isEmpty) {
//                                             return context.l10n.required;
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       SizedBox(height: $constants.insets.sm),
//                                       ProfileUsersEditWithLabelHook(
//                                         text:
//                                             state.userModelForEditing.bio ?? '',
//                                         labelText: 'Bio',
//                                         hintText: context.l10n.aboutYou,
//                                         minLines: 5,
//                                         onChanged: context
//                                             .read<ProfileUserFormCubit>()
//                                             .bioChanged,
//                                       ),
//                                       SizedBox(height: $constants.insets.sm),

//                                       //*------------------ BIRTHDAY ---------------------//
//                                       // ProfileBirthddayCard(
//                                       //   day: state.userModelForEditing.birthday?.day,
//                                       //   month:
//                                       //       state.userModelForEditing.birthday?.month,
//                                       //   year:
//                                       //       state.userModelForEditing.birthday?.year,
//                                       // ),
//                                       //
//                                       // SizedBox(height: $constants.insets.sm),
//                                       // //*------------------ GENDER ---------------------//
//                                       // ProfileItemCardWithDialog(
//                                       //   title: context.l10n.gender,
//                                       //   value: state.userModelForEditing.gender?.name,
//                                       //   onTap: () async {
//                                       //     await SimpleDialogHelper.showGendersDialog(
//                                       //       context,
//                                       //       state.genders,
//                                       //       state.userModelForEditing.gender,
//                                       //     ).then<void>((value) async {
//                                       //       if (value == null) return;
//                                       //       await context
//                                       //           .read<ProfileUserFormCubit>()
//                                       //           .changeGender(value);
//                                       //     });
//                                       //   },
//                                       // ),
//                                       // SizedBox(height: $constants.insets.sm),

//                                       //*------------------ USER PHONE ---------------------//
//                                       BlocBuilder<SettingsFormCubit,
//                                           SettingsFormState>(
//                                         buildWhen: (previous, current) =>
//                                             previous != current,
//                                         builder: (context, settingsState) {
//                                           //* Filters countries by server's response for countries
//                                           final filteredCountryIsoCodes =
//                                               <IsoCode>[];
//                                           for (final isoCode
//                                               in IsoCode.values) {
//                                             for (final country
//                                                 in settingsState.countries) {
//                                               if (isoCode.name ==
//                                                   country.code) {
//                                                 filteredCountryIsoCodes
//                                                     .add(isoCode);
//                                               }
//                                             }
//                                           }
//                                           return ValueListenableBuilder(
//                                             valueListenable:
//                                                 Hive.box<HiveCountry>(
//                                               $constants.hiveCountryBox,
//                                             ).listenable(),
//                                             builder:
//                                                 (context, hiveCountryBox, _) {
//                                               final hiveCountry = hiveCountryBox
//                                                       .values
//                                                       .toList()
//                                                       .isNotEmpty
//                                                   ? hiveCountryBox.values.first
//                                                   : null; //* If hiveCountryBox is not empty, get first and only object from it
//                                               //* If already country fetched and was assigned into local storage

//                                               IsoCode? defaultCountryIsoCode;
//                                               for (final isoCode
//                                                   in IsoCode.values) {
//                                                 if (hiveCountry != null) {
//                                                   if (isoCode.name ==
//                                                       hiveCountry.code) {
//                                                     defaultCountryIsoCode =
//                                                         isoCode;
//                                                   }
//                                                 } else if (settingsState
//                                                         .countryModel !=
//                                                     null) {
//                                                   if (isoCode.name ==
//                                                       settingsState
//                                                           .countryModel!.code) {
//                                                     defaultCountryIsoCode =
//                                                         isoCode;
//                                                   }
//                                                 }
//                                               }
//                                               return Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Padding(
//                                                     padding: EdgeInsets.only(
//                                                       bottom: $constants
//                                                               .insets.xxs +
//                                                           2,
//                                                     ),
//                                                     child: Text(
//                                                       context.l10n.phoneNumber,
//                                                       style:
//                                                           getTextTheme(context)
//                                                               .titleMedium!
//                                                               .copyWith(
//                                                                 fontSize:
//                                                                     responsiveFontSize(
//                                                                   context,
//                                                                   14.5,
//                                                                 ),
//                                                               ),
//                                                     ),
//                                                   ),
//                                                   //*------------------ USER MAIN PHONE / VERIFY ---------------------//
//                                                   Form(
//                                                     key: _formKey,
//                                                     child:
//                                                         ProfileUsersPhoneTextField(
//                                                       key: const Key(
//                                                         'mainPhone',
//                                                       ),
//                                                       phoneController:
//                                                           state.userMainPhone,
//                                                       defaultCountryIsoCode:
//                                                           defaultCountryIsoCode,
//                                                       filteredCountryIsoCodes:
//                                                           filteredCountryIsoCodes,
//                                                       textInputAction:
//                                                           TextInputAction.done,
//                                                       onChanged: (
//                                                         PhoneNumber? value,
//                                                       ) {
//                                                         context
//                                                             .read<
//                                                                 ProfileUserFormCubit>()
//                                                             .userMainPhoneValueChanged(
//                                                               value,
//                                                             );
//                                                       },
//                                                     ),
//                                                   ),
//                                                   //*------------------ USER VERIFICATION ---------------------//
//                                                   if (!((state.userModelForEditing
//                                                                   .phonesVerified !=
//                                                               null &&
//                                                           state
//                                                               .userModelForEditing
//                                                               .phonesVerified!
//                                                               .isNotEmpty) &&
//                                                       state.userModelForEditing
//                                                           .phonesVerified!
//                                                           .contains(
//                                                         '+${countriesCountryCode[state.userMainPhone?.value?.isoCode ?? IsoCode.TM] ?? '993'}${state.userMainPhone?.value?.nsn ?? '61234567'}',
//                                                       ))) ...[
//                                                     SizedBox(
//                                                         height: $constants
//                                                             .insets.sm),
//                                                     CustomElevatedGradientButton(
//                                                       onPressed: () async {
//                                                         if (state
//                                                                 .userMainPhone
//                                                                 ?.value
//                                                                 .nsn
//                                                                 .isNotEmpty ??
//                                                             false) {
//                                                           if (!state
//                                                               .isGettingPhoneVerificationCode) {
//                                                             await context
//                                                                 .read<
//                                                                     ProfileUserFormCubit>()
//                                                                 .getPhoneVerificationCode(
//                                                                   '+${countriesCountryCode[state.userMainPhone?.value?.isoCode ?? IsoCode.TM] ?? '993'}${state.userMainPhone?.value?.nsn ?? '61234567'}',
//                                                                 );
//                                                           }
//                                                         } else {
//                                                           await showSnackBar(
//                                                               'Enter your phone number first');
//                                                         }
//                                                       },
//                                                       size: Size(
//                                                         getSize(context).width,
//                                                         getTabletType()
//                                                             ? 87
//                                                             : 40,
//                                                       ),
//                                                       child: state
//                                                               .isGettingPhoneVerificationCode
//                                                           ? Center(
//                                                               child:
//                                                                   CustomLoadingIndicator(
//                                                                 isSizedBox:
//                                                                     true,
//                                                                 strokeWidth: 3,
//                                                                 height: 27,
//                                                                 width: 27,
//                                                                 color:
//                                                                     $constants
//                                                                         .palette
//                                                                         .white,
//                                                               ),
//                                                             )
//                                                           : Padding(
//                                                               padding:
//                                                                   EdgeInsets
//                                                                       .all(
//                                                                 $constants
//                                                                     .insets.xs,
//                                                               ),
//                                                               child: Text(
//                                                                 context.l10n
//                                                                     .verify,
//                                                                 maxLines: 2,
//                                                                 overflow:
//                                                                     TextOverflow
//                                                                         .ellipsis,
//                                                                 style:
//                                                                     getTextTheme(
//                                                                   context,
//                                                                 )
//                                                                         .titleMedium!
//                                                                         .copyWith(
//                                                                           fontSize:
//                                                                               responsiveFontSize(
//                                                                             context,
//                                                                             14.5,
//                                                                           ),
//                                                                           color: $constants
//                                                                               .palette
//                                                                               .white,
//                                                                         ),
//                                                               ),
//                                                             ),
//                                                     ),
//                                                   ],
//                                                 ],
//                                               );
//                                             },
//                                           );
//                                         },
//                                       ),
//                                       //*------------------ USER VERIFIED STATUS ---------------------//
//                                       if ((state.userModelForEditing
//                                                       .phonesVerified !=
//                                                   null &&
//                                               state
//                                                   .userModelForEditing
//                                                   .phonesVerified!
//                                                   .isNotEmpty) &&
//                                           state.userModelForEditing
//                                               .phonesVerified!
//                                               .contains(
//                                             '+${countriesCountryCode[state.userMainPhone?.value?.isoCode ?? IsoCode.TM] ?? '993'}${state.userMainPhone?.value?.nsn ?? '61234567'}',
//                                           ))
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                             top: $constants.insets.xxs + 2,
//                                           ),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.end,
//                                             children: [
//                                               SvgPicture.asset(
//                                                 'assets/check_circle.svg',
//                                                 height: 16,
//                                                 width: 16,
//                                               ),
//                                               Flexible(
//                                                 child: Padding(
//                                                   padding: EdgeInsets.only(
//                                                     left: $constants.insets.xxs,
//                                                   ),
//                                                   child: Text(
//                                                     context.l10n.verified,
//                                                     maxLines: 1,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     style: getTextTheme(context)
//                                                         .titleMedium!
//                                                         .copyWith(
//                                                           fontSize:
//                                                               responsiveFontSize(
//                                                             context,
//                                                             14.5,
//                                                           ),
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                           color: $constants
//                                                               .palette.green2,
//                                                         ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       SizedBox(height: $constants.insets.sm),
//                                       ProfileUsersEditWithLabelHook(
//                                         text: state.userModelForEditing.email ??
//                                             '',
//                                         labelText: context.l10n.email,
//                                         isReadOnly: true,
//                                       ),
//                                       //*------------------ USER ADDRESS LABEL ---------------------//
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                           top: $constants.insets.sm,
//                                           bottom: $constants.insets.xxs + 2,
//                                         ),
//                                         child: Text(
//                                           context.l10n.location,
//                                           style: getTextTheme(context)
//                                               .titleMedium!
//                                               .copyWith(
//                                                 fontSize: responsiveFontSize(
//                                                   context,
//                                                   14.5,
//                                                 ),
//                                               ),
//                                         ),
//                                       ),
//                                       //*------------------ USER ADDRESS HOOK ---------------------//
//                                       ProfileUsersAddressHook(
//                                         text: (state.userModelForEditing
//                                                     .isSelectedFromMap ??
//                                                 (state.userModelForEditing
//                                                             .location !=
//                                                         null &&
//                                                     state.userModelForEditing
//                                                         .location!.isNotEmpty))
//                                             ? (state.userModelForEditing
//                                                     .location ??
//                                                 '')
//                                             : (state.userModelForEditing
//                                                     .addressText ??
//                                                 ''),
//                                         hintText: context.l10n.address,
//                                         onChanged: context
//                                             .read<ProfileUserFormCubit>()
//                                             .addressChanged,
//                                         onDeleteField: () {
//                                           context
//                                               .read<ProfileUserFormCubit>()
//                                               .addressChanged('');
//                                         },
//                                       ),
//                                       //*------------------ ADDRESS (FROM MAP) ---------------------//
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                           top: $constants.insets.sm,
//                                         ),
//                                         child: state.userModelForEditing
//                                                     .isSelectedFromMap ??
//                                                 false
//                                             ? CustomTextButton(
//                                                 backgroundColor:
//                                                     $constants.palette.main,
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                   $constants.corners.md + 2,
//                                                 ),
//                                                 minimumSize: Size(
//                                                   getSize(context).width -
//                                                       (($constants.insets.sm +
//                                                               4) *
//                                                           2),
//                                                   getTabletType() ? 80 : 50,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     CustomSvgIcon(
//                                                       icon: 'address',
//                                                       color: $constants
//                                                           .palette.white,
//                                                     ),
//                                                     Padding(
//                                                       padding: EdgeInsets.only(
//                                                         left: $constants
//                                                             .insets.xs,
//                                                       ),
//                                                       child: Text(
//                                                         context
//                                                             .l10n.selectFromMap,
//                                                         style: getTextTheme(
//                                                                 context)
//                                                             .titleSmall!
//                                                             .copyWith(
//                                                               fontSize:
//                                                                   responsiveFontSize(
//                                                                 context,
//                                                                 12.75,
//                                                               ),
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400,
//                                                               color: $constants
//                                                                   .palette
//                                                                   .white,
//                                                             ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding: EdgeInsets.only(
//                                                         left: $constants
//                                                             .insets.sm,
//                                                       ),
//                                                       child: CustomSvgIcon(
//                                                         icon: 'custom_check',
//                                                         color: $constants
//                                                             .palette.white,
//                                                         size: 20,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 onPressed: () async {
//                                                   await context.router.push(
//                                                     GoogleMapsRoute(
//                                                       onAddressSelectedFromGoogleMaps:
//                                                           (pickResult,
//                                                               radius) async {
//                                                         await context
//                                                             .read<
//                                                                 ProfileUserFormCubit>()
//                                                             .addressSelectedFromMap(
//                                                               pickResult!,
//                                                             );
//                                                         if (context.mounted) {
//                                                           scaffoldMessengerKey
//                                                               .currentState
//                                                             ?..hideCurrentSnackBar()
//                                                             ..showSnackBar(
//                                                               SnackBarHelper
//                                                                   .createInformation(
//                                                                 message:
//                                                                     '${context.l10n.selectedFromMap}: ${pickResult.formattedAddress ?? ''}',
//                                                               ),
//                                                             );
//                                                         }
//                                                       },
//                                                     ),
//                                                   );
//                                                 },
//                                               )
//                                             : CustomOutlineChildButton(
//                                                 borderColor:
//                                                     $constants.palette.main,
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                   $constants.corners.md + 2,
//                                                 ),
//                                                 minimumSize: Size(
//                                                   getSize(context).width -
//                                                       (($constants.insets.sm +
//                                                               4) *
//                                                           2),
//                                                   getTabletType() ? 80 : 50,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     CustomSvgIcon(
//                                                       icon: 'address',
//                                                       color: $constants
//                                                           .palette.main,
//                                                     ),
//                                                     Padding(
//                                                       padding: EdgeInsets.only(
//                                                         left: $constants
//                                                             .insets.xs,
//                                                       ),
//                                                       child: Text(
//                                                         context
//                                                             .l10n.selectFromMap,
//                                                         style: getTextTheme(
//                                                                 context)
//                                                             .titleSmall!
//                                                             .copyWith(
//                                                               fontSize:
//                                                                   responsiveFontSize(
//                                                                 context,
//                                                                 12.75,
//                                                               ),
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400,
//                                                               color: $constants
//                                                                   .palette.main,
//                                                             ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 onPressed: () async {
//                                                   await context.router.push(
//                                                     GoogleMapsRoute(
//                                                       onAddressSelectedFromGoogleMaps:
//                                                           (pickResult,
//                                                               radius) async {
//                                                         await context
//                                                             .read<
//                                                                 ProfileUserFormCubit>()
//                                                             .addressSelectedFromMap(
//                                                               pickResult!,
//                                                             );
//                                                         if (context.mounted) {
//                                                           scaffoldMessengerKey
//                                                               .currentState
//                                                             ?..hideCurrentSnackBar()
//                                                             ..showSnackBar(
//                                                               SnackBarHelper
//                                                                   .createInformation(
//                                                                 message:
//                                                                     '${context.l10n.selectedFromMap}: ${pickResult.formattedAddress ?? ''}',
//                                                               ),
//                                                             );
//                                                         }
//                                                       },
//                                                     ),
//                                                   );
//                                                 },
//                                               ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             //*------------------ PROFILE USER IMAGE ---------------------//
//                             Positioned(
//                               top: getSize(context).height *
//                                       (getTabletType() ? 0.3 : 0.27) -
//                                   (getTabletType() ? 128 : 64),
//                               left: 0,
//                               right: 0,
//                               child: state.userModelForEditing.avatar != null &&
//                                       state.userImageFile == null
//                                   ? GestureDetector(
//                                       onTap: !state.isLoading
//                                           ? () async {
//                                               //TODO: Implement IOS cupertino bottom sheet
//                                               await showMaterialModalBottomSheet<
//                                                   void>(
//                                                 context: context,
//                                                 builder: (context) =>
//                                                     ProfileUsersImagePickerBottomSheet(
//                                                   isDeleteAvailable: (state
//                                                                   .userImageFile !=
//                                                               null ||
//                                                           state.userModelForEditing
//                                                                   .avatar !=
//                                                               null) &&
//                                                       state.isDeleteUserImageTriggered ==
//                                                           false,
//                                                   onTap: (pickedFile) async {
//                                                     await context
//                                                         .read<
//                                                             ProfileUserFormCubit>()
//                                                         .userImageFilePicked(
//                                                           pickedFile,
//                                                         );
//                                                   },
//                                                   onDeleteImageTap:
//                                                       (pickedFile) async {
//                                                     await context
//                                                         .read<
//                                                             ProfileUserFormCubit>()
//                                                         .userImageFilePicked(
//                                                           pickedFile,
//                                                           isDeleteImageTriggered:
//                                                               true,
//                                                         );
//                                                   },
//                                                 ),
//                                               );
//                                             }
//                                           : () {},
//                                       child: Stack(
//                                         alignment: Alignment.center,
//                                         children: [
//                                           ClipOval(
//                                             child: DecoratedBox(
//                                               decoration: BoxDecoration(
//                                                 color: $constants.palette.black
//                                                     .withOpacity(0.5),
//                                                 backgroundBlendMode:
//                                                     BlendMode.darken,
//                                               ),
//                                               child: ShaderMask(
//                                                 shaderCallback: (Rect bounds) {
//                                                   return LinearGradient(
//                                                     colors: [
//                                                       Colors.transparent,
//                                                       $constants.palette.black
//                                                           .withOpacity(0.25),
//                                                     ],
//                                                     begin: Alignment.center,
//                                                     end: Alignment.center,
//                                                   ).createShader(bounds);
//                                                 },
//                                                 blendMode: BlendMode.srcATop,
//                                                 child: state.userModelForEditing
//                                                                 .avatar !=
//                                                             null &&
//                                                         state.isDeleteUserImageTriggered ==
//                                                             false
//                                                     ? CustomBorderedAvatarImage(
//                                                         image: state
//                                                             .userModelForEditing
//                                                             .avatar,
//                                                         radius: 42.5,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           border: Border.all(
//                                                               width: 3,
//                                                               color: getThemeData(
//                                                                       context)
//                                                                   .scaffoldBackgroundColor),
//                                                         ),
//                                                         size: Size(
//                                                           getTabletType()
//                                                               ? 208
//                                                               : 104,
//                                                           getTabletType()
//                                                               ? 208
//                                                               : 104,
//                                                         ),
//                                                       )
//                                                     : CustomLottieAvatar(
//                                                         width: getTabletType()
//                                                             ? 208
//                                                             : 104,
//                                                         height: getTabletType()
//                                                             ? 208
//                                                             : 104,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           border: Border.all(
//                                                               width: 3,
//                                                               color: getThemeData(
//                                                                       context)
//                                                                   .scaffoldBackgroundColor),
//                                                         ),
//                                                       ),
//                                               ),
//                                             ),
//                                           ),
//                                           Card(
//                                             color: $constants.palette.black
//                                                 .withOpacity(0.5),
//                                             shape: const CircleBorder(),
//                                             child: Padding(
//                                               padding: EdgeInsets.all(
//                                                   $constants.insets.xxs + 1),
//                                               child: Icon(
//                                                 Icons.camera_alt_outlined,
//                                                 color: $constants.palette.white,
//                                                 size: getTabletType() ? 40 : 20,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   : GestureDetector(
//                                       onTap: !state.isLoading
//                                           ? () async {
//                                               //TODO: Implement IOS cupertino bottom sheet
//                                               await showMaterialModalBottomSheet<
//                                                   void>(
//                                                 context: context,
//                                                 builder: (context) =>
//                                                     ProfileUsersImagePickerBottomSheet(
//                                                   isDeleteAvailable: (state
//                                                                   .userImageFile !=
//                                                               null ||
//                                                           state.userModelForEditing
//                                                                   .avatar !=
//                                                               null) &&
//                                                       state.isDeleteUserImageTriggered ==
//                                                           false,
//                                                   onTap: (pickedFile) async {
//                                                     await context
//                                                         .read<
//                                                             ProfileUserFormCubit>()
//                                                         .userImageFilePicked(
//                                                           pickedFile,
//                                                         );
//                                                   },
//                                                   onDeleteImageTap:
//                                                       (pickedFile) async {
//                                                     await context
//                                                         .read<
//                                                             ProfileUserFormCubit>()
//                                                         .userImageFilePicked(
//                                                           pickedFile,
//                                                           isDeleteImageTriggered:
//                                                               true,
//                                                         );
//                                                   },
//                                                 ),
//                                               );
//                                             }
//                                           : () {},
//                                       child: ProfileUsersCircleAvatarPickedFile(
//                                         pickedFile: state.userImageFile,
//                                       ),
//                                     ),
//                             ),
//                             Positioned(
//                               top: safeTopPadding + $constants.insets.sm,
//                               left: $constants.insets.sm,
//                               child: const CustomOpacityBackButton(),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: $constants.insets.xxs + 2),
//                         Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                               $constants.corners.md + 6,
//                             ),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ProfileUsersItemCard(
//                                 title: context.l10n.hideMyPhone,
//                                 content: context.l10n.hideMyPhoneInfo,
//                                 value: state.userModelForEditing.mobileHidden ??
//                                     false,
//                                 onChanged: context
//                                     .read<ProfileUserFormCubit>()
//                                     .mobileHiddenChanged,
//                               ),
//                               Container(
//                                 height: 0.5,
//                                 margin: EdgeInsets.symmetric(
//                                   horizontal: $constants.insets.sm,
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: $constants.insets.xxs,
//                                 ),
//                                 color: getThemeData(context).canvasColor,
//                               ),
//                               ProfileUsersItemCard(
//                                 title: context.l10n.hideMyEmail,
//                                 content: context.l10n.hideMyEmailInfo,
//                                 value: state.userModelForEditing.emailHidden ??
//                                     false,
//                                 onChanged: context
//                                     .read<ProfileUserFormCubit>()
//                                     .emailHiddenChanged,
//                               ),
//                             ],
//                           ),
//                         ),
//                         if (state.userModelForEditing.subscription != null &&
//                             state.userModelForEditing.subscription!.type ==
//                                 'premium')
//                           SizedBox(height: $constants.insets.xxs + 2),
//                         if (state.userModelForEditing.subscription != null &&
//                             state.userModelForEditing.subscription!.type ==
//                                 'premium')
//                           Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                 $constants.corners.md + 6,
//                               ),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ProfileUsersSvgItemCard(
//                                   title: context.l10n.cancelSubscription,
//                                   onTap: () async {
//                                     await DialogHelper.showCustomAlertDialog(
//                                       context,
//                                       title: context.l10n.cancelSubscription,
//                                       content:
//                                           context.l10n.cancelSubscriptionInfo,
//                                       cancelText: context.l10n.back,
//                                       confirmText: context.l10n.cancel,
//                                     ).then<void>((value) async {
//                                       if (value ?? false) {
//                                         await context
//                                             .read<ProfileUserFormCubit>()
//                                             .cancelSubscription();
//                                       }
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         SizedBox(height: $constants.insets.xxs + 2),
//                         Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                               $constants.corners.md + 6,
//                             ),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ProfileUsersSvgItemCard(
//                                 title: context.l10n.deleteMyAccount,
//                                 svgName: 'assets/profile/delete.svg',
//                                 onTap: () async {
//                                   await DialogHelper.showCustomAlertDialog(
//                                     context,
//                                     title: context.l10n.deleteAccount,
//                                     content: context.l10n.deleteAccountInfo,
//                                     cancelText: context.l10n.cancel,
//                                     confirmText: context.l10n.delete,
//                                   ).then<void>((value) async {
//                                     if (value ?? false) {
//                                       await context
//                                           .read<ProfileUserFormCubit>()
//                                           .deleteUser();
//                                     }
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: $constants.insets.xxs + 2),
//                         Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                               $constants.corners.md + 6,
//                             ),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ProfileUsersSvgItemCard(
//                                 title: context.l10n.logout,
//                                 svgName: 'assets/profile/log_out.svg',
//                                 onTap: () async {
//                                   await DialogHelper.showCustomAlertDialog(
//                                     context,
//                                     title: context.l10n.logOut,
//                                     content: context.l10n.logOutInfo,
//                                     cancelText: context.l10n.cancel,
//                                     confirmText: context.l10n.logOut,
//                                   ).then<void>((value) async {
//                                     if (value ?? false) {
//                                       context
//                                           .read<AuthBloc>()
//                                           .add(const AuthEvent.signedOut());
//                                     }
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: $constants.insets.sm),
//                       ],
//                     ),
//                   ),
//                   //*--------------- SAVE BUTTON ---------------//
//                   DecoratedBox(
//                     decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0x10000000),
//                           blurRadius: 2,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//                     child: Card(
//                       shape: const RoundedRectangleBorder(),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: $constants.insets.sm + 4,
//                           horizontal: $constants.insets.sm,
//                         ),
//                         child: state.isLoading
//                             ? Center(
//                                 child: CustomLoadingIndicator(
//                                   isSizedBox: true,
//                                   height: 56,
//                                   width: 56,
//                                   color: $constants.palette.main,
//                                 ),
//                               )
//                             : CustomElevatedGradientButton(
//                                 onPressed: state.userModelForEditing.id !=
//                                             null ||
//                                         !state.isLoading
//                                     ? () async {
//                                         if (await checkRequiredFields(state) ==
//                                             true) {
//                                           if (context.mounted) {
//                                             await context
//                                                 .read<ProfileUserFormCubit>()
//                                                 .updateProfileUser();
//                                           }
//                                         }
//                                       }
//                                     : () {},
//                                 child: Text(
//                                   context.l10n.save,
//                                   style: getTextTheme(context)
//                                       .titleMedium!
//                                       .copyWith(
//                                         fontSize: responsiveFontSize(
//                                           context,
//                                           14.5,
//                                         ),
//                                         color: $constants.palette.white,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                 ),
//                               ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Future<bool> checkRequiredFields(ProfileUserFormState state) async {
//     if (state.userModelForEditing.firstName?.isEmpty ?? true) {
//       await showSnackBar(context.l10n.nameIsRequired);
//       return false;
//     }

//     return true;
//   }

//   Future<void> showSnackBar(String message) async {
//     scaffoldMessengerKey.currentState
//       ?..hideCurrentSnackBar()
//       ..showSnackBar(
//         SnackBarHelper.createError(
//           message: message,
//         ),
//       );
//     return;
//   }
// }
