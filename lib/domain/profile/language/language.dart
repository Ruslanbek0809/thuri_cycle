import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';
part 'language.g.dart';

@freezed
class LanguageModel with _$LanguageModel {
  @JsonSerializable(includeIfNull: false)
  factory LanguageModel({
    int? id,
    String? name,
    String? shortName,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
}
