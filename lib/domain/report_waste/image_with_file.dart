import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_with_file.freezed.dart';

@freezed
class ImageWithFileModel with _$ImageWithFileModel {
  const factory ImageWithFileModel({
    required File file,
    required String path,
  }) = _ImageWithFileModel;
}
