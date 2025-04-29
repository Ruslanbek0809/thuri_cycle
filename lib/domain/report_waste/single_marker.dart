import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thuri_cycle/domain/auth/user_model/user_model.dart';
import 'package:thuri_cycle/domain/report_waste/map_marker.dart';

part 'single_marker.freezed.dart';
part 'single_marker.g.dart';

@freezed
class SingleMarkerModel with _$SingleMarkerModel {
  const factory SingleMarkerModel({
    required MapMarkerModel marker,
    required UserModel reportedByUser,
    UserModel? resolvedByUser,
    required bool canBeReported,
  }) = _SingleMarkerModel;

  factory SingleMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$SingleMarkerModelFromJson(json);
}
