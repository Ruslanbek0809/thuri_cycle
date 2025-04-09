// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      bio: json['bio'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      avatar: json['avatar'] as String?,
      wallpaper: json['wallpaper'] as String?,
      mobile: json['mobile'] as String?,
      mobileIsoCode: json['mobile_iso_code'] as String?,
      phonesVerified:
          (json['phones'] as List<dynamic>?)?.map((e) => e as String).toList(),
      email: json['email'] as String?,
      emailHidden: json['email_hidden'] as bool?,
      mobileHidden: json['mobile_hidden'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      dateJoined: json['date_joined'] == null
          ? null
          : DateTime.parse(json['date_joined'] as String),
      location: json['location'] as String?,
      latitude: json['latitude'] as num?,
      longitude: json['longitude'] as num?,
      isSelectedFromMap: json['isSelectedFromMap'] as bool?,
      lastSeenAt: json['last_seen_at'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.username case final value?) 'username': value,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.bio case final value?) 'bio': value,
      if (instance.birthday?.toIso8601String() case final value?)
        'birthday': value,
      if (instance.avatar case final value?) 'avatar': value,
      if (instance.wallpaper case final value?) 'wallpaper': value,
      if (instance.mobile case final value?) 'mobile': value,
      if (instance.mobileIsoCode case final value?) 'mobile_iso_code': value,
      if (instance.phonesVerified case final value?) 'phones': value,
      if (instance.email case final value?) 'email': value,
      if (instance.emailHidden case final value?) 'email_hidden': value,
      if (instance.mobileHidden case final value?) 'mobile_hidden': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
      if (instance.dateJoined?.toIso8601String() case final value?)
        'date_joined': value,
      if (instance.location case final value?) 'location': value,
      if (instance.latitude case final value?) 'latitude': value,
      if (instance.longitude case final value?) 'longitude': value,
      if (instance.isSelectedFromMap case final value?)
        'isSelectedFromMap': value,
      if (instance.lastSeenAt case final value?) 'last_seen_at': value,
    };
