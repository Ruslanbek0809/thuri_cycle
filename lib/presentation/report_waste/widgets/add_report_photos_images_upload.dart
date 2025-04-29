// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:flipgoo_app/l10n/l10n.dart';
// import 'package:flipgoo_app/presentation/core/utils/constants.dart';
// import 'package:flipgoo_app/presentation/core/utils/methods/shortcuts.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_loading_indicator.dart';
// import 'package:flipgoo_app/presentation/core/widgets/custom/custom_svg_icon.dart';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';

// class AddReportPhotosUpload extends StatelessWidget {
//   const AddReportPhotosUpload({
//     required this.imageFileList,
//     required this.uploadedImages,
//     required this.uploadedCoverImage,
//     required this.coverImageFile,
//     this.isUploadingImage = false,
//     this.isUploadingCoverImage = false,
//     this.onDeleteTap,
//     this.onTap,
//     this.onCoverImageTap,
//     this.onCoverImageDeleteTap,
//     super.key,
//   });

//   final List<CroppedFile?> imageFileList;
//   final List<UploadedImageModel> uploadedImages;
//   final UploadedImageModel? uploadedCoverImage;
//   final CroppedFile? coverImageFile;
//   final bool isUploadingImage;
//   final bool isUploadingCoverImage;
//   final Future<void> Function(CroppedFile?)? onDeleteTap;
//   final Future<void> Function()? onTap;
//   final Future<void> Function()? onCoverImageTap;
//   final Future<void> Function()? onCoverImageDeleteTap;

//   @override
//   Widget build(BuildContext context) {
//     final boxConstraints = (getSize(context).width -
//             2 * ($constants.insets.sm + $constants.insets.xs + 6)) /
//         3;

//     return Wrap(
//       spacing: $constants.insets.xs + 2,
//       runSpacing: $constants.insets.xs + 2,
//       crossAxisAlignment: WrapCrossAlignment.center,
//       runAlignment: WrapAlignment.center,
//       children: [
//         InkWell(
//           borderRadius: BorderRadius.circular(
//             $constants.corners.md + 2,
//           ),
//           onTap: onCoverImageTap,
//           child: Stack(
//             children: [
//               if (coverImageFile != null)
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(
//                     $constants.corners.md + 2,
//                   ),
//                   child: Image.file(
//                     File(
//                       coverImageFile!.path,
//                     ),
//                     width: boxConstraints,
//                     height: boxConstraints,
//                     fit: BoxFit.cover,
//                     errorBuilder: (
//                       BuildContext context,
//                       Object error,
//                       StackTrace? stackTrace,
//                     ) {
//                       return const Center(
//                         child: Text(
//                           'This image type is not supported',
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               else
//                 DottedBorder(
//                   borderType: BorderType.RRect,
//                   color: getThemeData(context).canvasColor,
//                   dashPattern: const [5, 5],
//                   strokeWidth: 2,
//                   radius: Radius.circular(
//                     $constants.corners.md + 2,
//                   ),
//                   padding: EdgeInsets.zero,
//                   child: Container(
//                     height: boxConstraints,
//                     width: boxConstraints,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                         $constants.corners.md + 2,
//                       ),
//                       color: getThemeData(context).cardTheme.color,
//                     ),
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.add_circle_rounded,
//                             color: getThemeData(context).canvasColor,
//                             size: 28,
//                           ),
//                           SizedBox(height: $constants.insets.xxs),
//                           Text(
//                             context.l10n.cover,
//                             textAlign: TextAlign.center,
//                             style: getTextTheme(
//                               context,
//                             ).titleMedium!.copyWith(
//                                   fontSize: responsiveFontSize(
//                                     context,
//                                     11,
//                                   ),
//                                   fontWeight: FontWeight.w600,
//                                   color: getThemeData(context).canvasColor,
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               //* DELETE PART
//               if (coverImageFile != null)
//                 Positioned(
//                   top: $constants.insets.xxs,
//                   right: $constants.insets.xxs,
//                   child: Card(
//                     color: const Color(0x66000000),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                         $constants.corners.sm + 2,
//                       ),
//                     ),
//                     child: InkWell(
//                       onTap: onCoverImageDeleteTap,
//                       child: Padding(
//                         padding: EdgeInsets.all(
//                           $constants.insets.xxs + 1,
//                         ),
//                         child: CustomSvgIcon(
//                           icon: 'profile/delete',
//                           color: $constants.palette.white,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               //* LOADING above image
//               if (isUploadingCoverImage)
//                 Container(
//                   width: boxConstraints,
//                   height: boxConstraints,
//                   padding: EdgeInsets.all(
//                     $constants.insets.xs,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(
//                       0.5,
//                     ),
//                     borderRadius: BorderRadius.circular(
//                       $constants.corners.md + 2,
//                     ),
//                     backgroundBlendMode: BlendMode.darken,
//                   ),
//                   child: ShaderMask(
//                     shaderCallback: (
//                       Rect bounds,
//                     ) {
//                       return LinearGradient(
//                         colors: [
//                           Colors.transparent,
//                           $constants.palette.black.withOpacity(
//                             0.25,
//                           ),
//                         ],
//                         begin: Alignment.center,
//                         end: Alignment.center,
//                       ).createShader(
//                         bounds,
//                       );
//                     },
//                     blendMode: BlendMode.srcATop,
//                     child: CustomLoadingIndicator(
//                       color: $constants.palette.white,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//         ...imageFileList.map(
//           (imageFile) {
//             final isUploading = isUploadingImage &&
//                 !uploadedImages.any(
//                   (uploadedImage) => uploadedImage.croppedFile == imageFile,
//                 );
//             return Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(
//                     $constants.corners.md + 2,
//                   ),
//                   child: Image.file(
//                     File(
//                       imageFile!.path,
//                     ),
//                     width: boxConstraints,
//                     height: boxConstraints,
//                     fit: BoxFit.cover,
//                     errorBuilder: (
//                       BuildContext context,
//                       Object error,
//                       StackTrace? stackTrace,
//                     ) {
//                       return const Center(
//                         child: Text(
//                           'This image type is not supported',
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 //* DELETE PART
//                 Positioned(
//                   top: $constants.insets.xxs,
//                   right: $constants.insets.xxs,
//                   child: Card(
//                     color: const Color(0x66000000),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                         $constants.corners.sm + 2,
//                       ),
//                     ),
//                     child: InkWell(
//                       onTap: () async {
//                         await onDeleteTap!(imageFile);
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.all(
//                           $constants.insets.xxs + 1,
//                         ),
//                         child: CustomSvgIcon(
//                           icon: 'profile/delete',
//                           color: $constants.palette.white,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 //* LOADING above image
//                 if (isUploading)
//                   Container(
//                     width: boxConstraints,
//                     height: boxConstraints,
//                     padding: EdgeInsets.all(
//                       $constants.insets.xs,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(
//                         0.5,
//                       ),
//                       borderRadius: BorderRadius.circular(
//                         $constants.corners.md + 2,
//                       ),
//                       backgroundBlendMode: BlendMode.darken,
//                     ),
//                     child: ShaderMask(
//                       shaderCallback: (
//                         Rect bounds,
//                       ) {
//                         return LinearGradient(
//                           colors: [
//                             Colors.transparent,
//                             $constants.palette.black.withOpacity(
//                               0.25,
//                             ),
//                           ],
//                           begin: Alignment.center,
//                           end: Alignment.center,
//                         ).createShader(
//                           bounds,
//                         );
//                       },
//                       blendMode: BlendMode.srcATop,
//                       child: CustomLoadingIndicator(
//                         color: $constants.palette.white,
//                       ),
//                     ),
//                   ),
//               ],
//             );
//           },
//         ),
//         //*----------------- PICTURE ADD PLACEHOLDER---------------------//
//         // if (imageFileList.isNotEmpty)
//         InkWell(
//           borderRadius: BorderRadius.circular(
//             $constants.corners.md + 2,
//           ),
//           onTap: onTap,
//           child: DottedBorder(
//             borderType: BorderType.RRect,
//             color: getThemeData(context).canvasColor,
//             dashPattern: const [5, 5],
//             strokeWidth: 2,
//             radius: Radius.circular(
//               $constants.corners.md + 2,
//             ),
//             padding: EdgeInsets.zero,
//             child: Container(
//               height: boxConstraints,
//               width: boxConstraints,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   $constants.corners.md + 2,
//                 ),
//                 color: getThemeData(context).cardTheme.color,
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.add_circle_rounded,
//                       color: getThemeData(context).canvasColor,
//                       size: 28,
//                     ),
//                     SizedBox(height: $constants.insets.xxs),
//                     Text(
//                       imageFileList.isEmpty
//                           ? context.l10n.front
//                           : imageFileList.length == 1
//                               ? context.l10n.back
//                               : imageFileList.length == 2
//                                   ? context.l10n.label
//                                   : context.l10n.details,
//                       textAlign: TextAlign.center,
//                       style: getTextTheme(
//                         context,
//                       ).titleMedium!.copyWith(
//                             fontSize: responsiveFontSize(
//                               context,
//                               11,
//                             ),
//                             fontWeight: FontWeight.w600,
//                             color: getThemeData(context).canvasColor,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
