// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportFormState {
  MarkerType? get markerType => throw _privateConstructorUsedError;
  List<ImageWithFileModel> get images => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get submissionSuccess => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  MapMarkerModel? get createdMarker => throw _privateConstructorUsedError;
  String? get imageUploadError => throw _privateConstructorUsedError;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportFormStateCopyWith<ReportFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportFormStateCopyWith<$Res> {
  factory $ReportFormStateCopyWith(
          ReportFormState value, $Res Function(ReportFormState) then) =
      _$ReportFormStateCopyWithImpl<$Res, ReportFormState>;
  @useResult
  $Res call(
      {MarkerType? markerType,
      List<ImageWithFileModel> images,
      bool isSubmitting,
      bool submissionSuccess,
      String? errorMessage,
      MapMarkerModel? createdMarker,
      String? imageUploadError});

  $MapMarkerModelCopyWith<$Res>? get createdMarker;
}

/// @nodoc
class _$ReportFormStateCopyWithImpl<$Res, $Val extends ReportFormState>
    implements $ReportFormStateCopyWith<$Res> {
  _$ReportFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markerType = freezed,
    Object? images = null,
    Object? isSubmitting = null,
    Object? submissionSuccess = null,
    Object? errorMessage = freezed,
    Object? createdMarker = freezed,
    Object? imageUploadError = freezed,
  }) {
    return _then(_value.copyWith(
      markerType: freezed == markerType
          ? _value.markerType
          : markerType // ignore: cast_nullable_to_non_nullable
              as MarkerType?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageWithFileModel>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      submissionSuccess: null == submissionSuccess
          ? _value.submissionSuccess
          : submissionSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdMarker: freezed == createdMarker
          ? _value.createdMarker
          : createdMarker // ignore: cast_nullable_to_non_nullable
              as MapMarkerModel?,
      imageUploadError: freezed == imageUploadError
          ? _value.imageUploadError
          : imageUploadError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MapMarkerModelCopyWith<$Res>? get createdMarker {
    if (_value.createdMarker == null) {
      return null;
    }

    return $MapMarkerModelCopyWith<$Res>(_value.createdMarker!, (value) {
      return _then(_value.copyWith(createdMarker: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportFormStateImplCopyWith<$Res>
    implements $ReportFormStateCopyWith<$Res> {
  factory _$$ReportFormStateImplCopyWith(_$ReportFormStateImpl value,
          $Res Function(_$ReportFormStateImpl) then) =
      __$$ReportFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MarkerType? markerType,
      List<ImageWithFileModel> images,
      bool isSubmitting,
      bool submissionSuccess,
      String? errorMessage,
      MapMarkerModel? createdMarker,
      String? imageUploadError});

  @override
  $MapMarkerModelCopyWith<$Res>? get createdMarker;
}

/// @nodoc
class __$$ReportFormStateImplCopyWithImpl<$Res>
    extends _$ReportFormStateCopyWithImpl<$Res, _$ReportFormStateImpl>
    implements _$$ReportFormStateImplCopyWith<$Res> {
  __$$ReportFormStateImplCopyWithImpl(
      _$ReportFormStateImpl _value, $Res Function(_$ReportFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markerType = freezed,
    Object? images = null,
    Object? isSubmitting = null,
    Object? submissionSuccess = null,
    Object? errorMessage = freezed,
    Object? createdMarker = freezed,
    Object? imageUploadError = freezed,
  }) {
    return _then(_$ReportFormStateImpl(
      markerType: freezed == markerType
          ? _value.markerType
          : markerType // ignore: cast_nullable_to_non_nullable
              as MarkerType?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageWithFileModel>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      submissionSuccess: null == submissionSuccess
          ? _value.submissionSuccess
          : submissionSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdMarker: freezed == createdMarker
          ? _value.createdMarker
          : createdMarker // ignore: cast_nullable_to_non_nullable
              as MapMarkerModel?,
      imageUploadError: freezed == imageUploadError
          ? _value.imageUploadError
          : imageUploadError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReportFormStateImpl implements _ReportFormState {
  const _$ReportFormStateImpl(
      {required this.markerType,
      required final List<ImageWithFileModel> images,
      required this.isSubmitting,
      required this.submissionSuccess,
      this.errorMessage,
      this.createdMarker,
      this.imageUploadError})
      : _images = images;

  @override
  final MarkerType? markerType;
  final List<ImageWithFileModel> _images;
  @override
  List<ImageWithFileModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final bool isSubmitting;
  @override
  final bool submissionSuccess;
  @override
  final String? errorMessage;
  @override
  final MapMarkerModel? createdMarker;
  @override
  final String? imageUploadError;

  @override
  String toString() {
    return 'ReportFormState(markerType: $markerType, images: $images, isSubmitting: $isSubmitting, submissionSuccess: $submissionSuccess, errorMessage: $errorMessage, createdMarker: $createdMarker, imageUploadError: $imageUploadError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportFormStateImpl &&
            (identical(other.markerType, markerType) ||
                other.markerType == markerType) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.submissionSuccess, submissionSuccess) ||
                other.submissionSuccess == submissionSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.createdMarker, createdMarker) ||
                other.createdMarker == createdMarker) &&
            (identical(other.imageUploadError, imageUploadError) ||
                other.imageUploadError == imageUploadError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      markerType,
      const DeepCollectionEquality().hash(_images),
      isSubmitting,
      submissionSuccess,
      errorMessage,
      createdMarker,
      imageUploadError);

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportFormStateImplCopyWith<_$ReportFormStateImpl> get copyWith =>
      __$$ReportFormStateImplCopyWithImpl<_$ReportFormStateImpl>(
          this, _$identity);
}

abstract class _ReportFormState implements ReportFormState {
  const factory _ReportFormState(
      {required final MarkerType? markerType,
      required final List<ImageWithFileModel> images,
      required final bool isSubmitting,
      required final bool submissionSuccess,
      final String? errorMessage,
      final MapMarkerModel? createdMarker,
      final String? imageUploadError}) = _$ReportFormStateImpl;

  @override
  MarkerType? get markerType;
  @override
  List<ImageWithFileModel> get images;
  @override
  bool get isSubmitting;
  @override
  bool get submissionSuccess;
  @override
  String? get errorMessage;
  @override
  MapMarkerModel? get createdMarker;
  @override
  String? get imageUploadError;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportFormStateImplCopyWith<_$ReportFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
