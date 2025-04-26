// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_with_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageWithFileModel {
  File get file => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  /// Create a copy of ImageWithFileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageWithFileModelCopyWith<ImageWithFileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageWithFileModelCopyWith<$Res> {
  factory $ImageWithFileModelCopyWith(
          ImageWithFileModel value, $Res Function(ImageWithFileModel) then) =
      _$ImageWithFileModelCopyWithImpl<$Res, ImageWithFileModel>;
  @useResult
  $Res call({File file, String path});
}

/// @nodoc
class _$ImageWithFileModelCopyWithImpl<$Res, $Val extends ImageWithFileModel>
    implements $ImageWithFileModelCopyWith<$Res> {
  _$ImageWithFileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageWithFileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageWithFileModelImplCopyWith<$Res>
    implements $ImageWithFileModelCopyWith<$Res> {
  factory _$$ImageWithFileModelImplCopyWith(_$ImageWithFileModelImpl value,
          $Res Function(_$ImageWithFileModelImpl) then) =
      __$$ImageWithFileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File file, String path});
}

/// @nodoc
class __$$ImageWithFileModelImplCopyWithImpl<$Res>
    extends _$ImageWithFileModelCopyWithImpl<$Res, _$ImageWithFileModelImpl>
    implements _$$ImageWithFileModelImplCopyWith<$Res> {
  __$$ImageWithFileModelImplCopyWithImpl(_$ImageWithFileModelImpl _value,
      $Res Function(_$ImageWithFileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageWithFileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? path = null,
  }) {
    return _then(_$ImageWithFileModelImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageWithFileModelImpl implements _ImageWithFileModel {
  const _$ImageWithFileModelImpl({required this.file, required this.path});

  @override
  final File file;
  @override
  final String path;

  @override
  String toString() {
    return 'ImageWithFileModel(file: $file, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageWithFileModelImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, path);

  /// Create a copy of ImageWithFileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageWithFileModelImplCopyWith<_$ImageWithFileModelImpl> get copyWith =>
      __$$ImageWithFileModelImplCopyWithImpl<_$ImageWithFileModelImpl>(
          this, _$identity);
}

abstract class _ImageWithFileModel implements ImageWithFileModel {
  const factory _ImageWithFileModel(
      {required final File file,
      required final String path}) = _$ImageWithFileModelImpl;

  @override
  File get file;
  @override
  String get path;

  /// Create a copy of ImageWithFileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageWithFileModelImplCopyWith<_$ImageWithFileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
