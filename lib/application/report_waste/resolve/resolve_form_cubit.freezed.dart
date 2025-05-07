// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolve_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResolveFormState {
  List<ImageWithFileModel> get resolvedImages =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get submissionSuccess => throw _privateConstructorUsedError;
  Option<Either<FirebaseFailure, MapMarkerModel>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  MapMarkerModel? get createdMarker => throw _privateConstructorUsedError;
  String? get imageUploadError => throw _privateConstructorUsedError;

  /// Create a copy of ResolveFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResolveFormStateCopyWith<ResolveFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResolveFormStateCopyWith<$Res> {
  factory $ResolveFormStateCopyWith(
          ResolveFormState value, $Res Function(ResolveFormState) then) =
      _$ResolveFormStateCopyWithImpl<$Res, ResolveFormState>;
  @useResult
  $Res call(
      {List<ImageWithFileModel> resolvedImages,
      bool isSubmitting,
      bool submissionSuccess,
      Option<Either<FirebaseFailure, MapMarkerModel>> failureOrSuccessOption,
      String? errorMessage,
      MapMarkerModel? createdMarker,
      String? imageUploadError});

  $MapMarkerModelCopyWith<$Res>? get createdMarker;
}

/// @nodoc
class _$ResolveFormStateCopyWithImpl<$Res, $Val extends ResolveFormState>
    implements $ResolveFormStateCopyWith<$Res> {
  _$ResolveFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResolveFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolvedImages = null,
    Object? isSubmitting = null,
    Object? submissionSuccess = null,
    Object? failureOrSuccessOption = null,
    Object? errorMessage = freezed,
    Object? createdMarker = freezed,
    Object? imageUploadError = freezed,
  }) {
    return _then(_value.copyWith(
      resolvedImages: null == resolvedImages
          ? _value.resolvedImages
          : resolvedImages // ignore: cast_nullable_to_non_nullable
              as List<ImageWithFileModel>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      submissionSuccess: null == submissionSuccess
          ? _value.submissionSuccess
          : submissionSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FirebaseFailure, MapMarkerModel>>,
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

  /// Create a copy of ResolveFormState
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
abstract class _$$ResolveFormStateImplCopyWith<$Res>
    implements $ResolveFormStateCopyWith<$Res> {
  factory _$$ResolveFormStateImplCopyWith(_$ResolveFormStateImpl value,
          $Res Function(_$ResolveFormStateImpl) then) =
      __$$ResolveFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ImageWithFileModel> resolvedImages,
      bool isSubmitting,
      bool submissionSuccess,
      Option<Either<FirebaseFailure, MapMarkerModel>> failureOrSuccessOption,
      String? errorMessage,
      MapMarkerModel? createdMarker,
      String? imageUploadError});

  @override
  $MapMarkerModelCopyWith<$Res>? get createdMarker;
}

/// @nodoc
class __$$ResolveFormStateImplCopyWithImpl<$Res>
    extends _$ResolveFormStateCopyWithImpl<$Res, _$ResolveFormStateImpl>
    implements _$$ResolveFormStateImplCopyWith<$Res> {
  __$$ResolveFormStateImplCopyWithImpl(_$ResolveFormStateImpl _value,
      $Res Function(_$ResolveFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResolveFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolvedImages = null,
    Object? isSubmitting = null,
    Object? submissionSuccess = null,
    Object? failureOrSuccessOption = null,
    Object? errorMessage = freezed,
    Object? createdMarker = freezed,
    Object? imageUploadError = freezed,
  }) {
    return _then(_$ResolveFormStateImpl(
      resolvedImages: null == resolvedImages
          ? _value._resolvedImages
          : resolvedImages // ignore: cast_nullable_to_non_nullable
              as List<ImageWithFileModel>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      submissionSuccess: null == submissionSuccess
          ? _value.submissionSuccess
          : submissionSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FirebaseFailure, MapMarkerModel>>,
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

class _$ResolveFormStateImpl implements _ResolveFormState {
  const _$ResolveFormStateImpl(
      {required final List<ImageWithFileModel> resolvedImages,
      required this.isSubmitting,
      required this.submissionSuccess,
      required this.failureOrSuccessOption,
      this.errorMessage,
      this.createdMarker,
      this.imageUploadError})
      : _resolvedImages = resolvedImages;

  final List<ImageWithFileModel> _resolvedImages;
  @override
  List<ImageWithFileModel> get resolvedImages {
    if (_resolvedImages is EqualUnmodifiableListView) return _resolvedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resolvedImages);
  }

  @override
  final bool isSubmitting;
  @override
  final bool submissionSuccess;
  @override
  final Option<Either<FirebaseFailure, MapMarkerModel>> failureOrSuccessOption;
  @override
  final String? errorMessage;
  @override
  final MapMarkerModel? createdMarker;
  @override
  final String? imageUploadError;

  @override
  String toString() {
    return 'ResolveFormState(resolvedImages: $resolvedImages, isSubmitting: $isSubmitting, submissionSuccess: $submissionSuccess, failureOrSuccessOption: $failureOrSuccessOption, errorMessage: $errorMessage, createdMarker: $createdMarker, imageUploadError: $imageUploadError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResolveFormStateImpl &&
            const DeepCollectionEquality()
                .equals(other._resolvedImages, _resolvedImages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.submissionSuccess, submissionSuccess) ||
                other.submissionSuccess == submissionSuccess) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
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
      const DeepCollectionEquality().hash(_resolvedImages),
      isSubmitting,
      submissionSuccess,
      failureOrSuccessOption,
      errorMessage,
      createdMarker,
      imageUploadError);

  /// Create a copy of ResolveFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResolveFormStateImplCopyWith<_$ResolveFormStateImpl> get copyWith =>
      __$$ResolveFormStateImplCopyWithImpl<_$ResolveFormStateImpl>(
          this, _$identity);
}

abstract class _ResolveFormState implements ResolveFormState {
  const factory _ResolveFormState(
      {required final List<ImageWithFileModel> resolvedImages,
      required final bool isSubmitting,
      required final bool submissionSuccess,
      required final Option<Either<FirebaseFailure, MapMarkerModel>>
          failureOrSuccessOption,
      final String? errorMessage,
      final MapMarkerModel? createdMarker,
      final String? imageUploadError}) = _$ResolveFormStateImpl;

  @override
  List<ImageWithFileModel> get resolvedImages;
  @override
  bool get isSubmitting;
  @override
  bool get submissionSuccess;
  @override
  Option<Either<FirebaseFailure, MapMarkerModel>> get failureOrSuccessOption;
  @override
  String? get errorMessage;
  @override
  MapMarkerModel? get createdMarker;
  @override
  String? get imageUploadError;

  /// Create a copy of ResolveFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResolveFormStateImplCopyWith<_$ResolveFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
