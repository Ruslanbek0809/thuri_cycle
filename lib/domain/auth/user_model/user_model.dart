import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  @JsonSerializable(includeIfNull: false)
  const factory UserModel({
    int? id,
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
    bool? isSelectedFromMap, //* NOT used for server-side
    @JsonKey(name: 'last_seen_at') String? lastSeenAt,
  }) = _UserModel;

  factory UserModel.initial({UserModel? user}) => UserModel(
        id: user?.id,
        username: user?.username,
        firstName: user?.firstName,
        lastName: user?.lastName,
        birthday: user?.birthday,
        avatar: user?.avatar,
        wallpaper: user?.wallpaper,
        mobile: user?.mobile,
        mobileIsoCode: user?.mobileIsoCode,
        phonesVerified: user?.phonesVerified ?? [],
        email: user?.email,
        emailHidden: user?.emailHidden,
        mobileHidden: user?.mobileHidden,
        createdAt: user?.createdAt,
        updatedAt: user?.updatedAt,
        dateJoined: user?.dateJoined,
        location: user?.location,
        latitude: user?.latitude,
        longitude: user?.longitude,
        isSelectedFromMap: user?.isSelectedFromMap ?? false,
        lastSeenAt: user?.lastSeenAt,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
