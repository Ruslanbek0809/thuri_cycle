// import 'package:flipgoo_app/l10n/l10n.dart';
// import 'package:flipgoo_app/presentation/auth/widgets/profile_user_info_image_picker_item_card.dart';
// import 'package:flipgoo_app/presentation/core/utils/constants.dart';
// import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_bar_for_bottom_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class CustomVideoPickerBottomSheet extends StatefulWidget {
//   const CustomVideoPickerBottomSheet({
//     this.onTap,
//     super.key,
//   });
//   final Future<void> Function(XFile?)? onTap;

//   @override
//   State<CustomVideoPickerBottomSheet> createState() =>
//       _CustomVideoPickerBottomSheetState();
// }

// class _CustomVideoPickerBottomSheetState
//     extends State<CustomVideoPickerBottomSheet> {
//   final ImagePicker _picker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: getThemeData(context).scaffoldBackgroundColor,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular($constants.corners.md * 2 + 4),
//         ),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
//       child: SingleChildScrollView(
//         controller: ModalScrollController.of(context),
//         padding:
//             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: Column(
//           mainAxisSize: MainAxisSize
//               .min, //* RENDERS exact height of all its children elements.
//           children: [
//             //*-------------- CUSTOM BAR for BOTTOM SHEET -------------- //
//             const CustomBarForBottomSheet(),
//             ProfileUserInfoImagePickerItemCard(
//               icon: Icons.camera_alt_outlined,
//               title: context.l10n.camera,
//               borderRadius: BorderRadius.zero,
//               isNextWidgetAvailable: true,
//               onTap: () async {
//                 try {
//                   final pickedFile = await _picker.pickVideo(
//                     source: ImageSource.camera,
//                   );
//                   if (context.mounted) {
//                     if (pickedFile != null) {
//                       await widget.onTap!(pickedFile);
//                     }
//                   }
//                 } catch (e) {
//                   setState(() {});
//                 }
//                 if (context.mounted) {
//                   Navigator.pop(context);
//                 }
//               },
//             ),
//             ProfileUserInfoImagePickerItemCard(
//               icon: Icons.photo,
//               title: context.l10n.gallery,
//               borderRadius: BorderRadius.zero,
//               onTap: () async {
//                 try {
//                   final pickedFile = await _picker.pickVideo(
//                     source: ImageSource.gallery,
//                   );
//                   if (context.mounted) {
//                     if (pickedFile != null) {
//                       await widget.onTap!(pickedFile);
//                     }
//                   }
//                 } catch (e) {
//                   setState(() {});
//                 }
//                 if (context.mounted) {
//                   Navigator.pop(context);
//                 }
//               },
//             ),
//             SizedBox(height: $constants.insets.sm),
//           ],
//         ),
//       ),
//     );
//   }
// }
