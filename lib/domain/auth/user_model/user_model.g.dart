// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profilePicture: json['profilePicture'] as String?,
      isAnonymous: json['isAnonymous'] as bool? ?? true,
      fcmToken: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      if (instance.uid case final value?) 'uid': value,
      if (instance.email case final value?) 'email': value,
      if (instance.username case final value?) 'username': value,
      if (instance.name case final value?) 'name': value,
      if (instance.phoneNumber case final value?) 'phoneNumber': value,
      if (instance.profilePicture case final value?) 'profilePicture': value,
      if (instance.isAnonymous case final value?) 'isAnonymous': value,
      if (instance.fcmToken case final value?) 'fcm_token': value,
    };
