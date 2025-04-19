// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(includeIfNull: false)
  const factory UserModel({
    required String? uid,
    // @JsonKey(includeToJson: false) UserStats? stats,
    String? email,
    String? username,
    String? name,
    String? phoneNumber,
    String? profilePicture,
    @Default(true) bool? isAnonymous,
    // @Default([]) List<String> bookmarks,
    @JsonKey(name: 'fcm_token') String? fcmToken,
  }) = _UserModel;

  factory UserModel.initial({UserModel? user}) => UserModel(
        uid: user?.uid,
        name: user?.name,
        username: user?.username,
        email: user?.email,
        phoneNumber: user?.phoneNumber,
        profilePicture: user?.profilePicture,
        isAnonymous: user?.isAnonymous,
        // bookmarks: user?.bookmarks,
        fcmToken: user?.fcmToken,
      );

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
