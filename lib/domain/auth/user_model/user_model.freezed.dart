// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  int? get id;
  String? get username;
  @JsonKey(name: 'first_name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  String? get bio;
  DateTime? get birthday;
  String? get avatar;
  String? get wallpaper;
  String? get mobile;
  @JsonKey(name: 'mobile_iso_code')
  String? get mobileIsoCode;
  @JsonKey(name: 'phones')
  List<String>? get phonesVerified;
  String? get email;
  @JsonKey(name: 'email_hidden')
  bool? get emailHidden;
  @JsonKey(name: 'mobile_hidden')
  bool? get mobileHidden;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  @JsonKey(name: 'date_joined')
  DateTime? get dateJoined;
  String? get location;
  num? get latitude;
  num? get longitude;
  bool? get isSelectedFromMap; //* NOT used for server-side
  @JsonKey(name: 'last_seen_at')
  String? get lastSeenAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
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
                .equals(other.phonesVerified, phonesVerified) &&
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
        const DeepCollectionEquality().hash(phonesVerified),
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

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, firstName: $firstName, lastName: $lastName, bio: $bio, birthday: $birthday, avatar: $avatar, wallpaper: $wallpaper, mobile: $mobile, mobileIsoCode: $mobileIsoCode, phonesVerified: $phonesVerified, email: $email, emailHidden: $emailHidden, mobileHidden: $mobileHidden, createdAt: $createdAt, updatedAt: $updatedAt, dateJoined: $dateJoined, location: $location, latitude: $latitude, longitude: $longitude, isSelectedFromMap: $isSelectedFromMap, lastSeenAt: $lastSeenAt)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
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
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _self.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      wallpaper: freezed == wallpaper
          ? _self.wallpaper
          : wallpaper // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileIsoCode: freezed == mobileIsoCode
          ? _self.mobileIsoCode
          : mobileIsoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phonesVerified: freezed == phonesVerified
          ? _self.phonesVerified
          : phonesVerified // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailHidden: freezed == emailHidden
          ? _self.emailHidden
          : emailHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileHidden: freezed == mobileHidden
          ? _self.mobileHidden
          : mobileHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateJoined: freezed == dateJoined
          ? _self.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      isSelectedFromMap: freezed == isSelectedFromMap
          ? _self.isSelectedFromMap
          : isSelectedFromMap // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastSeenAt: freezed == lastSeenAt
          ? _self.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _UserModel implements UserModel {
  const _UserModel(
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
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

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

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
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

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, firstName: $firstName, lastName: $lastName, bio: $bio, birthday: $birthday, avatar: $avatar, wallpaper: $wallpaper, mobile: $mobile, mobileIsoCode: $mobileIsoCode, phonesVerified: $phonesVerified, email: $email, emailHidden: $emailHidden, mobileHidden: $mobileHidden, createdAt: $createdAt, updatedAt: $updatedAt, dateJoined: $dateJoined, location: $location, latitude: $latitude, longitude: $longitude, isSelectedFromMap: $isSelectedFromMap, lastSeenAt: $lastSeenAt)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
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
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_UserModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _self.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      wallpaper: freezed == wallpaper
          ? _self.wallpaper
          : wallpaper // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileIsoCode: freezed == mobileIsoCode
          ? _self.mobileIsoCode
          : mobileIsoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phonesVerified: freezed == phonesVerified
          ? _self._phonesVerified
          : phonesVerified // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailHidden: freezed == emailHidden
          ? _self.emailHidden
          : emailHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileHidden: freezed == mobileHidden
          ? _self.mobileHidden
          : mobileHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateJoined: freezed == dateJoined
          ? _self.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      isSelectedFromMap: freezed == isSelectedFromMap
          ? _self.isSelectedFromMap
          : isSelectedFromMap // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastSeenAt: freezed == lastSeenAt
          ? _self.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
