// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get wallpaper => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_iso_code')
  String? get mobileIsoCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'phones')
  List<String>? get phonesVerified => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_hidden')
  bool? get emailHidden => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_hidden')
  bool? get mobileHidden => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_joined')
  DateTime? get dateJoined => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  num? get latitude => throw _privateConstructorUsedError;
  num? get longitude => throw _privateConstructorUsedError;
  bool? get isSelectedFromMap =>
      throw _privateConstructorUsedError; //* NOT used for server-side
  @JsonKey(name: 'last_seen_at')
  String? get lastSeenAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int? id,
      String? username,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? bio,
      DateTime? birthday,
      String? avatar,
      String? wallpaper,
      String? mobile,
      @JsonKey(name: 'mobile_iso_code') String? mobileIsoCode,
      @JsonKey(name: 'phones') List<String>? phonesVerified,
      String? email,
      @JsonKey(name: 'email_hidden') bool? emailHidden,
      @JsonKey(name: 'mobile_hidden') bool? mobileHidden,
      DateTime? createdAt,
      DateTime? updatedAt,
      @JsonKey(name: 'date_joined') DateTime? dateJoined,
      String? location,
      num? latitude,
      num? longitude,
      bool? isSelectedFromMap,
      @JsonKey(name: 'last_seen_at') String? lastSeenAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? bio = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? wallpaper = freezed,
    Object? mobile = freezed,
    Object? mobileIsoCode = freezed,
    Object? phonesVerified = freezed,
    Object? email = freezed,
    Object? emailHidden = freezed,
    Object? mobileHidden = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? dateJoined = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isSelectedFromMap = freezed,
    Object? lastSeenAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      wallpaper: freezed == wallpaper
          ? _value.wallpaper
          : wallpaper // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileIsoCode: freezed == mobileIsoCode
          ? _value.mobileIsoCode
          : mobileIsoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phonesVerified: freezed == phonesVerified
          ? _value.phonesVerified
          : phonesVerified // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailHidden: freezed == emailHidden
          ? _value.emailHidden
          : emailHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileHidden: freezed == mobileHidden
          ? _value.mobileHidden
          : mobileHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateJoined: freezed == dateJoined
          ? _value.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      isSelectedFromMap: freezed == isSelectedFromMap
          ? _value.isSelectedFromMap
          : isSelectedFromMap // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? username,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? bio,
      DateTime? birthday,
      String? avatar,
      String? wallpaper,
      String? mobile,
      @JsonKey(name: 'mobile_iso_code') String? mobileIsoCode,
      @JsonKey(name: 'phones') List<String>? phonesVerified,
      String? email,
      @JsonKey(name: 'email_hidden') bool? emailHidden,
      @JsonKey(name: 'mobile_hidden') bool? mobileHidden,
      DateTime? createdAt,
      DateTime? updatedAt,
      @JsonKey(name: 'date_joined') DateTime? dateJoined,
      String? location,
      num? latitude,
      num? longitude,
      bool? isSelectedFromMap,
      @JsonKey(name: 'last_seen_at') String? lastSeenAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? bio = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? wallpaper = freezed,
    Object? mobile = freezed,
    Object? mobileIsoCode = freezed,
    Object? phonesVerified = freezed,
    Object? email = freezed,
    Object? emailHidden = freezed,
    Object? mobileHidden = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? dateJoined = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isSelectedFromMap = freezed,
    Object? lastSeenAt = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      wallpaper: freezed == wallpaper
          ? _value.wallpaper
          : wallpaper // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileIsoCode: freezed == mobileIsoCode
          ? _value.mobileIsoCode
          : mobileIsoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phonesVerified: freezed == phonesVerified
          ? _value._phonesVerified
          : phonesVerified // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailHidden: freezed == emailHidden
          ? _value.emailHidden
          : emailHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileHidden: freezed == mobileHidden
          ? _value.mobileHidden
          : mobileHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateJoined: freezed == dateJoined
          ? _value.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      isSelectedFromMap: freezed == isSelectedFromMap
          ? _value.isSelectedFromMap
          : isSelectedFromMap // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.id,
      this.username,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.bio,
      this.birthday,
      this.avatar,
      this.wallpaper,
      this.mobile,
      @JsonKey(name: 'mobile_iso_code') this.mobileIsoCode,
      @JsonKey(name: 'phones') final List<String>? phonesVerified,
      this.email,
      @JsonKey(name: 'email_hidden') this.emailHidden,
      @JsonKey(name: 'mobile_hidden') this.mobileHidden,
      this.createdAt,
      this.updatedAt,
      @JsonKey(name: 'date_joined') this.dateJoined,
      this.location,
      this.latitude,
      this.longitude,
      this.isSelectedFromMap,
      @JsonKey(name: 'last_seen_at') this.lastSeenAt})
      : _phonesVerified = phonesVerified;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? username;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? bio;
  @override
  final DateTime? birthday;
  @override
  final String? avatar;
  @override
  final String? wallpaper;
  @override
  final String? mobile;
  @override
  @JsonKey(name: 'mobile_iso_code')
  final String? mobileIsoCode;
  final List<String>? _phonesVerified;
  @override
  @JsonKey(name: 'phones')
  List<String>? get phonesVerified {
    final value = _phonesVerified;
    if (value == null) return null;
    if (_phonesVerified is EqualUnmodifiableListView) return _phonesVerified;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? email;
  @override
  @JsonKey(name: 'email_hidden')
  final bool? emailHidden;
  @override
  @JsonKey(name: 'mobile_hidden')
  final bool? mobileHidden;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'date_joined')
  final DateTime? dateJoined;
  @override
  final String? location;
  @override
  final num? latitude;
  @override
  final num? longitude;
  @override
  final bool? isSelectedFromMap;
//* NOT used for server-side
  @override
  @JsonKey(name: 'last_seen_at')
  final String? lastSeenAt;

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, firstName: $firstName, lastName: $lastName, bio: $bio, birthday: $birthday, avatar: $avatar, wallpaper: $wallpaper, mobile: $mobile, mobileIsoCode: $mobileIsoCode, phonesVerified: $phonesVerified, email: $email, emailHidden: $emailHidden, mobileHidden: $mobileHidden, createdAt: $createdAt, updatedAt: $updatedAt, dateJoined: $dateJoined, location: $location, latitude: $latitude, longitude: $longitude, isSelectedFromMap: $isSelectedFromMap, lastSeenAt: $lastSeenAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.wallpaper, wallpaper) ||
                other.wallpaper == wallpaper) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.mobileIsoCode, mobileIsoCode) ||
                other.mobileIsoCode == mobileIsoCode) &&
            const DeepCollectionEquality()
                .equals(other._phonesVerified, _phonesVerified) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailHidden, emailHidden) ||
                other.emailHidden == emailHidden) &&
            (identical(other.mobileHidden, mobileHidden) ||
                other.mobileHidden == mobileHidden) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.dateJoined, dateJoined) ||
                other.dateJoined == dateJoined) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isSelectedFromMap, isSelectedFromMap) ||
                other.isSelectedFromMap == isSelectedFromMap) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        username,
        firstName,
        lastName,
        bio,
        birthday,
        avatar,
        wallpaper,
        mobile,
        mobileIsoCode,
        const DeepCollectionEquality().hash(_phonesVerified),
        email,
        emailHidden,
        mobileHidden,
        createdAt,
        updatedAt,
        dateJoined,
        location,
        latitude,
        longitude,
        isSelectedFromMap,
        lastSeenAt
      ]);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
          {final int? id,
          final String? username,
          @JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          final String? bio,
          final DateTime? birthday,
          final String? avatar,
          final String? wallpaper,
          final String? mobile,
          @JsonKey(name: 'mobile_iso_code') final String? mobileIsoCode,
          @JsonKey(name: 'phones') final List<String>? phonesVerified,
          final String? email,
          @JsonKey(name: 'email_hidden') final bool? emailHidden,
          @JsonKey(name: 'mobile_hidden') final bool? mobileHidden,
          final DateTime? createdAt,
          final DateTime? updatedAt,
          @JsonKey(name: 'date_joined') final DateTime? dateJoined,
          final String? location,
          final num? latitude,
          final num? longitude,
          final bool? isSelectedFromMap,
          @JsonKey(name: 'last_seen_at') final String? lastSeenAt}) =
      _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get username;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get bio;
  @override
  DateTime? get birthday;
  @override
  String? get avatar;
  @override
  String? get wallpaper;
  @override
  String? get mobile;
  @override
  @JsonKey(name: 'mobile_iso_code')
  String? get mobileIsoCode;
  @override
  @JsonKey(name: 'phones')
  List<String>? get phonesVerified;
  @override
  String? get email;
  @override
  @JsonKey(name: 'email_hidden')
  bool? get emailHidden;
  @override
  @JsonKey(name: 'mobile_hidden')
  bool? get mobileHidden;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'date_joined')
  DateTime? get dateJoined;
  @override
  String? get location;
  @override
  num? get latitude;
  @override
  num? get longitude;
  @override
  bool? get isSelectedFromMap; //* NOT used for server-side
  @override
  @JsonKey(name: 'last_seen_at')
  String? get lastSeenAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
